USE [Examination System]
GO
/****** Object:  StoredProcedure [dbo].[GetStudentGrades]    Script Date: 3/10/2025 1:41:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[GetStudentGrades] 
@StudentID INT     -- Report 2
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Student WHERE Student_ID = @StudentID)
	BEGIN
			SELECT 
			s.Student_ID, 
			s.FName + ' ' + s.LName AS [Full Name], 
			c.Course_Name,	
			SUM(Grade)
		FROM Course c
		INNER JOIN st_studies_Crs stcr 
			ON c.course_id = stcr.course_id
		INNER JOIN student s 
			ON s.student_id = stcr.student_id
		INNER JOIN st_takes_exams ste 
			ON s.Student_ID = ste.Student_ID
		WHERE s.Student_ID = @StudentID
		GROUP BY s.Student_ID, s.FName, s.LName, c.Course_Name;
	END
	ELSE
		PRINT 'This Student ID Does NOT Exist!'
END
------------------------------------------------------------------------

EXEC GetStudentGrades 1270

/*SELECT Course_ID
FROM St_Studies_Crs
JOIN Student
ON Student.Student_ID = St_Studies_Crs.Student_ID
WHERE Student.Student_ID = 1270
SELECT * FROM St_Takes_Exams*/
SELECT * FROM St_Takes_Exams


