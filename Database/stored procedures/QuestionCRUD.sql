-- CRUD
SELECT * FROM Question
-- Create a question
ALTER PROC InsertMCQ_Question
	@ins_id INT,
	@crs_id INT, 
	@q VARCHAR(1000), 
	@choice1 VARCHAR(200),
	@choice2 VARCHAR(200),
	@choice3 VARCHAR(200),
	@choice4 VARCHAR(200),
	@ans VARCHAR(200)
AS
BEGIN
	DECLARE @new_q_id INT

	IF EXISTS (SELECT 1 FROM Course WHERE Course_ID = @crs_id) AND EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @ins_id)
	BEGIN 
		IF EXISTS (SELECT 1 FROM Question WHERE Question = @q AND Course_ID = @crs_id AND Instructor_ID = @ins_id)
		BEGIN
			PRINT 'This Question Already Exists!';
			RETURN;
		END
		ELSE
		BEGIN
		-- Insert the question
		INSERT INTO Question (Question, Answer, Question_Type, Course_ID, Instructor_ID)
		VALUES (@q, @ans, 'MCQ', @crs_id, @ins_id)
		-- Get the current question_id
		SET @new_q_id = SCOPE_IDENTITY(); 
		-- INSSERT the choices for this question
		INSERT INTO Question_Choices (Question_ID, Choice)
		VALUES (@new_q_id, @choice1),
			   (@new_q_id, @choice2),
			   (@new_q_id, @choice3),
			   (@new_q_id, @choice4)
		END
	END
	ELSE 
	BEGIN
		PRINT 'This Course Or Instructor Does NOT Exist, Please Choose Another Course ID or Enter another Instructor ID!';
	END

END;

GO 
-- Insert T/F Question
ALTER PROC InsertTF_Quesstion
@ins_id INT,
@crs_id INT,
@q VARCHAR(1000),
@ans VARCHAR(200)
AS
BEGIN
	DECLARE @new_q_id INT
	IF EXISTS (SELECT 1 FROM Course WHERE Course_ID = @crs_id) AND EXISTS (SELECT 1 FROM Instructor WHERE Instructor_ID = @ins_id)
	BEGIN 
		IF EXISTS (SELECT 1 FROM Question WHERE Question = @q AND Course_ID = @crs_id AND Instructor_ID = @ins_id)
		BEGIN
			PRINT 'This Question Already Exists!';
			RETURN;
		END
		ELSE
		BEGIN
		-- Insert the question
		INSERT INTO Question (Question, Answer, Question_Type, Course_ID, Instructor_ID)
		VALUES (@q, @ans, 'T/F', @crs_id, @ins_id)
		-- get the current question_id
		SET @new_q_id = SCOPE_IDENTITY();
		-- insert the true and false choices along with the question_id
		INSERT INTO Question_Choices (Question_ID, Choice)
		VALUES (@new_q_id, 'True'),
			   (@new_q_id, 'False')
		END
	END
	ELSE
	BEGIN
		PRINT 'This Course Or Instructor Does NOT Exist, Please Choose Another Course ID or Enter another Instructor ID!';
	END
END;

GO;
-- Update the question
ALTER PROCEDURE UpdateFullQuestion
    @q_id INT,
    @new_question_text VARCHAR(1000),
    @new_answer VARCHAR(200),
    @choice1 VARCHAR(200),
    @choice2 VARCHAR(200),
    @choice3 VARCHAR(200),
    @choice4 VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE question_id = @q_id)
    BEGIN
        UPDATE Question
        SET Question = @new_question_text, Answer = @new_answer
        WHERE Question_ID = @q_id;

        DELETE FROM Question_Choices WHERE Question_ID = @q_id;
        
        INSERT INTO Question_Choices (Question_ID, Choice) VALUES 
            (@q_id, @choice1),
            (@q_id, @choice2),
            (@q_id, @choice3),
            (@q_id, @choice4);
    END
    ELSE
    BEGIN
        PRINT 'Question ID Does NOT Exist!';
    END
