CREATE TABLE Address(
	ZipCode VARCHAR(5) PRIMARY KEY,
	City VARCHAR (20)
);

CREATE TABLE Student(
	Student_ID INT IDENTITY PRIMARY KEY,
	SSN VARCHAR(14) UNIQUE NOT NULL,
	FName VARCHAR(20) NOT NULL,
	LName VARCHAR(20) NOT NULL,
	Gender VARCHAR(1),
	Email VARCHAR(50) UNIQUE,
	DOB DATE,
	University VARCHAR(20),
	Faculty VARCHAR(50),
	Graduation_Year INT,
	Military_Status VARCHAR(15) DEFAULT 'NA',
	Freelance INT DEFAULT 0,
	NO_Certificates INT DEFAULT 0,
	Work_Status VARCHAR(15) DEFAULT 'Unemployed',
	Position VARCHAR(50),
	Hiring_Date DATE,
	Intake_Start_Date DATE,
	ZipCode VARCHAR(5), -- FK
	Track_ID INT,       -- FK
	Intake_ID INT,      -- FK
	Company_ID INT,     -- FK
	Branch_ID INT,      --FK
	CONSTRAINT checkFreelanced CHECK (Freelance IN (0,1)),
	CONSTRAINT checkNo_Certificates CHECK (No_Certificates IN (0, 1, 2, 3)),
	CONSTRAINT checkGraduation_Year CHECK ((YEAR(GETDATE()) - Graduation_Year) <= 10),
	CONSTRAINT FK_SZ FOREIGN KEY (ZipCode) REFERENCES Address(ZipCode),
	CONSTRAINT FK_ST FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID),
	CONSTRAINT FK_SI FOREIGN KEY (Intake_ID) REFERENCES Intake(Intake_ID),
	CONSTRAINT FK_SC FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

ALTER TABLE student 
DROP CONSTRAINT checkGraduation_Year;

ALTER TABLE student 
ALTER COLUMN University VARCHAR(100);

ALTER TABLE student 
DROP COLUMN Intake_Start_Date

ALTER TABLE dbo.Student  
ADD Intake_Start_Date DATE;

ALTER TABLE student 
ALTER COLUMN Graduation_Year date;

ALTER TABLE student
ADD Branch_id int;

ALTER TABLE student
ADD CONSTRAINT FK_Branch_student FOREIGN KEY(Branch_id)
REFERENCES branch(Branch_id);


CREATE TABLE Student_Phone(
	Student_ID INT,  -- FK
	Phone VARCHAR(14),
	PRIMARY KEY (Student_ID, Phone),
	CONSTRAINT FK_SP FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

Create Table St_Studies_Crs(
	Student_ID INT,  -- FK
	Course_ID INT,   -- FK
	PRIMARY KEY (Student_ID, Course_ID),
	CONSTRAINT FK_SS FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
	CONSTRAINT FK_CS FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE Table Track_Courses(
	Track_ID INT,  -- FK
	Course_ID INT,   -- FK
	PRIMARY KEY (Track_ID, Course_ID),
	CONSTRAINT FK_TT FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID),
	CONSTRAINT FK_CC FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Instructor (
    Instructor_ID INT IDENTITY PRIMARY KEY,
    Instructor_Name VARCHAR(20),
    SSN VARCHAR(14),
    Salary INT,
    DOB DATE,
    Email VARCHAR(20),
    ZipCode VARCHAR(5),  -- FK
    University VARCHAR(20),
    Hiring_Date DATE,
    Department_ID INT,    -- FK
	CONSTRAINT FK_ID FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID), 
	CONSTRAINT FK_IZ FOREIGN KEY (ZipCode) REFERENCES Address(ZipCode)
);

ALTER TABLE dbo.Instructor
ALTER COLUMN Email VARCHAR(100);

ALTER TABLE dbo.Instructor
ALTER COLUMN University VARCHAR(100);

CREATE TABLE Ins_Creates_Qs (
    Instructor_ID INT,  -- FK
    Question_ID INT,    -- FK
	PRIMARY KEY (Instructor_ID, Question_ID),
	CONSTRAINT FK_IC FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
	CONSTRAINT FK_CQ FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
);

CREATE TABLE Ins_Teaches_Crs (
    Instructor_ID INT,  -- FK
    Course_ID INT,		-- FK
	PRIMARY KEY (Instructor_ID, Course_ID),
	CONSTRAINT FK_IT FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
	CONSTRAINT FK_CT FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
); 


CREATE TABLE Instructor_Phone (
    Instructor_ID INT,  -- FK
    Phone Varchar(14),
	PRIMARY KEY (Instructor_ID, Phone),
	CONSTRAINT FK_IP FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE Company (
    Company_ID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Location VARCHAR(50) DEFAULT 'Unknown',
    Type VARCHAR(50)
);

CREATE TABLE St_Takes_Exams (
    Student_ID INT NOT NULL,  -- FK
    Exam_ID INT NOT NULL,     -- FK
    Question_ID INT NOT NULL, -- FK
    Student_Answer VARCHAR(255),
    Grade INT -- CHECK (Grade BETWEEN 0 AND 10) DEFAULT NULL,
    PRIMARY KEY (Student_ID, Exam_ID, Question_ID),
	CONSTRAINT FK_TS FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
	CONSTRAINT FK_TE FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID),
	CONSTRAINT FK_TQ FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
);


CREATE TABLE Branch_Includes_Tracks (
    Branch_ID INT NOT NULL,  -- FK
    Track_ID INT NOT NULL,   -- FK
    PRIMARY KEY (Branch_ID, Track_ID),
	CONSTRAINT FK_BI FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID), 
	CONSTRAINT FK_TI1 FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID)
);

