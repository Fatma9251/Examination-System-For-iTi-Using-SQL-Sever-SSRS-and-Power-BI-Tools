CREATE TABLE Exam (
	Exam_ID INT IDENTITY PRIMARY KEY,
	Exam_Date date,
	Exam_Duration INT,
	Mark INT
	-- CONSTRAINT check_maxMark CHECK (Mark <= 10)
);
select * from exam

create procedure UpdateExam
	@E_id int ,
	@E_date date =null,
	@E_duration int =null ,
	@E_mark int =null
as
BEGIN
    SET NOCOUNT ON;
    
    -- Check if Exam_ID exists
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @E_id)
    BEGIN
        PRINT 'Exam ID does not exist.';
        RETURN;
    END
    
    -- Update the record with only the provided parameters
    UPDATE Exam
    SET Exam_Date = COALESCE(@E_date, Exam_Date),
        Exam_Duration = COALESCE(@E_duration, Exam_Duration),
        Mark = COALESCE(@E_mark, Mark)
    WHERE Exam_ID = @E_id;
    
    PRINT 'Exam updated successfully.';
END;

exec UpdateExam @e_id = 3 , @e_date ='2024-07-18'

select * from Exam

----------------------------------------------------------------------------------------------------






CREATE PROCEDURE InsertExam
    @Exam_Date DATE = NULL,
    @Exam_Duration INT = NULL,
    @Mark INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Validate input parameters
    IF @Exam_Date IS NULL OR @Exam_Duration IS NULL OR @Mark IS NULL
    BEGIN
        PRINT 'Error: All parameters (Exam_Date, Exam_Duration, and Mark) must be provided.';
        RETURN;
    END
    
    INSERT INTO Exam (Exam_Date, Exam_Duration, Mark)
    VALUES (@Exam_Date, @Exam_Duration, @Mark);
    
    PRINT 'Exam  inserted successfully.';
END;


exec InsertExam @exam_date ='3/7/2025' ,@exam_duration=169 , @Mark=150

select * from exam 
order by Exam_ID desc

-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteExam
    @Exam_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check if Exam_ID exists
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
    BEGIN
        PRINT 'Error: Exam ID does not exist.';
        RETURN;
    END
    
    -- Delete the exam record
    DELETE FROM Exam WHERE Exam_ID = @Exam_ID;
    
    PRINT 'Exam deleted successfully.';
END;


select * from exam 
order by Exam_ID desc

exec DeleteExam 1001
---------------------------------------------------------------------------------------------------
CREATE PROCEDURE ReadExam
    @Exam_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check if Exam_ID exists
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
    BEGIN
        PRINT 'Error: Exam ID does not exist.';
        RETURN;
    END
    
    -- Delete the exam record
    select * FROM Exam WHERE Exam_ID = @Exam_ID;
    
END;
exec ReadExam 900
---------------------------------------------------------------
CREATE PROC ReadAllExams
AS
BEGIN
Select *
FROM Exam
END;

EXEC ReadAllExams