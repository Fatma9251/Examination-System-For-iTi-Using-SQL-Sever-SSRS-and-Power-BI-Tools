--1.PROC to returns the students information according to Department No. parameter.
CREATE PROC GetStudentsByDepartment
@DepartmentNo INT   ---GetStudentsByDepartment
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Department WHERE Department_ID = @DepartmentNo)
	BEGIN
		SELECT s.*
		FROM student s
		INNER JOIN Track t
		ON s.track_id = t.track_id
		INNER JOIN department d
		ON d.department_id = t.department_id
		WHERE d.department_id = @DepartmentNo
	END
	ELSE
	BEGIN
		PRINT 'This Department Does NOT Exist!';
	END
END;

SELECT * FROM dbo.Department  -- All Department Data

EXEC GetStudentsByDepartment @DepartmentNo = 7;  --Check PROC

--------------------------------------------------------------
GO;
--2.PROC takes the student ID and returns the grades of the student in all courses. % 
CREATE PROC GetStudentGrades 
@StudentID INT     -- Report 2
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Student WHERE Student_ID = @StudentID)
	BEGIN
			SELECT 
			s.Student_ID, 
			s.FName + ' ' + s.LName AS [Full Name], 
			c.Course_ID, 
			c.Course_Name,
			ste.Exam_id, 
			E.Exam_Date,
			CAST(SUM(ste.Grade) * 100.0 /SUM(E.MARK) AS DECIMAL(5,2)) AS [Grade %]
		FROM Course c
		INNER JOIN st_studies_Crs stcr 
			ON c.course_id = stcr.course_id
		INNER JOIN student s 
			ON s.student_id = stcr.student_id
		INNER JOIN st_takes_exams ste 
			ON s.Student_ID = ste.Student_ID
		INNER JOIN Exam E 
			ON ste.exam_id = E.exam_id  
		WHERE s.Student_ID = @StudentID
		GROUP BY s.Student_ID, s.FName, s.LName, ste.Exam_id, E.Exam_Date, c.Course_ID, c.Course_Name;
	END
	ELSE
		PRINT 'This Student ID Does NOT Exist!'
END
------------------------------------------------------------------------
