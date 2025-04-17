----Stored to Insert data into student table

ALTER PROC InsertStudent
(
    @SSN VARCHAR(14),  
    @FName VARCHAR(20),
    @LName VARCHAR(20),
    @Gender VARCHAR(1),
    @Email VARCHAR(50),
    @DOB DATE,
    @University VARCHAR(100),
    @Faculty VARCHAR(50),
    @GraduationYear INT,
    @MilitaryStatus VARCHAR(15),
    @Freelance INT = 0,
    @No_Certificates INT = 0,
    @WorkStatus VARCHAR(15) = 'Unemployed',
    @Position VARCHAR(50) = 'NA',
    @HiringDate DATE = NULL,
    @IntakeStartDate DATE,
    @ZipCode VARCHAR(5), 
    @Track_ID INT,         
    @Intake_ID INT,       
    @Company_ID INT = NULL,     
    @Branch_ID INT
)
AS
BEGIN
    BEGIN TRY
        -- Validate SSN length
        IF LEN(CAST(@SSN AS VARCHAR(14))) <> 14 
        BEGIN
            SELECT CAST('Error: National ID must be 14 digits.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Gender input
        IF Upper(@Gender) NOT IN ('M', 'F')
        BEGIN
            SELECT CAST('Error: Gender must be M or F.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Graduation Year (must be within the last 10 years and not in the future)
        IF @GraduationYear < (YEAR(GETDATE()) - 10) OR @GraduationYear > YEAR(GETDATE())
        BEGIN
            SELECT CAST('Error: Graduation Year must be within the last 10 years and not in the future.' AS VARCHAR(100));
            RETURN;
        END
		-- Validate Work_Status input (must be 'Employed' or 'Unemployed')
		IF lower(@WorkStatus) NOT IN ('employed', 'unemployed')
		BEGIN
			SELECT CAST('Error: Work Status must be either Employed or Unemployed.' AS VARCHAR(100));
			RETURN;
		END

        -- Validate Hiring Date (cannot be in the future)
        IF @HiringDate > GETDATE()
        BEGIN
            SELECT CAST('Error: Hiring Date cannot be in the future.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Military Status based on Gender
        IF Upper(@Gender) = 'M' AND @MilitaryStatus NOT IN ('Completed', 'Exempted', 'Postponed')
        BEGIN
            SELECT CAST('Error: Military Status for males must be Completed, Exempted, or Postponed.' AS VARCHAR(100));
            RETURN;
        END
        ELSE IF Upper(@Gender) = 'F' AND @MilitaryStatus <> 'NA'
        BEGIN
            SELECT CAST('Error: Military Status for females must be NA.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate that Intake Start Date is before Hiring Date
        IF @IntakeStartDate > @HiringDate
        BEGIN
            SELECT CAST('Error: Intake Start Date must be before Hiring Date.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Freelance (must be 0 or 1)
        IF @Freelance NOT IN (0, 1)
        BEGIN
            SELECT CAST('Error: Freelance must be either 0 or 1 as 1: Yes or 0: No.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate No_Certificates (must be max 3)
        IF @No_Certificates > 3 OR @No_Certificates < 0
        BEGIN
            SELECT CAST('Error: No_Certificates must be in (0,1,2,3).' AS VARCHAR(100));
            RETURN;
        END

        -- Check if the student already exists (by StudentID or SSN)
        IF EXISTS (SELECT 1 FROM student WHERE SSN = @SSN)
        BEGIN
            SELECT CAST('Error: Student with this SSN already exists.' AS VARCHAR(100));
            RETURN;
        END

		  -- Check if foreign key values exist in parent tables
        IF NOT EXISTS (SELECT 1 FROM address WHERE ZipCode = @ZipCode)
        BEGIN
            SELECT CAST('Error: Invalid ZipCode. It is not a valid address.' AS VARCHAR(100));
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
        BEGIN
            SELECT CAST('Error: Invalid Track_ID. Please choose an existing Track_ID' AS VARCHAR(100));
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM Intake WHERE Intake_ID = @Intake_ID)
        BEGIN
            SELECT CAST('Error: Invalid Intake_ID. Please choose an existing Intake_ID.' AS VARCHAR(100));
            RETURN;
        END

         IF @Company_ID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM company WHERE Company_ID = @Company_ID) 
        BEGIN
            SELECT CAST('This Company ID does NOT exist, Please First Insert The Company Details in the Company Table.' AS VARCHAR(100));
            RETURN;
        END
		
        IF NOT EXISTS (SELECT 1 FROM Branch WHERE Branch_ID = @Branch_ID)
        BEGIN
            SELECT CAST('Error: Invalid Branch_ID. Please choose an existing Branch_ID.' AS VARCHAR(100));
            RETURN;
        END

        -- Insert the new student record
        INSERT INTO student 
        (
            SSN, FName, LName, Gender, Email, DOB, 
            University, Faculty, Graduation_Year, Military_Status, Freelance, 
            No_Certificates, Work_Status, Position, Hiring_Date, Intake_Start_Date,
            ZipCode, Track_ID, Intake_ID, Company_ID,Branch_ID
        )
        VALUES 
        (
            @SSN, @FName, @LName, @Gender, @Email, @DOB, 
            @University, @Faculty, @GraduationYear, @MilitaryStatus, @Freelance, 
            @No_Certificates, @WorkStatus, @Position, @HiringDate, @IntakeStartDate,
            @ZipCode, @Track_ID, @Intake_ID, @Company_ID, @Branch_ID
        );

        -- Confirm successful insertion
        SELECT CAST('Success: Student record inserted successfully.' AS VARCHAR(100));
    END TRY

  BEGIN CATCH
        -- Handle unexpected SQL errors
        SELECT CAST('Error: An unexpected error occurred.' AS VARCHAR(100));
    END CATCH
END;



