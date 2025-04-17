-- GetStudentCountByInstructor - Report #3
CREATE PROCEDURE GetStudentCountByInstructor
    @InstructorID INT
AS
BEGIN
--    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @InstructorID)
    BEGIN
        PRINT 'Instructor ID not found.';
        RETURN;
    END
    
    SELECT i.Instructor_Name, 
           c.Course_Name, 
           COUNT(s.Student_ID) AS 'Students Count'
    FROM Instructor i 
    JOIN Ins_Teaches_Crs it ON i.Instructor_ID = it.Instructor_ID
    JOIN Course c ON c.Course_ID = it.Course_ID
    JOIN St_Studies_Crs sc ON c.Course_ID = sc.Course_ID
    JOIN Student s ON s.Student_ID = sc.Student_ID
    WHERE i.Instructor_ID = @InstructorID
    GROUP BY c.Course_Name, i.Instructor_Name;
END

EXEC GetStudentCountByInstructor 12

