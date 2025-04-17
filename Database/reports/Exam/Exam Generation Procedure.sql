CREATE TABLE ExamQuestionsTemp
(
	Question_ID INT,
	Question VARCHAR(1000),
	Choice VARCHAR(200)
)

GO;
-- generateExam('SQL & Relational Databases', 3, 7)
ALTER PROC GenerateExam
@course_name VARCHAR(100),
@no_of_MCQs INT,
@no_of_TFs INT,
@exam_duration INT = 30 
AS
BEGIN
IF NOT EXISTS (SELECT 1 FROM Course WHERE Course_Name = @course_name)
BEGIN 
	PRINT 'This Course Does NOT Exist! Please Enter an Existing Course';
	RETURN;
END
ELSE
BEGIN
-- delete all prevrious questions from the temporary ExamQuestions Table
DELETE FROM ExamQuestionsTemp;  

INSERT INTO ExamQuestionsTemp (Question_ID, Question, Choice)  
SELECT Q_MCQ.Question_ID, Q_MCQ.Question, QC.Choice
FROM (
    SELECT TOP (@no_of_MCQs) Q.Question_ID, Q.Question, QC.Choice, Q.Question_Type, Q.Course_ID, C.Course_Name
    FROM Question_Choices QC
    INNER JOIN Question Q ON QC.Question_ID = Q.Question_ID
    INNER JOIN Course C ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = @course_name)
    AND Question_Type = 'MCQ'
    ORDER BY NEWID()
) AS Q_MCQ
JOIN Question_Choices QC   
ON Q_MCQ.Question_ID = QC.Question_ID

UNION ALL

SELECT Q_TF.Question_ID, Q_TF.Question, QC.Choice
FROM (
    SELECT TOP (@no_of_TFs) Q.Question_ID, Q.Question, Q.Answer, Q.Question_Type, Q.Course_ID, C.Course_Name
    FROM Question Q
    INNER JOIN Course C ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = @course_name)
    AND Question_Type = 'T/F'
    ORDER BY NEWID()
) AS Q_TF 
JOIN Question_Choices QC
ON Q_TF.Question_ID = QC.Question_ID;


-- Generate Exam data in the Exam Table
EXEC InsertExam @Exam_Date = '1/3/2025', @Exam_Duration =  20

END
END

EXEC GenerateExam 'Microsoft Azure Basics', 5, 5


GO;
/*
ALTER VIEW blah
AS
(
SELECT Q_MCQ.Question, QC.Choice, Q_MCQ.Question_Type
FROM (
	SELECT TOP (4) Q.Question_ID, Q.Question, QC.Choice, Q.Question_Type, Q.Course_ID, C.Course_Name
    FROM Question_Choices QC
	INNER JOIN Question Q
	ON QC.Question_ID = Q.Question_ID
    INNER JOIN Course C
    ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = 'SQL & Relational Databases')
    AND Question_Type = 'MCQ'
    ORDER BY NEWID()
) AS Q_MCQ
JOIN Question_Choices QC
ON Q_MCQ.Question_ID = QC.Question_ID

UNION ALL

SELECT Q_TF.Question, QC.Choice, Q_TF.Question_Type
FROM (
	SELECT TOP (6) Q.Question_ID, Q.Question, Q.Answer, Q.Question_Type, Q.Course_ID, C.Course_Name
    FROM Question Q
    INNER JOIN Course C
    ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = 'SQL & Relational Databases')
    AND Question_Type = 'T/F'
    ORDER BY NEWID()
) AS Q_TF 
JOIN Question_Choices QC
ON Q_TF.Question_ID = QC.Question_ID
)

select * from blah
GO;
declare @counter INT = 0
WHILE @counter < 10
BEGIN
SELECT Question 
FROM blah
ORDER BY Question
OFFSET @counter ROWS FETCH NEXT 1 ROW ONLY
IF (SELECT Question_Type FROM blah ORDER BY Question
OFFSET @counter ROWS FETCH NEXT 1 ROW ONLY) = 'MCQ'
BEGIN
	SELECT Choice
	FROM blah
	ORDER BY Question
	OFFSET @counter ROWS FETCH NEXT 4 ROW ONLY
	continue;
END
IF (SELECT Question_Type FROM blah ORDER BY Question
OFFSET @counter ROWS FETCH NEXT 1 ROW ONLY) = 'T/F'
BEGIN
	SELECT Choice
	FROM blah
	ORDER BY Question
	OFFSET @counter ROWS FETCH NEXT 2 ROW ONLY
	continue;
END

SET @counter = @counter + 1
END
*/