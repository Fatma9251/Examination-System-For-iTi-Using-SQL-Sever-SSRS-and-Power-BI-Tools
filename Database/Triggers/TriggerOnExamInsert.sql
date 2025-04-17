ALTER TRIGGER InsertExamQuestions
ON Exam
AFTER INSERT
AS
BEGIN
	-- Feed the Exam_Questions Table
	INSERT INTO Exam_Questions (Exam_ID, Question_ID)
	SELECT DISTINCT Exam_ID, Question_ID
	FROM inserted, ExamQuestionsTemp
END