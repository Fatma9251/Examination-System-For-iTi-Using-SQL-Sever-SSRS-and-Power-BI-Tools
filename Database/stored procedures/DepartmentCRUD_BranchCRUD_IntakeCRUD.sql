---Department
DROP PROC IF EXISTS ReadDepartment;
GO;
ALTER PROCEDURE ReadDepartment
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT * FROM Department;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while fetching Department records';
    END CATCH
END;

EXEC ReadDepartment
-----------------------------------------------------------------------------------------
DROP PROC IF EXISTS InsertDepartment;
GO;
ALTER PROCEDURE InsertDepartment
	@DepartmentID INT,
    @DepartmentName VARCHAR(100),
	@Departmentmanager INT
AS
BEGIN
    SET NOCOUNT ON;
   -- BEGIN TRY
		IF EXISTS (SELECT 1 FROM Department WHERE Department_ID = @DepartmentID)
		BEGIN
			PRINT 'This Department Already Exists!';
			RETURN;
		END
		IF EXISTS (SELECT 1 FROM Department WHERE Department_Name = @DepartmentName)
		BEGIN
			PRINT 'This Department Already Exists!';
			RETURN;
		END
		IF EXISTS (SELECT 1 FROM Department WHERE Department_Manager = @Departmentmanager)
		BEGIN
			PRINT 'This Instructor is Already A Manager for another Department!';
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @Departmentmanager)
		BEGIN
			PRINT 'This Department Manager ID Does NOT Exist in the Instructor Table!';
			RETURN;
		END
        INSERT INTO Department (Department_ID, Department_Name, Department_Manager) VALUES (@DepartmentID, @DepartmentName, @Departmentmanager);
   /* END TRY
    BEGIN CATCH
        PRINT 'Error occurred while inserting into Department';
    END CATCH*/
END;
------------------------------------------------------------------------------------------
SELECT * FROM Department
EXEC InsertDepartment 13, @DepartmentName = 'Dep3', @Departmentmanager = 5

GO;

CREATE PROCEDURE UpdateDepartmentName
    @DepartmentID INT,
    @NewDepartmentName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
		IF EXISTS (SELECT 1 FROM Department WHERE Department_ID = @DepartmentID)
			BEGIN
				UPDATE Department SET Department_Name = @NewDepartmentName WHERE Department_ID = @DepartmentID;
			END
		ELSE
			BEGIN
				PRINT 'This Department ID Does NOT Exist'
			END
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while updating Department';
    END CATCH
END;
GO;
ALTER PROCEDURE UpdateDepartmentManager
    @DepartmentID INT,
    @NewManagerID INT
AS
BEGIN
    SET NOCOUNT ON;
        IF NOT EXISTS (SELECT 1 FROM Department WHERE Department_ID = @DepartmentID)
        BEGIN
            PRINT 'Error: Department does not exist.';
            RETURN;
        END
        IF EXISTS (SELECT 1 FROM Department WHERE Department_Manager = @NewManagerID)
        BEGIN
            PRINT 'This Instructor ID is Already A Manager for another Department.';
            RETURN;
        END
        UPDATE Department
        SET Department_Manager = @NewManagerID
        WHERE Department_ID = @DepartmentID;
		PRINT 'Success: Department Manager updated successfully.';
END;
GO;
--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteDepartment
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;
        IF NOT EXISTS (SELECT 1 FROM Department WHERE Department_ID = @DepartmentID)
        BEGIN
            PRINT 'Cannot delete Department. does not exist.';
            RETURN;
        END
		IF EXISTS (SELECT 1 FROM Track WHERE Department_ID = @DepartmentID)
        BEGIN
            PRINT 'Cannot delete Department. It has associated tracks.';
            RETURN;
        END
		 IF EXISTS (SELECT 1 FROM Instructor WHERE Department_ID = @DepartmentID)
        BEGIN
            PRINT 'Cannot delete Department. It has associated instructor.';
            RETURN;
        END
        DELETE FROM Department WHERE Department_ID = @DepartmentID;
		PRINT 'Department deleted successfully.';
END;
-----------------------------------------------------------------------------------------------
GO;
---BRANCH
CREATE PROCEDURE ReadBranch
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT * FROM Branch;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while fetching Branch records';
    END CATCH
END;
-----------------------------------------------------------------------------------
GO;
CREATE PROCEDURE InsertBranch
    @BranchName VARCHAR(20),
	@Branchloc  VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		IF EXISTS (SELECT 1 FROM Branch WHERE Branch_Name = @BranchName)
		BEGIN
			PRINT 'This Branch Already Exists!';
			RETURN;
		END
        INSERT INTO Branch (Branch_Name, Branch_Location) VALUES (@Branchname, @Branchloc);
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while inserting into Branch';
    END CATCH
END;
--------------------------------------------------------------------------------------

