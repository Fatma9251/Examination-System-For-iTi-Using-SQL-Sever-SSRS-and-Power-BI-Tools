CREATE PROCEDURE GetCourseTopics   -- Report 4
    @Course_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
    BEGIN
        PRINT 'Course not found!';
        RETURN;
    END;
    SELECT 
        Topic_ID, 
        Topic_Name, 
        Course_ID
    FROM Topic
    WHERE Course_ID = @Course_ID;
END;

go;
EXEC GetCourseTopics 150
GO;
CREATE PROCEDURE GetExamQuestionsAndChoices   -- Report 5
    @Exam_Number INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_Number)
    BEGIN
        PRINT 'Exam not found!';
        RETURN;
    END;
    SELECT 
        Q.Question_ID, 
        Q.Question, 
        Qc.Choice 
    FROM Question_Choices Qc
    INNER JOIN Question Q ON Qc.Question_ID = Q.Question_ID
    INNER JOIN St_Takes_Exams SE ON Q.Question_ID = SE.Question_ID
	inner join Exam E on E.Exam_ID = SE.Exam_ID
    WHERE E.Exam_ID = @Exam_Number;
END;

EXEC GetExamQuestionsAndChoices @Exam_Number = 8;