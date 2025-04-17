-- Course CRUD
-- Create
CREATE PROC InsertCourse 
@crs_name varchar(100), @duration INT
AS
BEGIN
	INSERT INTO Course(Course_Name, Duration_Hrs) 
	VALUES (@crs_name, @duration)
END;
GO

-- Read all course data
CREATE PROC ReadAllCourse 
AS
BEGIN
	SELECT *
	FROM Course
END;
GO

-- Read based on crs_id
CREATE PROC ReadCoursebyID 
@crs_id INT
AS
BEGIN
	SELECT *
	FROM Course
	Where Course_ID = @crs_id
END;
GO

-- Update
ALTER PROC UpdateCourseDuration
@crs_id INT, @duration INT
AS
BEGIN
	UPDATE Course 
	SET Duration_Hrs = @duration
	WHERE Course_ID = @crs_id
END;
GO
EXEC UpdateCourseDuration @crs_id = 1, @duration = 21
GO
CREATE PROC UpdateCourseName
@crs_id INT, @crs_name VARCHAR(100)
AS
BEGIN
	UPDATE Course 
	SET Course_Name = @crs_name
	WHERE Course_ID = @crs_id
END;

-- DELETE 
CREATE PROC DeleteCourse 
@crs_id INT
AS
BEGIN
	DELETE FROM Course WHERE Course_ID = @crs_id
END;
GO