GO;
CREATE PROCEDURE UpdateBranchName
    @BranchID INT,
    @NewBranchName VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		IF EXISTS (SELECT 1 FROM Branch WHERE Branch_ID = @BranchID)
		BEGIN
			UPDATE Branch SET Branch_Name = @NewBranchName WHERE Branch_ID = @BranchID;
		END
		ELSE
		BEGIN
			PRINT 'This Branch Does NOT Exist!'
		END
    END TRY
    BEGIN CATCH
        PRINT 'Error Occurred while updating Branch';
    END CATCH
END;
GO;
CREATE PROCEDURE UpdateBranchLocation
    @BranchID INT,
    @NewBranchLoc VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		IF EXISTS (SELECT 1 FROM Branch WHERE Branch_ID = @BranchID)
		BEGIN
			UPDATE Branch SET Branch_Location = @NewBranchLoc WHERE Branch_ID = @BranchID;
		END
		ELSE
		BEGIN
			PRINT 'This Branch Does NOT Exist!'
		END
    END TRY
    BEGIN CATCH
        PRINT 'Error Occurred while updating Branch';
    END CATCH
END;
----------------------------------------------------------------------------------------------
GO;

CREATE PROCEDURE DeleteBranchByID
    @BranchID INT
AS
BEGIN
    SET NOCOUNT ON;
	 IF NOT EXISTS (SELECT 1 FROM Branch WHERE Branch_ID = @BranchID)
        BEGIN
            PRINT 'This Branch ID does not exist';
            RETURN;
        END
		 IF EXISTS (SELECT 1 FROM Student WHERE Branch_ID = @BranchID)
        BEGIN
            PRINT 'Cannot delete Branch. It has associated students.';
            RETURN;
        END
		 IF EXISTS (SELECT 1 FROM Branch_Launches_Intakes WHERE Branch_ID = @BranchID)
        BEGIN
            PRINT 'Cannot delete Branch. It has associated intakes.';
            RETURN;
        END
        IF EXISTS (SELECT 1 FROM Branch_Includes_Tracks WHERE Branch_ID = @BranchID)
        BEGIN
            PRINT 'Cannot delete Branch. It has associated tracks.';
            RETURN;
        END
        DELETE FROM Branch WHERE Branch_ID = @BranchID;
		PRINT 'Branch deleted successfully.';
END;
----------------------------------------------------------------------------------------------------
GO;
---INTAKE
CREATE PROCEDURE ReadIntake
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT * FROM Intake;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while fetching Intake records';
    END CATCH
END;
---------------------------------------------------------------------------------------------------------
GO;
ALTER PROCEDURE InsertIntake
    @IntakeNum INT,
	@Intaketype VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		IF EXISTS (SELECT 1 FROM Intake WHERE Intake_Number = @IntakeNum)
		BEGIN 
			PRINT 'This Intake Already Exist'
		END
		ELSE IF UPPER(@Intaketype) NOT IN ('PTP', 'ICC')
		BEGIN
			PRINT 'The Intake Type should be either PTP or ICC'
		END
		ELSE 
		BEGIN
			INSERT INTO Intake (Intake_Number, Type) VALUES (@IntakeNum, Upper(@Intaketype));
		END
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while inserting into Intake';
    END CATCH
END;
SELECT * FROM INTAKE
EXEC InsertIntake 18, 'pTp'
-------------------------------------------------------------------------------------------------------------------

GO;
CREATE PROCEDURE UpdateIntake
    @IntakeID INT,
    @NewIntakeNum INT,
	@Intaketype VARCHAR(20)
WITH ENCRYPTION
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM Intake WHERE Intake_ID = @IntakeID)
		BEGIN 
			PRINT 'This Intake Does NOT Exist'
		END
		IF EXISTS (SELECT 1 FROM Intake WHERE Intake_Number = @NewIntakeNum)
		BEGIN 
			PRINT 'This Intake Number Already Exist'
		END
		ELSE IF UPPER(@Intaketype) NOT IN ('PTP', 'ICC')
		BEGIN
			PRINT 'The Intake Type should be either PTP or ICC'
		END
		ELSE 
		BEGIN
			UPDATE Intake SET Intake_Number = @NewIntakeNum, Type = @Intaketype WHERE Intake_ID = @IntakeID;
		END
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while updating Intake';
    END CATCH
END;
--------------------------------------------------------------------------------------------------------------------------
GO;
CREATE PROCEDURE DeleteIntakeByID
    @IntakeID INT
AS
BEGIN
    SET NOCOUNT ON;
	    IF NOT EXISTS (SELECT 1 FROM Intake WHERE Intake_ID = @IntakeID)
        BEGIN
            PRINT 'This ID does not exist.';
            RETURN;
        END
        IF EXISTS (SELECT 1 FROM Student WHERE Intake_ID = @IntakeID)
        BEGIN
            PRINT 'Cannot delete Department. It has associated students.';
            RETURN;
        END
		 IF EXISTS (SELECT 1 FROM Branch_Launches_Intakes WHERE Intake_ID = @IntakeID)
        BEGIN
            PRINT 'Cannot delete Department. It has associated branches.';
            RETURN;
        END
        DELETE FROM Intake WHERE Intake_ID = @IntakeID;
		PRINT 'Intake deleted successfully';
END;
-----------------------------------------------------------------------------------------------------------------------------



