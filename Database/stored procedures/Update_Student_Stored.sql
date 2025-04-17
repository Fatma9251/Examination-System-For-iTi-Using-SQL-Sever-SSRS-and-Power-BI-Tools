-- Stored Procedure to Update data on student table
ALTER PROC UpdateStudent
    (@StudentID INT,
    @SSN VARCHAR = NULL,  
    @FName VARCHAR(20) = NULL,
    @LName VARCHAR(20) = NULL,
    @Gender VARCHAR(1) = NULL,
    @Email VARCHAR(50) = NULL,
    @DOB DATE = NULL,
    @University VARCHAR(100) = NULL,
    @Faculty VARCHAR(50) = NULL,
    @GraduationYear INT = NULL,
    @MilitaryStatus VARCHAR(15) = NULL,
    @Freelance INT = NULL,
    @No_Certificates INT = NULL,
    @WorkStatus VARCHAR(15) = NULL,
    @Position VARCHAR(50) = NULL,
    @HiringDate DATE = NULL,
    @IntakeStartDate DATE = NULL,
	@ZipCode VARCHAR(5) = NULL, 
    @Track_ID INT = NULL,         
    @Intake_ID INT = NULL,       
    @Company_ID INT = NULL,     
    @Branch_ID INT = NULL
)
AS
BEGIN
    BEGIN TRY
        -- Check if student exists
        IF NOT EXISTS (SELECT 1 FROM student WHERE Student_ID = @StudentID)
        BEGIN
            SELECT CAST('Error: No student found with this SSN with this ID.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate SSN exists
        IF NOT EXISTS (SELECT 1 FROM student WHERE SSN = COALESCE(@SSN, SSN))
        BEGIN
            SELECT CAST('Error: No student found with this SSN.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Gender input (if provided)
        IF @Gender NOT IN ('M', 'F')
        BEGIN
            SELECT CAST('Error: Gender must be M or F.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Graduation Year (must be within the last 10 years)
        IF (@GraduationYear < YEAR(GETDATE()) - 10 OR @GraduationYear > YEAR(GETDATE()))
        BEGIN
            SELECT CAST('Error: Graduation Year must be within the last 10 years and not in the future.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Hiring Date (cannot be in the future)
        IF @HiringDate > GETDATE()
        BEGIN
            SELECT CAST('Error: Hiring Date cannot be in the future.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate Military Status based on Gender (if provided)

        IF UPPER(@Gender) = 'M' AND @MilitaryStatus NOT IN ('Completed', 'Exempted', 'Postponed')
        BEGIN
            SELECT CAST('Error: Military Status for males must be Completed, Exempted, or Postponed.' AS VARCHAR(100));
            RETURN;
        END
        ELSE IF UPPER(@Gender) = 'F' AND @MilitaryStatus <> 'NA'
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
            SELECT CAST('Error: Freelance must be either 0 or 1.' AS VARCHAR(100));
            RETURN;
        END

        -- Validate No_Certificates (must be max 3)
        IF @No_Certificates > 3 OR @No_Certificates < 0
        BEGIN
            SELECT CAST('Error: No_Certificates must be in (0,1,2,3).' AS VARCHAR(100));
            RETURN;
        END

		-- Validate Work_Status input (must be 'Employed' or 'Unemployed')
		IF lower(@WorkStatus) NOT IN ('employed', 'unemployed')
		BEGIN
			SELECT CAST('Error: Work Status must be either Employed or Unemployed.' AS VARCHAR(100));
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
            SELECT CAST('Error: Invalid Track_ID. Please choose an existing Track_ID.' AS VARCHAR(100));
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM Intake WHERE Intake_ID = @Intake_ID)
        BEGIN
            SELECT CAST('Error: Invalid Intake_ID.  Please choose an existing Intake_ID.' AS VARCHAR(100));
            RETURN;
        END

        IF @company_ID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Company WHERE Company_ID = @Company_ID)
        BEGIN
            SELECT CAST('Error: This Company ID does NOT exist, Please First Insert The Company Details in the Company Table.' AS VARCHAR(100));
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM Branch WHERE Branch_ID = @Branch_ID)
        BEGIN
            SELECT CAST('Error: Invalid Branch_ID. Please choose an existing Branch_ID.' AS VARCHAR(100));
            RETURN;
        END

        -- Perform the update
        UPDATE student
        SET
            SSN = COALESCE(@SSN, SSN),
            FName = COALESCE(@FName, FName),
            LName = COALESCE(@LName, LName),
            Gender = COALESCE(@Gender, Gender),
            Email = COALESCE(@Email, Email),
            DOB = COALESCE(@DOB, DOB),
            University = COALESCE(@University, University),
            Faculty = COALESCE(@Faculty, Faculty),
            Graduation_Year = COALESCE(@GraduationYear, Graduation_Year),
            Military_Status = COALESCE(@MilitaryStatus, Military_Status),
            Freelance = COALESCE(@Freelance, Freelance),
            No_Certificates = COALESCE(@No_Certificates, No_Certificates),
            Work_Status = COALESCE(@WorkStatus, Work_Status),
            Position = COALESCE(@Position, Position),
            Hiring_Date = COALESCE(@HiringDate, Hiring_Date),
            Intake_Start_Date = COALESCE(@IntakeStartDate, Intake_Start_Date),
			ZipCode = COALESCE(@ZipCode, ZipCode),
            Track_ID = COALESCE(@Track_ID, Track_ID),
            Intake_ID = COALESCE(@Intake_ID, Intake_ID),
            Company_ID = COALESCE(@Company_ID, Company_ID),
            Branch_ID = COALESCE(@Branch_ID, Branch_ID)

        WHERE Student_ID = @StudentID OR SSN = @SSN

        -- Confirm successful update
        SELECT CAST('Success: Student record updated successfully.' AS VARCHAR(100));
    END TRY

    BEGIN CATCH
        -- Handle unexpected SQL errors
        SELECT CAST('Error: An unexpected error occurred.' AS VARCHAR(100));
    END CATCH
END;


EXEC UpdateStudent @StudentID = 1503,
@Fname = 'Mona', @lname = 'Rizqqqqq',
@email = 'Mona.mo@gmail.com', 
@DOB = '08/18/1994',@UNIVERSITY=  'Mansoura',
@Faculty = 'Science', @graduationyear = 2017,
@WorkStatus = 'Employed', 
@IntakeStartDate = '11/11/2024', @Track_ID = 5,
@Intake_ID = 6, @Branch_ID = 14, @ZipCode = '10038', @Company_ID= 1;