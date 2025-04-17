-- CREATE
CREATE PROC InsertCompany
@company_name VARCHAR(20),
@location VARCHAR(50),
@type VARCHAR(50)
AS 
BEGIN
	IF lower(@type) NOT IN ('national', 'multi-national', 'multi_national', 'multinational')
	BEGIN 
		PRINT 'The Company type should be either [National] or [Multi-National]';
		PRINT 'Please, Enter a valid type';
		RETURN;
	END
	ELSE
	BEGIN
		INSERT INTO Company (Name, Location, Type)
		VALUES (@company_name, @location, @type)
	END
END
GO
-- READ
CREATE PROC GetCompany
@company_id INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Company WHERE Company_ID = @company_id)
	BEGIN
		SELECT *
		FROM Company
		WHERE Company_ID = @company_id
	END
	ELSE
	BEGIN
		PRINT 'This Company ID Does NOT Exist, Please Enter Another Company ID!';
	END
END
GO
-- READ A COMPANY INFO BY NAME
CREATE PROC GetCompanyByName
@company_name INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Company WHERE Name = @company_name)
	BEGIN
		SELECT *
		FROM Company
		WHERE Name = @company_name
	END
	ELSE
	BEGIN
		PRINT 'This Company Does NOT Exist, Please Enter Another Company!';
	END
END
GO
-- READ ALL COMPANIES
CREATE PROC GetAllCompanies
AS
BEGIN
		SELECT *
		FROM Company
END
GO
-- Update 
CREATE PROC UpdateCompanyLocation
@company_id INT,
@new_location VARCHAR(50)
AS
BEGIN
	IF EXISTS  (SELECT 1 FROM Company WHERE Company_ID = @company_id)
	BEGIN 
		UPDATE Company
		SET Location = @new_location
		WHERE Company_ID = @company_id
	END
	ELSE
	BEGIN
		PRINT 'There is NO Company with this ID, Please Enter Another Company ID!';
	END
END
GO;
-- Update Company's Type
CREATE PROC UpdateCompanyType
@company_id INT,
@new_type VARCHAR(50)
AS
BEGIN
	IF EXISTS  (SELECT 1 FROM Company WHERE Company_ID = @company_id)
	BEGIN 
		UPDATE Company
		SET Type = @new_type
		WHERE Company_ID = @company_id
	END
	ELSE
	BEGIN
		PRINT 'There is NO Company with this ID, Please Enter Another Company ID!';
	END
END

GO;
 -- Update Company's Name
CREATE PROC UpdateCompanyName
@company_id INT,
@new_name VARCHAR(50)
AS
BEGIN
	IF EXISTS  (SELECT 1 FROM Company WHERE Company_ID = @company_id)
	BEGIN 
		UPDATE Company
		SET Name = @new_name
		WHERE Company_ID = @company_id
	END
	ELSE
	BEGIN
		PRINT 'There is NO Company with this ID, Please Enter Another Company ID!';
	END
END
GO;
-- Delete Company
CREATE PROC DeleteCompanyByID
@company_id INT
AS
BEGIN
	IF EXISTS  (SELECT 1 FROM Company WHERE Company_ID = @company_id)
	BEGIN 
		DELETE FROM Company
		WHERE Company_ID = @company_id
	END
	ELSE
	BEGIN
		PRINT 'There is NO Company with this ID, Please Enter Another Company ID!';
	END
END

GO;
-- Delete Company by its name
CREATE PROC DeleteCompanyByName
@company_name INT
AS
BEGIN
	IF EXISTS  (SELECT 1 FROM Company WHERE Name = @company_name)
	BEGIN 
		DELETE FROM Company
		WHERE Name = @company_name
	END
	ELSE
	BEGIN
		PRINT 'There is NO Company with this ID, Please Enter Another Company ID!';
	END
END
