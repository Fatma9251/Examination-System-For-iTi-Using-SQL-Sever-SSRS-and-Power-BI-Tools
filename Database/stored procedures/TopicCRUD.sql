
ALTER PROCEDURE UpdateTopic
    @TID INT,
    @TName NVARCHAR(100) ,
    @CrsID INT 
AS
BEGIN
DECLARE @Crsavailability int ;

--    SET NOCOUNT ON;
		IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @TId AND Course_ID = @CrsID)
		BEGIN
			PRINT 'This Topic ID Does NOT Exist With This Course, Please Enter Existing Data'
			RETURN;
		END

select @Crsavailability = count(*)
from Course 
where Course_ID = @CrsID

	IF @TID IS NULL Or @CrsID IS NULL
    BEGIN
        PRINT 'Error:Please enter both the topic ID and the course id .'
        RETURN;
    END


	if @Crsavailability = 0
	begin 
	print 'Course Not Found : please insert the course first'
	end

	else
	begin
    UPDATE Topic
    SET 
        Topic_Name = ISNULL(@TName, Topic_Name)
        WHERE Topic_ID = @TID
		and Course_ID = @CrsID	;

    PRINT 'Topic updated successfully!';
	end 
END;


select * from Topic
where 
Topic_ID = 200000 and Course_ID = 158
-- Topic_Name like 'Test%'


EXEC UpdateTopic @TID = 200000 , @TName ='Test Planning' , @crsID = 158

--------------------------------------------------------------------------

ALTER PROCEDURE DeleteTopic
    @TID INT = null,
    @TName NVARCHAR(100) =null ,
    @CrsID INT =null
AS
BEGIN
DECLARE @DeletedRecord NVARCHAR(500); ;

--    SET NOCOUNT ON;
if @TID is null and @CrsID is null and @TName is not null
begin
SELECT @DeletedRecord = CONCAT('Deleted Course - ID: ', Topic_ID, ', Name: ', Topic_Name ,'course id :' ,Course_ID   )
    FROM Topic
    WHERE (Topic_Name = @TName);
end

if @TID is not null and @CrsID is not null and @TName is null
begin
SELECT @DeletedRecord = CONCAT('Deleted Topic - ID: ', Topic_ID, ', Name: ', Topic_Name ,' course id :' ,Course_ID   )
    FROM Topic
    WHERE (Course_ID = @CrsID and Topic_ID = @TID );
end


	IF @TID IS NULL and @CrsID IS NULL and @TName is null
    BEGIN
        PRINT 'Error:Please enter both the topic ID and the course id  or enter the Topic name.'
        RETURN;
    END
	else if @TID IS not NULL and @CrsID IS not NULL and @TName is  null
	begin
	delete from Topic
        WHERE Topic_ID = @TID
		and Course_ID = @CrsID	;
   	end
	else if @TID IS NULL and @CrsID IS  NULL and @TName is not null
	begin
	delete from Topic
        WHERE Topic_Name = @TName	;
	end

	IF @@ROWCOUNT > 0
        PRINT @DeletedRecord;
    ELSE
        PRINT 'No matching Topic or Course found to delete.';


END;

exec DeleteTopic @TID =15220 , @CrsID=600
--@TName = 'Security Testing with JMeter'

select * from Topic
where Topic_ID=15220
crs id 152

------------------------------------------------------------------------------------------------------------
ALTER PROCEDURE InsertTopic
	@Topic_Id int ,
	@Topic_name varchar(500) ,
	@crs_id int
as 
begin

		

declare @Crsavailability int 
		
		IF EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_Id AND Course_ID = @crs_id)
		BEGIN
			PRINT 'This Topic ID Already Exists With This Course, Please Enter New Data'
			RETURN;
		END
select @Crsavailability = count(*)
from Course 
where Course_ID = @crs_id

	if @Crsavailability = 0 
	begin 
		print 'course is not found'
	end
	else if  @Crsavailability > 0 and  @Topic_Id is not null and @Topic_name is not null and @crs_id is not null
	begin
	insert into Topic values(@Topic_Id,@Topic_name,@crs_id)
	end
	else 
	begin
	   print 'Enter The Topic ID The Topic Name and The Course ID'
	end 

end;

exec InsertTopic @Topic_Id =200001 , @Topic_Name = NULL,
  @crs_id = 152

select * from Topic
where Topic_ID=200000AND
Course_ID = 152
---------------------------------------------------------------------------------------------------
CREATE PROCEDURE ReadTopic
    @TID INT = NULL,
    @TName NVARCHAR(100) = NULL,
    @CrsID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @TID IS NOT NULL OR @TName IS NOT NULL OR @CrsID IS NOT NULL
    BEGIN
        IF EXISTS (
            SELECT 1 FROM Topic
            WHERE (@TID IS NULL OR Topic_ID = @TID)
              AND (@TName IS NULL OR Topic_Name = @TName)
              AND (@CrsID IS NULL OR Course_ID = @CrsID)
        )
        BEGIN
            SELECT * FROM Topic
            WHERE (@TID IS NULL OR Topic_ID = @TID)
              AND (@TName IS NULL OR Topic_Name = @TName)
              AND (@CrsID IS NULL OR Course_ID = @CrsID);
        END
        ELSE
        BEGIN
            PRINT 'NOT EXISTS';
        END
    END
    ELSE
    BEGIN
        PRINT 'Please provide at least one parameter to search.';
    END
END;


exec readtopic @TName ='Introduction to JMeter'   -- @TID = 15220 ,@CrsID = 152
    



