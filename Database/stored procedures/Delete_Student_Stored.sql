--Stored procedure to delete from the table
CREATE PROC DeleteStudent
(	@StudentID INT = NULL,
    @SSN VARCHAR(14) = NULL)
  
AS
BEGIN
    BEGIN TRY
        -- Ensure at least one parameter is provided
        IF @StudentID IS NULL AND @SSN IS NULL
        BEGIN
            SELECT CAST('Error: You must provide either StudentID or SSN to delete a record.' AS VARCHAR(100));
            RETURN;
        END

        -- Check if the student exists
        IF NOT EXISTS (SELECT 1 FROM student WHERE Student_ID = @StudentID OR SSN = @SSN)
        BEGIN
            SELECT CAST('Error: No student found with the provided StudentID or SSN.' AS VARCHAR(100));
            RETURN;
        END
		-- Prevent deletion if student has related records in other tables
			IF @SSN IS NOT NULL AND @StudentID IS NULL
			BEGIN
				SET @StudentID = (SELECT Student_ID from Student WHERE SSN = @SSN)
			END
			IF EXISTS (SELECT 1 FROM Student_Phone WHERE Student_ID = @StudentID)
            OR EXISTS (SELECT 1 FROM ST_Studies_Crs WHERE Student_ID = @StudentID)
            OR EXISTS (SELECT 1 FROM St_Takes_Exams WHERE Student_ID = @StudentID)  

        BEGIN
            SELECT CAST('Error: Cannot delete student because related records exist in other tables.' AS VARCHAR(150));
            RETURN;
        END

        -- Delete the student record
        DELETE FROM student WHERE Student_ID = @StudentID OR SSN = @SSN;

        -- Confirm deletion
        SELECT CAST('Success: Student record deleted successfully.' AS VARCHAR(100));
    END TRY

    BEGIN CATCH
        -- Handle any unexpected errors
        SELECT CAST('Error: An unexpected error occurred during deletion.' AS VARCHAR(100));
    END CATCH
END;

