-- GetStudentExamAnswers - Report #6
ALTER PROCEDURE GetStudentExamAnswers
    @ExamID INT,
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;

        -- Check if the Exam exists
        IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @ExamID)
        BEGIN
            PRINT 'Error: Exam does not exist.';
            RETURN;
        END

        -- Check if the Student exists
        IF NOT EXISTS (SELECT 1 FROM Student WHERE Student_ID = @StudentID)
        BEGIN
            PRINT 'Error: Student does not exist.';
            RETURN;
        END

        -- Check if the Student has taken the Exam
        IF NOT EXISTS (SELECT 1 FROM St_Takes_Exams WHERE Exam_ID = @ExamID AND Student_ID = @StudentID)
        BEGIN
            PRINT 'This Student did not take exam: No answers found for this student in the given exam.';
            RETURN;
        END

        -- Retrieve Exam Questions and Student Answers
        SELECT 
            Q.Question_ID,
            Q.Question,
            Q.Answer AS Correct_Choice,
            SE.Student_Answer AS Student_Choice,
            CASE 
                WHEN SE.Student_Answer = Q.Answer THEN 'Correct'
                ELSE 'Incorrect'
            END AS Answer_Status
        FROM Question Q
        LEFT JOIN St_Takes_Exams SE
            ON Q.Question_ID = SE.Question_ID AND SE.Exam_ID = @ExamID AND SE.Student_ID = @StudentID;

        PRINT 'Success: Exam answers retrieved successfully.';
END;

EXEC GetStudentExamAnswers @examid = 8, @studentid = 1023

SELECT * FROM Student