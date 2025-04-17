-- Trigger on St_Takes_Exams to check the Student's Grade is less than or equal the Full Mark of the Exam 
CREATE TRIGGER GradeCheckVSMark 
ON St_Takes_Exams
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Exam e ON i.Exam_ID = e.Exam_ID
        WHERE i.Grade > e.Mark
    )
    BEGIN
        THROW 50000, 'Grade cannot be greater than the full Mark in Exam table', 1;
        ROLLBACK TRANSACTION;
    END
END;