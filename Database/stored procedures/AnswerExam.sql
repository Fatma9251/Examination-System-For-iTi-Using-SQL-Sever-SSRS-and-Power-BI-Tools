-- answerExam(1009, 1001, 'ANSWERS')  -- i.e. ANSWERS: ans1, ans2, ans3, .. etc
-- answerExamQuestion(1009, 1001, 1, 'ans1') 
-- answerExamQuestion(1009, 1001, 2, 'ans2') 
-- answerExamQuestion(1009, 1001, 3, 'ans3') 

CREATE TABLE EneteredStudentAnswers
(
	ans_rn INT,
	St_Answer VARCHAR(MAX)
)
CREATE TABLE StudentExamQuestions
(
	eq_rn INT,
	exam_id INT, 
	student_id INT,
	q_id INT
)
GO;
ALTER PROC AnswerExam
@exam_id INT, 
@student_id INT,
@St_answers VARCHAR(MAX)
AS
BEGIN
	-- tempView to hold the Student Answers
	DELETE FROM EneteredStudentAnswers;    -- Empty the Student Answers Table
	INSERT INTO EneteredStudentAnswers (ans_rn, St_Answer)
		SELECT  ROW_NUMBER() OVER (ORDER BY (select null)) AS ans_rn, value AS St_Answer
		FROM STRING_SPLIT(@St_answers, ',');


	-- tempView for the exam questions that the student took
	DELETE FROM StudentExamQuestions;	-- Empty the Exam Table
	INSERT INTO StudentExamQuestions (eq_rn, exam_id, student_id, q_id)
	SELECT ROW_NUMBER() OVER (ORDER BY (select null)) AS eq_rn, 
	@exam_id as exam_id, 
	@student_id as student_id, 
	Question_ID
	FROM Exam_Questions
	WHERE Exam_ID = @exam_id

    INSERT INTO St_Takes_Exams (Exam_ID, Student_ID, Question_ID, Student_Answer)
	SELECT SEQ.exam_id, SEQ.student_id, SEQ.q_id, SA.St_Answer
	FROM StudentExamQuestions SEQ
	JOIN EneteredStudentAnswers SA
	ON SEQ.eq_rn = SA.ans_rn
END
GO;

EXEC AnswerExam 1009, 1002, 'Structured Query Language,Relational databases,1212,To group records that have the same values in a specified column,True,False,True,False,a1,a2,a3'


/*
SELECT * FROM St_Takes_Exams
SELECT * FROM #EneteredStudentAnswers
SELECT * FROM #StudentExamQuestions
    INSERT INTO St_Takes_Exams (Exam_ID, Student_ID, Question_ID, Student_Answer)
	SELECT SEQ.exam_id, SEQ.student_id, SEQ.q_id, SA.St_Answer
	FROM #StudentExamQuestions SEQ
	JOIN #EneteredStudentAnswers SA
	ON SEQ.eq_rn = SA.ans_rn


SELECT name, type_desc 
FROM sys.triggers 
WHERE parent_id = OBJECT_ID('St_Takes_Exams');
*/
