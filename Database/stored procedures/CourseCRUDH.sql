
CREATE TABLE Course(
	Course_ID INT IDENTITY PRIMARY KEY,
	Course_Name VARCHAR(30),
	Duration_Hrs INT 
);

ALTER TABLE Course
ALTER COLUMN Course_Name VARCHAR(100)

ALTER TABLE Course
ADD CONSTRAINT crs_name_unique UNIQUE (Course_Name);


CREATE PROCEDURE UpdateCourse
    @CrsID INT,
    @CrsName NVARCHAR(100) = NULL,
    @CrsDuration INT = NULL
AS
BEGIN
--    SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Course WHERE Course_ID = @CrsID)
	BEGIN
		UPDATE Course
		SET 
			Course_Name = ISNULL(@CrsName, Course_Name),
			Duration_Hrs = ISNULL(@CrsDuration, Duration_Hrs)
		WHERE Course_ID = @CrsID;

		PRINT 'Course updated successfully!';
	END
	ELSE
	BEGIN
		PRINT 'This Course ID Does NOT Exist, Please Enter an Existing Course!'
	END
END;


select * from Course
where Course_ID = 151

EXEC UpdateCourse @CrsID = 151, @CrsName = 'API Testing with Postman', @CrsDuration = 30;
----------------------------------------------------------------------------

CREATE PROCEDURE InsertCourse
    @CrsName NVARCHAR(100) ,
    @CrsDuration INT 
AS
BEGIN
--    SET NOCOUNT ON;
    insert into Course(Course_Name , Duration_Hrs)
    values(@CrsName , @CrsDuration)
    

    PRINT 'Course inserted successfully!';
END;


select max(Course_ID ) from Course
select * from Course

EXEC InsertCourse  @CrsName = 'Hisk' , @CrsDuration = 7 ;

-----------------------------------------------------------------------
CREATE PROCEDURE DeleteCourse 
    @CrsID INT = NULL, 
    @CrsName NVARCHAR(100) = NULL
AS
BEGIN
--    SET NOCOUNT ON;
    
    DECLARE @DeletedRecord NVARCHAR(500);
    
    -- Check if want to delete with  ID or Name is 
    IF @CrsID IS NULL AND @CrsName IS NULL
    BEGIN
        PRINT 'Error: Please enter either an ID or a Name to delete the Course.'
        RETURN;
    END
    
    --catch the deleted record
    SELECT @DeletedRecord = CONCAT('Deleted Course - ID: ', Course_ID, ', Name: ', Course_Name)
    FROM Course
    WHERE (Course_ID = @CrsID OR @CrsName IS NOT NULL AND Course_Name = @CrsName);
    
    -- Delete the record
    DELETE FROM Course
    WHERE (Course_ID = @CrsID OR @CrsName IS NOT NULL AND Course_Name = @CrsName);
    
    -- Check if a record was deleted
    IF @@ROWCOUNT > 0
        PRINT @DeletedRecord;
    ELSE
        PRINT 'No matching record found to delete.';
END;

EXEC DeleteCourse @CrsID = 160
	-- @CrsName ='Hisk'  ;

select * from Course
order by Course_ID desc

--------------------------------------------------------------------------------

CREATE PROCEDURE SelectCourse 
    @CrsID INT = NULL, 
    @CrsName NVARCHAR(100) = NULL
AS
BEGIN
--    SET NOCOUNT ON;
    
    
    -- Check if want to select with  ID or Name is 
    IF @CrsID IS NULL AND @CrsName IS NULL
    BEGIN
        PRINT 'Error: Please enter either an ID or a Name to delete the Course.'
        RETURN;
    END
   
    Select * FROM Course
    WHERE (Course_ID = @CrsID OR @CrsName IS NOT NULL AND Course_Name = @CrsName);

END;

EXEC SelectCourse --@CrsID = 150
 @CrsName ='Test Automation with Selenium'  ;
