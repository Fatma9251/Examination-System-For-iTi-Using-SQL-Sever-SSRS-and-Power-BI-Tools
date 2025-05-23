USE [Examination System]
GO
/****** 
Object: Trigger [dbo].[GradeCheckVSMark]    
Script Date: 3/9/2025 11:38:02 PM 
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[GradeCheckVSMark] 
ON [dbo].[St_Takes_Exams]
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

DROP TRIGGER IF EXISTS GradeCheckVSMark