END;


GO;
-- Update only the question text
ALTER PROCEDURE UpdateQuestionText
    @q_id INT,
    @new_question_text VARCHAR(1000)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE question_id = @q_id)
    BEGIN
        UPDATE Question
        SET Question = @new_question_text
        WHERE Question_ID = @q_id;
    END
    ELSE
    BEGIN
        PRINT 'Question ID Does NOT Exist!';
    END
END;

GO;
-- Update the Answer of an existing question
ALTER PROCEDURE UpdateAnswer
    @q_id INT,
    @new_answer VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE Question_ID = @q_id)
    BEGIN
        UPDATE Question
        SET Answer = @new_answer
        WHERE Question_ID = @q_id;
    END
    ELSE
    BEGIN
        PRINT 'Question ID Does NOT Exist!';
    END
END;

GO;
-- Update the Choices of an existing question
ALTER PROCEDURE UpdateChoices
    @q_id INT,
    @choice1 VARCHAR(200),
    @choice2 VARCHAR(200),
    @choice3 VARCHAR(200),
    @choice4 VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE Question_ID = @q_id)
    BEGIN
        DELETE FROM Question_Choices WHERE Question_ID = @q_id;
        
        INSERT INTO Question_Choices(Question_ID, Choice) VALUES 
            (@q_id, @choice1),
            (@q_id, @choice2),
            (@q_id, @choice3),
            (@q_id, @choice4);
    END
    ELSE
    BEGIN
        PRINT 'Question ID Does NOT Exist!';
    END
END;
GO;
-- Delete A Question and its Choices
ALTER PROCEDURE DeleteQuestion
    @q_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE Question_ID = @q_id)
    BEGIN
        DELETE FROM Question_Choices WHERE Question_ID = @q_id;
        DELETE FROM Question WHERE Question_ID = @q_id;
        PRINT 'Question and its Choices are Deleted Successfully!';
    END
    ELSE
    BEGIN
        PRINT 'Question ID Does NOT Exist!';
    END
END;

GO;
-- READ 

-- Get Question and Its Choices by Question_ID
CREATE PROCEDURE GetQuestionWithChoices
    @q_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE Question_ID = @q_id)
    BEGIN
        SELECT q.Question_ID, q.Question, qc.Choice
        FROM Question q
        LEFT JOIN Question_Choices qc ON q.Question_ID = qc.Question_ID
        WHERE q.Question_ID = @q_id;
    END
    ELSE
    BEGIN
        PRINT 'No Question Found with this ID!';
    END
END;
GO;
-- Get Questions By Course_ID
CREATE PROC GetCourseQuestions
@crs_id INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Question WHERE Course_ID = @crs_id)
	BEGIN
		SELECT Question, Answer
		FROM Question
		WHERE Course_ID = @crs_id
	END
	ELSE
		PRINT 'This Course Does NOT Exist, Please Choose Another Course ID!';
END

-- MCQ for "DB Design and Optimization"
-- Question:
-- Which of the following is the best approach to improve query performance in a relational database?
-- A) Normalize all tables to the highest normal form
-- B) Avoid using indexes to reduce storage overhead
-- C) Use proper indexing on frequently queried columns  "the correct answer"
-- D) Store all data in a single large table to minimize joins

EXEC InsertMCQ_Question 
@crs_id = 200,
@q = 'Which of the following is the best approach to improve query performance in a relational database?',
@ans = 'Use proper indexing on frequently queried columns',
@choice1 = 'Normalize all tables to the highest normal form',
@choice2 = 'Avoid using indexes to reduce storage overhead',
@choice3 = 'Use proper indexing on frequently queried columns',
@choice4 = 'Store all data in a single large table to minimize joins'




EXEC InsertTF_Quesstion 
@crs_id = 8, 
@q = 'In database design, normalization helps reduce data redundancy and improve data integrity?',
@ans = 'True';
GO;

EXEC DeleteQuestion @q_id = 261

EXEC GetQuestionWithChoices 1