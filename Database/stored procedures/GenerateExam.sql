USE [Examination System]
GO
/****** Object:  StoredProcedure [dbo].[GenerateExam]    Script Date: 3/10/2025 12:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[GenerateExam]
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

WITH RandomQuestions AS (
    SELECT 
        Q.Question_ID, 
        Q.Question, 
        ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Question Q
    INNER JOIN Course C ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = @course_name)
    AND Q.Question_Type = 'MCQ'
)
INSERT INTO ExamQuestionsTemp (Question_ID, Question, Choice)  
SELECT Q_MCQ.Question_ID, Q_MCQ.Question, QC.Choice
FROM (
    SELECT Question_ID, Question
    FROM RandomQuestions
    WHERE rn <= @no_of_MCQs
) AS Q_MCQ
JOIN Question_Choices QC   
ON Q_MCQ.Question_ID = QC.Question_ID;

WITH RandomTFQuestions AS (
    SELECT 
        Q.Question_ID, 
        Q.Question, 
        ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Question Q
    INNER JOIN Course C ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = @course_name)
    AND Q.Question_Type = 'T/F'
)
INSERT INTO ExamQuestionsTemp (Question_ID, Question, Choice)  
SELECT Q_TF.Question_ID, Q_TF.Question, QC.Choice
FROM (
    SELECT Question_ID, Question
    FROM RandomTFQuestions
    WHERE rn <= @no_of_TFs
) AS Q_TF
JOIN Question_Choices QC
ON Q_TF.Question_ID = QC.Question_ID;


declare @e_date date = CONVERT(DATE, GETDATE());
-- Generate Exam data in the Exam Table
EXEC InsertExam @Exam_Date = @e_date, @Exam_Duration =  @exam_duration

END
END

 /*   SELECT DISTINCT TOP (5)  Q.Question_ID, Q.Question, QC.Choice, Q.Question_Type, Q.Course_ID, C.Course_Name
    FROM Question_Choices QC
    INNER JOIN Question Q ON QC.Question_ID = Q.Question_ID
    INNER JOIN Course C ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = 'SQL & Relational Databases')
    AND Question_Type = 'MCQ'
    ORDER BY NEWID()

	WITH RandomQuestions AS (
    SELECT 
        Q.Question_ID, 
        Q.Question, 
        Q.Question_Type, 
        Q.Course_ID, 
        C.Course_Name,
        ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Question Q
    INNER JOIN Course C ON Q.Course_ID = C.Course_ID
    WHERE Q.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = 'SQL & Relational Databases')
    AND Q.Question_Type = 'MCQ'
)
SELECT Q.Question_ID, Q.Question, QC.Choice, Q.Question_Type, Q.Course_ID, Q.Course_Name
FROM RandomQuestions Q
INNER JOIN Question_Choices QC ON Q.Question_ID = QC.Question_ID
WHERE rn <= 5;
*/


SELECT Instructor_Name, COUNT(Q.Question_ID)
FROM Instructor I
JOIN Ins_Creates_Qs IQ
ON I.Instructor_ID = IQ.Instructor_ID
JOIN Question Q
ON IQ.Question_ID = Q.Question_ID
GROUP BY Instructor_Name
ORDER BY 2 DESC

SELECT Instructor_Name, COUNT(DISTINCT Topic_ID)
FROM Instructor I
JOIN Ins_Teaches_Crs IC
ON I.Instructor_ID = IC.Instructor_ID
JOIN Course C
ON IC.Course_ID = C.Course_ID
JOIN Topic T
ON C.Course_ID = T.Course_ID
GROUP BY Instructor_Name
ORDER BY 2 DESC

SELECT Instructor_Name, COUNT( Topic_ID)
FROM Instructor I
JOIN Ins_Teaches_Crs IC
ON I.Instructor_ID = IC.Instructor_ID
JOIN Course C