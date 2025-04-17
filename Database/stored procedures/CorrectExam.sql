
ALTER PROC CorrectExam
@exam_id INT,
@student_id INT
AS
BEGIN
	UPDATE ST
	SET ST.Grade = CASE 
						WHEN Q.Answer = ST.Student_Answer THEN 1 
						ELSE 0 
					END
	FROM St_Takes_Exams ST
	JOIN Question Q ON ST.Question_ID = Q.Question_ID
	JOIN Exam_Questions QE ON Q.Question_ID = QE.Question_ID
	WHERE ST.Student_ID = @student_id 
	AND QE.Exam_ID = @exam_id;
END

EXEC CorrectExam 1009, 1002
/*
SELECT * FROM St_Takes_Exams
	SELECT Answer
	FROM St_Takes_Exams ST
	JOIN Question Q ON ST.Question_ID = Q.Question_ID
	JOIN Exam_Questions QE ON Q.Question_ID = QE.Question_ID
	WHERE ST.Student_ID = 1001
	AND QE.Exam_ID = 1009;
*/