ALTER TABLE dbo.Branch_Includes_Tracks
DROP CONSTRAINT PK__Branch_I__E7147229730908D7

ALTER TABLE Branch_Includes_Tracks
ADD CONSTRAINT PK_BranchTracks PRIMARY KEY (Branch_ID, Track_ID);

CREATE TABLE Branch_Launches_Intakes (
    Branch_ID INT NOT NULL,   -- FK
    Intake_ID INT NOT NULL,   -- FK
    PRIMARY KEY (Branch_ID, Intake_ID),
	CONSTRAINT FK_BL FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID), 
	CONSTRAINT FK_IL FOREIGN KEY (Intake_ID) REFERENCES Intake(Intake_ID) 
);

ALTER TABLE Branch_Launches_Intakes
add CONSTRAINT branch_INtake PRIMARY KEY (Branch_ID, Intake_ID);

ALTER TABLE Branch_Launches_Intakes
ADD CONSTRAINT branch_Intake PRIMARY KEY (Intake_id, branch_id);


CREATE TABLE Exam (
	Exam_ID INT IDENTITY PRIMARY KEY,
	Exam_Date date,
	Exam_Duration INT,
	Mark INT
	-- CONSTRAINT check_maxMark CHECK (Mark <= 10)
);

ALTER TABLE EXAM 
DROP CONSTRAINT check_maxMark 

CREATE TABLE Course(
	Course_ID INT IDENTITY PRIMARY KEY,
	Course_Name VARCHAR(30),
	Duration_Hrs INT 
);

ALTER TABLE Course
ALTER COLUMN Course_Name VARCHAR(100)

ALTER TABLE Course
ADD CONSTRAINT crs_name_unique UNIQUE (Course_Name)

CREATE TABLE Topic(
	Topic_ID INT,
	Topic_Name VARCHAR(20),
	Course_ID INT, -- FK
	PRIMARY KEY (Topic_ID, Course_ID),
	CONSTRAINT FK_TC FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) 
);

ALTER TABLE Topic
ALTER COLUMN Topic_Name VARCHAR(100)

CREATE TABLE Question(
	Question_ID INT IDENTITY PRIMARY KEY,
	Question VARCHAR(1000),
	Answer VARCHAR(10),
	Question_Type VARCHAR(4),
	Course_ID INT, -- FK
	CONSTRAINT FK_QC FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) 
);

ALTER TABLE Question 
ADD Instructor_ID INT

ALTER TABLE Question  
ADD CONSTRAINT IQ_FK FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID);

CREATE TABLE Question_Choices(
	Question_ID INT,  -- FK
	Choice VARCHAR(100)
	PRIMARY KEY (Question_ID, Choice),
	CONSTRAINT FK_QCs FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID) 
);

CREATE TABLE Department(
	Department_ID INT PRIMARY KEY,
	Department_Name VARCHAR(20),
	Department_Manager INT   -- FK
);

ALTER TABLE Department 
ALTER COLUMN Department_Name VARCHAR(100);

ALTER TABLE Department 
ADD CONSTRAINT FK_DM FOREIGN KEY (Department_Manager) REFERENCES Instructor(Instructor_ID);


CREATE TABLE Track(
	Track_ID INT IDENTITY PRIMARY KEY,
	Track_Name VARCHAR(20),
	Track_manager INT,  -- FK
	Department_id INT,  -- FK
    CONSTRAINT FK_TI FOREIGN KEY (Track_manager) REFERENCES Instructor(Instructor_Id),
	CONSTRAINT FK_TD FOREIGN KEY (Department_id) REFERENCES Department(Department_Id)
);

ALTER TABLE dbo.Track
ALTER COLUMN track_name VARCHAR(100);

CREATE TABLE Intake(
	Intake_ID INT IDENTITY PRIMARY KEY,
	Intake_Number INT,
	Type VARCHAR(20)
);

CREATE TABLE Branch(
	Branch_ID  INT IDENTITY PRIMARY KEY,
	Branch_Name VARCHAR(20),
	Branch_Location VARCHAR(20)
);



