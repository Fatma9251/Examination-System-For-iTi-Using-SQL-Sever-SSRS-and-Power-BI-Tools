----Stored to select from student table
CREATE PROC ReadStudent
   ( @StudentID INT= NULL,
    @SSN VARCHAR(14) = NULL,  
    @FName VARCHAR(20) = NULL,
    @LName VARCHAR(20) = NULL,
    @Email VARCHAR(50) = NULL)

AS
BEGIN
    -- Search by StudentID
    IF @StudentID IS NOT NULL    
	BEGIN
        IF EXISTS (SELECT 1 FROM student WHERE Student_ID = @StudentID)
            SELECT * FROM student WHERE Student_ID = @StudentID;
        ELSE
            SELECT CAST('Student ID is not found' AS VARCHAR(100));
        RETURN;
	 END

    -- Search by SSN
		IF @SSN IS NOT NULL   
		BEGIN
			IF LEN(@SSN) = 14  
			BEGIN
				IF EXISTS (SELECT 1 FROM student WHERE SSN = @SSN)
					SELECT * FROM student WHERE SSN = @SSN;
				ELSE
					SELECT CAST('National ID is not found' AS VARCHAR(100));
			END
			ELSE
				SELECT CAST('National ID must be 14 digits.' AS VARCHAR(100));
        
			RETURN; 
		END
  -- Search by First Name, Last Name, AND Email together
		IF @FName IS NOT NULL AND @LName IS NOT NULL AND @Email IS NOT NULL
		BEGIN
			IF EXISTS (SELECT 1 FROM student WHERE FName = @FName AND LName = @LName AND Email = @Email)
			BEGIN
				SELECT * FROM Student WHERE FName = @FName AND LName = @LName AND Email = @Email;
			END
			ELSE
			BEGIN
				SELECT CAST('Error: There is erorr with First Name or Last Name or and Email.' AS VARCHAR(100)) AS Message;
			END
			RETURN; 
		END
	-- Search by First Name AND Last Name together
		IF @FName IS NOT NULL AND @LName IS NOT NULL  
		BEGIN
			IF EXISTS (SELECT 1 FROM student WHERE FName = @FName AND LName = @LName)
			BEGIN
				SELECT * FROM Student WHERE FName = @FName AND LName = @LName;
			END
			ELSE
			BEGIN
				SELECT CAST('Error: First and Last Name do not exist.' AS VARCHAR(100)) AS Message;
			END
			RETURN; 
		END

	-- If the user provides only one of First Name or Last Name
		IF (@FName IS NOT NULL AND @LName IS NULL) OR (@FName IS NULL AND @LName IS NOT NULL)
		BEGIN
			SELECT CAST('Error: You must provide both First Name and Last Name together.' AS VARCHAR(100)) AS Message;
			RETURN;
		END
	-- Search by Email separately
		IF @Email IS NOT NULL  
		BEGIN
			IF EXISTS (SELECT 1 FROM student WHERE Email = @Email)
			BEGIN
				SELECT * FROM Student WHERE Email = @Email;
			END
			ELSE
				SELECT CAST('Error: Email is not exists.' AS VARCHAR(100)) AS Message;
			RETURN; 
		END

    -- If no parameters are provided
    SELECT CAST('No search criteria provided.' AS VARCHAR(100));
END;

GO; 

CREATE PROC ReadAllStudent
AS
BEGIN
SELECT * FROM dbo.Student
END;
