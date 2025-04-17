---create 
CREATE PROCEDURE InsertInstructor
    @Instructor_ID INT,
    @Instructor_Name VARCHAR(20),
    @SSN VARCHAR(14),
    @Salary INT,
    @DOB DATE,
    @Email VARCHAR(100),
    @ZipCode VARCHAR(5),
    @University VARCHAR(100),
    @Hiring_Date DATE,
    @Department_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Department WHERE Department_ID = @Department_ID)
    BEGIN
        PRINT 'Error: Department_ID does not exist';
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM Address WHERE ZipCode = @ZipCode)
    BEGIN
        PRINT 'Error: ZipCode does not exist';
        RETURN;
    END

    INSERT INTO Instructor (Instructor_ID, Instructor_Name, SSN, Salary, DOB, Email, ZipCode, University, Hiring_Date, Department_ID)
    VALUES (@Instructor_ID, @Instructor_Name, @SSN, @Salary, @DOB, @Email, @ZipCode, @University, @Hiring_Date, @Department_ID);
END;

GO;

---READ
CREATE PROCEDURE GetAllInstructors
AS
BEGIN
    SELECT * FROM Instructor;
END;
-- READ Instructors in Department_ID 
-- READ Instrutor info ID 
GO;
CREATE PROCEDURE GetInstructorsByDepartmentID
    @Department_ID INT
AS
BEGIN
    SELECT 
       *
    FROM Instructor
    WHERE Department_ID = @Department_ID;
END;
GO;
CREATE PROCEDURE GetInstructorByID
    @Instructor_ID INT
AS
BEGIN
    SELECT  *
    FROM Instructor
    WHERE Instructor_ID = @Instructor_ID;
END;
GO;
---Update
CREATE PROCEDURE UpdateInstructor
    @Instructor_ID INT,
    @Instructor_Name VARCHAR(20),
    @SSN VARCHAR(14),
    @Salary INT,
    @DOB DATE,
    @Email VARCHAR(100),
    @ZipCode VARCHAR(5),
    @University VARCHAR(100),
    @Hiring_Date DATE,
    @Department_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @Instructor_ID)
    BEGIN
        PRINT 'Instructor not found!';
        RETURN;
    END;
    UPDATE Instructor
    SET 
        Instructor_Name = @Instructor_Name,
        SSN = @SSN,
        Salary = @Salary,
        DOB = @DOB,
        Email = @Email,
        ZipCode = @ZipCode,
        University = @University,
        Hiring_Date = @Hiring_Date,
        Department_ID = @Department_ID
    WHERE Instructor_ID = @Instructor_ID;
END;

-- Update Instructor Salary
GO;
---Delete 
CREATE PROCEDURE DeleteInstructor
    @Instructor_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @Instructor_ID)
    BEGIN
        PRINT 'Instructor not found!';
        RETURN;
    END;
    IF EXISTS (SELECT 1 FROM Ins_Teaches_Crs WHERE Instructor_ID = @Instructor_ID) OR
       EXISTS (SELECT 1 FROM Ins_Creates_Qs WHERE Instructor_ID = @Instructor_ID) OR
       EXISTS (SELECT 1 FROM Instructor_Phone WHERE Instructor_ID = @Instructor_ID) OR
       EXISTS (SELECT 1 FROM Track WHERE Track_Manager = @Instructor_ID) OR
       EXISTS (SELECT 1 FROM Department WHERE Department_Manager = @Instructor_ID) 
    BEGIN
        PRINT 'Cannot delete instructor. It has related records in other tables!';
        RETURN;
    END;
    DELETE FROM Instructor WHERE Instructor_ID = @Instructor_ID;

    PRINT 'Instructor deleted successfully!';
END;

GO;
-- Track CRUD
-- Create
CREATE PROCEDURE AddTrack
    @Track_ID INT,
    @Track_Name VARCHAR(100),
    @Track_Manager INT,
    @Department_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Department WHERE Department_ID = @Department_ID)
    BEGIN
        PRINT 'Error: Department_ID does NOT exist';
        RETURN;
	END
	IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @Track_Manager)
    BEGIN
        PRINT 'Error: The Instructor to be the Track Manager does NOT exist';
        RETURN;
	END


    INSERT INTO Track (Track_ID, Track_Name, Track_Manager, Department_ID)
    VALUES (@Track_ID, @Track_Name, @Track_Manager, @Department_ID);
END;

GO;
---Read
CREATE PROCEDURE ReadTrack
AS
BEGIN
    SELECT * FROM Track;
END;

GO;
CREATE PROCEDURE GetTrackByID
    @Track_ID INT
AS
BEGIN
    SELECT  *
    FROM Track
    WHERE Track_ID = @Track_ID;
END;

GO;
---Update
CREATE PROCEDURE UpdateTrack
    @Track_ID INT,
    @Track_Name VARCHAR(100),
    @Track_Manager INT,
    @Department_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
    BEGIN
        PRINT 'Track not found!';
        RETURN;
    END;
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @Track_Manager)
    BEGIN
        PRINT 'Track Manager (Instructor) not found!';
        RETURN;
    END;
    IF NOT EXISTS (SELECT 1 FROM Department WHERE Department_ID = @Department_ID)
    BEGIN
        PRINT 'Department not found!';
        RETURN;
    END;
    UPDATE Track
    SET 
        Track_Name = @Track_Name,
        Track_Manager = @Track_Manager,
        Department_ID = @Department_ID
    WHERE Track_ID = @Track_ID;;
END;
GO;
CREATE PROCEDURE UpdateTrackManager
    @Track_ID INT,
    @Instructor_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
    BEGIN
        PRINT 'Track not found!';
        RETURN;
    END;
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @Instructor_ID)
    BEGIN
        PRINT 'Instructor not found!';
        RETURN;
    END;

    UPDATE Track
    SET Track_Manager = @Instructor_ID
    WHERE Track_ID = @Track_ID;
END;
GO;
---delete
CREATE PROCEDURE DeleteTrack
    @Track_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
    BEGIN
        PRINT 'Track not found!';
        RETURN;
    END;
    IF EXISTS (SELECT 1 FROM Student WHERE Track_ID = @Track_ID)
    BEGIN
        PRINT 'Cannot delete Track: Students are assigned to this track!';
        RETURN;
    END;
    IF EXISTS (SELECT 1 FROM Branch_Includes_Tracks WHERE Track_ID = @Track_ID)
    BEGIN
        PRINT 'Cannot delete Track: It is linked to a Branch!';
        RETURN;
    END;
    DELETE FROM Track WHERE Track_ID = @Track_ID;

    PRINT 'Track deleted successfully!';
END;






