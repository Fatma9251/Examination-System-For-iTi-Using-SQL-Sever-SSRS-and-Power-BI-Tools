-- Generate Exam 
-- EXEC GenerateExam 'course_name', [no_of_mcqs], [no_of_TF], [optional_exam_duration]
SELECT Course_Name
FROM Course
WHERE Course_ID IN (SELECT DISTINCT Course_ID FROM Question)


EXEC GenerateExam 'Tableau for Data Visualization', 5, 5, 30
SELECT * FROM ExamQuestionsTemp

SELECT * FROM EXAM
SELECT * FROM Exam_Questions 

-- Student Answers Exams

-- EXEC AnswerExam [Exam_ID], [Student_ID], [list of comma separated answers: 'ans1,ans2,ans3,..,ans10']

-- students that study the course 
SELECT s.Student_ID
FROM Student s
JOIN St_Studies_Crs sc
ON s.Student_ID = sc.Student_ID
WHERE sc.Course_ID = (SELECT Course_ID FROM Course WHERE Course_Name = 'Tableau for Data Visualization')
-- the correct answers to the questions that the students should solve
SELECT Answer
FROM Question Q 
JOIN Exam_Questions QE ON Q.Question_ID = QE.Question_ID
WHERE QE.Exam_ID = 1026;  ------->
-- choices
SELECT Choice
FROM Question_Choices QC
JOIN Question Q ON QC.Question_ID = Q.Question_ID
JOIN Exam_Questions QE ON Q.Question_ID = QE.Question_ID
WHERE QE.Exam_ID = 1026;  -------->

EXEC AnswerExam 1026, 1213, 'Histogram,All of the above,Filters,COUNT,It is typically aggregated,False,False,False,True,True' 

SELECT *
FROM St_Takes_Exams
WHERE Student_ID = 1213 
AND Exam_ID = 1026


-- Correct The Students Exam Answers
-- EXEC CorrectExam [exam_id], [student_id]

EXEC CorrectExam 1026, 1213

SELECT * 
FROM St_Takes_Exams
WHERE Student_ID = 1213 
AND Exam_ID = 1026

SELECT * 
FROM St_Takes_Exams
