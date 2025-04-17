EXEC InsertStudent
@ssn = '81810012309044',
@Fname = 'Mona', @lname = 'Rizq',
@gender = 'f', @email = 'Mona.mo@gmail.com', 
@DOB = '08/18/1994',@UNIVERSITY=  'Mansoura',
@Faculty = 'Science', @graduationyear = 2017,
@MilitaryStatus = 'NA',@Freelance = 0, 
@No_Certificates =  2, @WorkStatus = 'Unemployed', 
@IntakeStartDate = '11/11/2024', @Track_ID = 5,
@Intake_ID = 6, @Branch_ID = 14, @ZipCode = '10038', @Company_ID= NULL;

EXEC InsertStudent 
   
    @SSN = '12345678901234',
    @FName = 'John', 
    @LName = 'Doe', 
    @Gender = 'M',
    @Email = 'johndoe@email.com',
    @DOB = '2000-01-01',
    @University = 'Zagazig University',
    @Faculty = 'Computer Science',
    @GraduationYear = 2022,
    @MilitaryStatus = 'Completed',
    @Freelance = 1,
    @No_Certificates = 2,
    @WorkStatus = 'Employed',
    @Position = 'Developer',
    @HiringDate = '2023-06-01',
    @IntakeStartDate = '2023-01-01',
    @ZipCode = '10038',
    @Track_ID = 5,
    @Intake_ID = 6,
    @Company_ID = 4,   -- NULL Company ID
    @Branch_ID = 14;


-- SET IDENTITY_INSERT student ON;

SELECT * FROM student WHERE student_id = 1502

EXEC InsertStudent
@ssn = '81810012309044',
@Fname = 'Mona', @lname = 'Rizq',
@gender = 'f', @email = 'Mona.mo@gmail.com', 
@DOB = '08/18/1994',@UNIVERSITY=  'Mansoura',
@Faculty = 'Science', @graduationyear = 2017,
@MilitaryStatus = 'NA',@Freelance = 0, 
@No_Certificates =  2, @WorkStatus = 'Unemployed', 
@IntakeStartDate = '11/11/2024', @Track_ID = 5,
@Intake_ID = 6, @Branch_ID = 14, @ZipCode = '10038', @Company_ID= NULL;


EXEC InsertStudent
@ssn = '81810012654044',
@Fname = 'Mona', @lname = 'mohamed',
@gender = 'f', @email = 'Manmona.mo@gmail.com', 
@DOB = '08/18/1994',@UNIVERSITY=  'Mansoura',
@Faculty = 'Science', @graduationyear = 2017,
@MilitaryStatus = 'NA',@Freelance = 0, 
@No_Certificates =  2, @WorkStatus = 'Unemployed', 
@IntakeStartDate = '11/11/2024', @Track_ID = 5,
@Intake_ID = 6, @Branch_ID = 14, @ZipCode = '10038';
