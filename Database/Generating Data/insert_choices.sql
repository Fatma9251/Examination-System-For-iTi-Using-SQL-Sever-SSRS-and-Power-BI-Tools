
-- course_id = 1 , MCQ choices
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES
(1, 'ls'),
(1, 'dir'),
(1, 'list'),
(1, 'show'),
(2, '/root'),
(2, '/home/username'),
(2, '/usr/bin'),
(2, '/etc/home'),
(3, 'where'),
(3, 'pwd'),
(3, 'dir'),
(3, 'cd'),
(4, 'Grants read and write permissions to all users'),
(4, 'Gives full permissions to the owner and read-execute to others'),
(4, 'Grants execution permission only to the owner'),
(4, 'Deletes the file myscript.sh'),
(5, 'grep'),
(5, 'find'),
(5, 'search'),
(5, 'locate'),
(6, 'It switches users'),
(6, 'It allows a user to execute commands as another user (usually root)'),
(6, 'It deletes files permanently'),
(6, 'It schedules tasks'),
(7, 'less'),
(7, 'head'),
(7, 'tail'),
(7, 'top'),
(8, 'Opens a file in edit mode'),
(8, 'Displays the manual pages of a command'),
(8, 'Moves files from one location to another'),
(8, 'Lists users in the system'),
(9, 'yum'),
(9, 'dnf'),
(9, 'apt'),
(9, 'rpm'),
(10, 'Creates a compressed archive of the /home/user directory'),
(10, 'Deletes the /home/user directory'),
(10, 'Extracts a backup file'),
(10, 'Moves all files from /home/user to /backup');

-- course_id = 1 , T/F 
INSERT INTO Question_Choices (Question_ID, Choice)  
VALUES  
(11, 'True'), (11, 'False'),  
(12, 'True'), (12, 'False'),  
(13, 'True'), (13, 'False'),  
(14, 'True'), (14, 'False'),  
(15, 'True'), (15, 'False'),  
(16, 'True'), (16, 'False'),  
(17, 'True'), (17, 'False'),  
(18, 'True'), (18, 'False'),  
(19, 'True'), (19, 'False'),  
(20, 'True'), (20, 'False');

-- course_id = 31, MCQ choices
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES 
(21, 'WHERE'), 
(21, 'FILTER'), 
(21, 'HAVING'), 
(21, 'ORDER BY'),

(22, 'COUNT()'), 
(22, 'SUM()'), 
(22, 'TOTAL()'), 
(22, 'NUMBER()'),

(23, 'SELECT'), 
(23, 'RETRIEVE'), 
(23, 'GET'), 
(23, 'FETCH'),

(24, 'Groups rows with similar values'), 
(24, 'Sorts data in ascending order'), 
(24, 'Filters records based on conditions'), 
(24, 'Joins two tables'),

(25, 'AVG()'), 
(25, 'MEAN()'), 
(25, 'AVERAGE()'), 
(25, 'SUM()/COUNT()'),

(26, 'DISTINCT'), 
(26, 'UNIQUE'), 
(26, 'FILTER'), 
(26, 'GROUP BY'),

(27, 'ORDER BY'), 
(27, 'SORT'), 
(27, 'GROUP BY'), 
(27, 'HAVING'),

(28, 'INNER JOIN'), 
(28, 'OUTER JOIN'), 
(28, 'LEFT JOIN'), 
(28, 'CROSS JOIN'),

(29, 'Filters grouped results'), 
(29, 'Filters individual rows'), 
(29, 'Joins tables'), 
(29, 'Sorts results'),

(30, 'INSERT INTO'), 
(30, 'ADD RECORD'), 
(30, 'APPEND'), 
(30, 'NEW ENTRY');

-- course_id = 32, MCQs choices
INSERT INTO Question_Choices (Question_ID, Choice)  
VALUES  
(31, 'Online Transaction Processing (OLTP)'),  
(31, 'Storing large volumes of raw, unstructured data'),  
(31, 'Supporting business intelligence and decision-making'),  
(31, 'Managing real-time transactions'),  

(32, 'Volatile'),  
(32, 'Time-variant'),  
(32, 'Normalized'),  
(32, 'Real-time'),  

(33, 'ELT'),  
(33, 'ETL'),  
(33, 'OLAP'),  
(33, 'Data Cleansing'),  

(34, 'Data Mart'),  
(34, 'Operational Data Store (ODS)'),  
(34, 'Online Transaction Processing (OLTP)'),  
(34, 'NoSQL Database'),  

(35, 'Star Schema'),  
(35, 'Snowflake Schema'),  
(35, 'Network Schema'),  
(35, 'Relational Schema'),  

(36, 'ETL Process'),  
(36, 'Data Staging Area'),  
(36, 'OLAP Engine'),  
(36, 'Metadata Repository'),  

(37, 'Faster transactional processing'),  
(37, 'Improved decision-making through historical data analysis'),  
(37, 'Reduced data redundancy'),  
(37, 'Real-time data updates'),  

(38, 'MOLAP'),  
(38, 'ROLAP'),  
(38, 'HOLAP'),  
(38, 'NoSQL'),  

(39, 'Data Mining'),  
(39, 'Data Integration'),  
(39, 'Data Scrubbing'),  
(39, 'Data Purging'),  

(40, 'Storing transactional data'),  
(40, 'Providing descriptive attributes for analysis'),  
(40, 'Storing aggregated measures'),  
(40, 'Executing SQL queries');

-- course_id = 33, MCQ
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES
(51, 'Data Visualization'),
(51, 'Data Entry'),
(51, 'Web Development'),
(51, 'Cloud Computing'),

(52, 'Power BI Desktop'),
(52, 'Power BI Service'),
(52, 'Power Query'),
(52, 'Power Automate'),

(53, 'Data Cleansing & Transformation'),
(53, 'Data Storage'),
(53, 'Data Encryption'),
(53, 'Data Streaming'),

(54, 'DAX'),
(54, 'SQL'),
(54, 'Python'),
(54, 'M Language'),

(55, 'Sharing & Collaborating Reports'),
(55, 'Creating New Datasets'),
(55, 'Building Databases'),
(55, 'Developing Websites'),

(56, 'DirectQuery'),
(56, 'Import Mode'),
(56, 'Excel Connection'),
(56, 'Static Data'),

(57, 'Simplifies Queries'),
(57, 'Slows Performance'),
(57, 'Complicates Relationships'),
(57, 'Limits Data Volume'),

(58, 'Manually in Model View'),
(58, 'Using SQL Queries'),
(58, 'By Writing Python Code'),
(58, 'Through Excel Formulas'),

(59, 'Drill-through'),
(59, 'Pivot Table'),
(59, 'Conditional Formatting'),
(59, 'Chart Enhancements'),

(60, 'Automates Data Refresh'),
(60, 'Deletes Old Reports'),
(60, 'Prepares Data for AI'),
(60, 'Modifies Report Layout');

-- course_id = 32, T/F
INSERT INTO Question_Choices (Question_ID, Choice)  
VALUES  
(61, 'True'), (61, 'False'),  
(62, 'True'), (62, 'False'),  
(63, 'True'), (63, 'False'),  
(64, 'True'), (64, 'False'),  
(65, 'True'), (65, 'False'),  
(66, 'True'), (66, 'False'),  
(67, 'True'), (67, 'False'),  
(68, 'True'), (68, 'False'),  
(69, 'True'), (69, 'False'),  
(70, 'True'), (70, 'False');

-- course_id = 34, MCQ
INSERT INTO Question_Choices (Question_ID, Choice)  
VALUES  
(71, 'Web Development'),  
(71, 'Data Visualization'),  
(71, 'Cloud Computing'),  
(71, 'Cybersecurity'),  

(72, 'Bar Chart'),  
(72, 'Line Chart'),  
(72, 'TreeMap'),  
(72, 'Histogram Table'),  

(73, 'Excel'),  
(73, 'SQL Server'),  
(73, 'Google Sheets'),  
(73, 'All of the above'),  

(74, 'Story Points'),  
(74, 'Calculated Fields'),  
(74, 'Filters'),  
(74, 'Actions'),  

(75, 'SUM'),  
(75, 'AVG'),  
(75, 'COUNT'),  
(75, 'MIN'),  

(76, '.twbx'),  
(76, '.twb'),  
(76, '.tde'),  
(76, '.csv'),  

(77, 'Blending'),  
(77, 'Sorting'),  
(77, 'Pivoting'),  
(77, 'Filtering'),  

(78, 'It contains categorical data'),  
(78, 'It is typically aggregated'),  
(78, 'It cannot be used in calculations'),  
(78, 'It is always discrete'),  

(79, 'Filters'),  
(79, 'Marks'),  
(79, 'Parameters'),  
(79, 'Actions'),  

(80, 'To store data offline for faster performance'),  
(80, 'To create visualizations'),  
(80, 'To write SQL queries'),  
(80, 'To generate reports automatically');

-- course_id = 33, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(81, 'T'), (81, 'F'),
(82, 'T'), (82, 'F'),
(83, 'T'), (83, 'F'),
(84, 'T'), (84, 'F'),
(85, 'T'), (85, 'F'),
(86, 'T'), (86, 'F'),
(87, 'T'), (87, 'F'),
(88, 'T'), (88, 'F'),
(89, 'T'), (89, 'F'),
(90, 'T'), (90, 'F');


-- course_id = 34, T/F
INSERT INTO Question_Choices (Question_ID, Choice)  
VALUES  
(91, 'True'), (91, 'False'),  
(92, 'True'), (92, 'False'),  
(93, 'True'), (93, 'False'),  
(94, 'True'), (94, 'False'),  
(95, 'True'), (95, 'False'),  
(96, 'True'), (96, 'False'),  
(97, 'True'), (97, 'False'),  
(98, 'True'), (98, 'False'),  
(99, 'True'), (99, 'False'),  
(100, 'True'), (100, 'False');

-- course_id = 35, MCQs
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES 
(101, 'Removing duplicates'),
(101, 'Ignoring errors'),
(101, 'Adding random values'),
(101, 'Merging unrelated datasets'),

(102, 'Deleting rows with missing values'),
(102, 'Replacing missing values with mean/median'),
(102, 'Using predictive models to fill missing values'),
(102, 'All of the above'),

(103, 'Pandas'),
(103, 'Matplotlib'),
(103, 'Seaborn'),
(103, 'TensorFlow'),

(104, 'Scales values to a standard range'),
(104, 'Removes missing values'),
(104, 'Duplicates data'),
(104, 'Deletes outliers'),

(105, 'Z-score or IQR method'),
(105, 'Removing entire dataset'),
(105, 'Duplicating the dataset'),
(105, 'Ignoring the outliers'),

(106, 'Eliminate redundant records'),
(106, 'Reduce dataset size'),
(106, 'Increase data volume'),
(106, 'Add artificial data'),

(107, 'Correcting inconsistent data types'),
(107, 'Increasing dataset size artificially'),
(107, 'Handling missing values'),
(107, 'Removing duplicates'),

(108, 'Better data consistency and accuracy'),
(108, 'Larger dataset size'),
(108, 'More missing values'),
(108, 'Reduced computational cost'),

(109, 'One-hot encoding'),
(109, 'Data duplication'),
(109, 'Outlier detection'),
(109, 'Feature extraction'),

(110, 'To improve model accuracy and reliability'),
(110, 'To make data storage easier'),
(110, 'To create more missing values'),
(110, 'To make models run slower');

-- course_id = 35, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(111, 'T'), (111, 'F'),
(112, 'T'), (112, 'F'),
(113, 'T'), (113, 'F'),
(114, 'T'), (114, 'F'),
(115, 'T'), (115, 'F'),
(116, 'T'), (116, 'F'),
(117, 'T'), (117, 'F'),
(118, 'T'), (118, 'F'),
(119, 'T'), (119, 'F'),
(120, 'T'), (120, 'F');

-- course_id = 36, MCQs
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES 
(121, 'Data Cleaning and Analysis'),
(121, 'Data Entry'),
(121, 'Graphic Design'),
(121, 'Web Development'),

(122, 'AVERAGE'),
(122, 'SUM'),
(122, 'COUNT'),
(122, 'MEDIAN'),

(123, 'Searches for a value in the first column of a range'),
(123, 'Sorts data in ascending order'),
(123, 'Removes duplicate values'),
(123, 'Applies conditional formatting'),

(124, 'PivotTables'),
(124, 'Conditional Formatting'),
(124, 'Flash Fill'),
(124, 'Find and Replace'),

(125, 'To predict future trends based on historical data'),
(125, 'To format cells automatically'),
(125, 'To insert pivot charts'),
(125, 'To merge multiple Excel files'),

(126, 'CONCATENATE (or CONCAT)'),
(126, 'SPLIT'),
(126, 'LEFT'),
(126, 'RIGHT'),

(127, 'Line Chart'),
(127, 'Pie Chart'),
(127, 'Bar Chart'),
(127, 'Scatter Plot'),

(128, 'To perform complex optimizations'),
(128, 'To create animated charts'),
(128, 'To clean raw data'),
(128, 'To apply conditional formatting'),

(129, 'COUNTIF'),
(129, 'IFERROR'),
(129, 'LEFT'),
(129, 'TRIM'),

(130, 'To extract, transform, and load data'),
(130, 'To format text in Excel'),
(130, 'To create pivot tables'),
(130, 'To perform complex calculations');

-- course_id = 27, MCQs
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES 
(131, 'Web Development'), (131, 'Data Visualization'), (131, 'Cloud Computing'), (131, 'Machine Learning'),
(132, 'Data Visualization'), (132, 'Database Management'), (132, 'Software Development'), (132, 'Network Security'),
(133, 'Bar Chart'), (133, 'Pie Chart'), (133, 'Line Chart'), (133, 'Scatter Plot'),
(134, 'Calculated Fields'), (134, 'Parameters'), (134, 'Joins'), (134, 'Measures'),
(135, 'Storing Data'), (135, 'Creating Custom Calculations'), (135, 'User Authentication'), (135, 'Exporting Reports'),
(136, 'Excel'), (136, 'SQL Server'), (136, 'Google Sheets'), (136, 'All of the Above'),
(137, 'Groups'), (137, 'Hierarchy'), (137, 'Filters'), (137, 'Bins'),
(138, 'Data Model'), (138, 'Power Query'), (138, 'Pivot Table'), (138, 'DAX'),
(139, 'Inner Join'), (139, 'Left Join'), (139, 'Right Join'), (139, 'All of the Above'),
(140, 'Power BI'), (140, 'Tableau'), (140, 'Excel'), (140, 'Google Data Studio');

-- course_id = 36, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(141, 'True'), (141, 'False'),
(142, 'True'), (142, 'False'),
(143, 'True'), (143, 'False'),
(144, 'True'), (144, 'False'),
(145, 'True'), (145, 'False'),
(146, 'True'), (146, 'False'),
(147, 'True'), (147, 'False'),
(148, 'True'), (148, 'False'),
(149, 'True'), (149, 'False'),
(150, 'True'), (150, 'False');

-- course_id = 41, MCQs
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES
(151, 'On-demand delivery of IT resources over the internet'),
(151, 'Traditional on-premises IT infrastructure'),
(151, 'Manual data storage management'),
(151, 'Offline software installation'),

(152, 'Scalability and elasticity'),
(152, 'High capital investment'),
(152, 'Manual resource allocation'),
(152, 'Limited internet access requirement'),

(153, 'Public Cloud'),
(153, 'Private Cloud'),
(153, 'Hybrid Cloud'),
(153, 'Community Cloud'),

(154, 'Infrastructure as a Service'),
(154, 'Internet as a Service'),
(154, 'Internal as a Service'),
(154, 'Integration as a Service'),

(155, 'PaaS'),
(155, 'SaaS'),
(155, 'IaaS'),
(155, 'DaaS'),

(156, 'Scalability and flexibility'),
(156, 'Higher maintenance costs'),
(156, 'Lack of automation'),
(156, 'Complex manual deployment'),

(157, 'AWS'),
(157, 'Google Cloud'),
(157, 'Microsoft Azure'),
(157, 'Oracle Excel'),

(158, 'Virtualization'),
(158, 'Physical resource allocation'),
(158, 'Local server hosting'),
(158, 'Manual resource distribution'),

(159, 'Dependency on internet connectivity'),
(159, '100% data security guarantee'),
(159, 'No risk of data breaches'),
(159, 'Elimination of IT costs'),

(160, 'SaaS'),
(160, 'PaaS'),
(160, 'IaaS'),
(160, 'DaaS');

-- course_id = 27, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(161, 'True'), (161, 'False'),
(162, 'True'), (162, 'False'),
(163, 'True'), (163, 'False'),
(164, 'True'), (164, 'False'),
(165, 'True'), (165, 'False'),
(166, 'True'), (166, 'False'),
(167, 'True'), (167, 'False'),
(168, 'True'), (168, 'False'),
(169, 'True'), (169, 'False'),
(170, 'True'), (170, 'False');

-- course_id = 139, MCQ choices
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES 
-- Question 171: What does SQL stand for?
(171, 'Structured Query Language'),
(171, 'Simple Query Language'),
(171, 'Standard Question Language'),
(171, 'Sequential Query Logic'),

-- Question 172: Which SQL statement is used to retrieve data from a database?
(172, 'SELECT'),
(172, 'FETCH'),
(172, 'GET'),
(172, 'RETRIEVE'),

-- Question 173: What type of database is SQL primarily used for?
(173, 'Relational databases'),
(173, 'NoSQL databases'),
(173, 'Hierarchical databases'),
(173, 'Document-based databases'),

-- Question 174: Which of the following is NOT a valid SQL constraint?
(174, 'ALTER KEY'),
(174, 'PRIMARY KEY'),
(174, 'FOREIGN KEY'),
(174, 'CHECK'),

-- Question 175: What SQL clause is used to filter records based on a condition?
(175, 'WHERE'),
(175, 'HAVING'),
(175, 'FILTER'),
(175, 'ORDER BY'),

-- Question 176: What is the purpose of the JOIN operation in SQL?
(176, 'To combine rows from two or more tables'),
(176, 'To delete rows from a table'),
(176, 'To filter columns in a table'),
(176, 'To modify a table structure'),

-- Question 177: Which SQL statement is used to insert new records into a table?
(177, 'INSERT INTO'),
(177, 'ADD RECORD'),
(177, 'NEW ENTRY'),
(177, 'PUT DATA'),

-- Question 178: Which SQL function is used to count the number of rows in a table?
(178, 'COUNT()'),
(178, 'SUM()'),
(178, 'TOTAL()'),
(178, 'NUMBER()'),

-- Question 179: In SQL, what is the purpose of the GROUP BY clause?
(179, 'To group records that have the same values in a specified column'),
(179, 'To sort records in descending order'),
(179, 'To limit the number of rows in a result set'),
(179, 'To rename a column in a table'),

-- Question 180: What keyword is used to update existing data in an SQL table?
(180, 'UPDATE'),
(180, 'MODIFY'),
(180, 'CHANGE'),
(180, 'ALTER');

-- course_id = 41, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(181, 'True'), (181, 'False'),
(182, 'True'), (182, 'False'),
(183, 'True'), (183, 'False'),
(184, 'True'), (184, 'False'),
(185, 'True'), (185, 'False'),
(186, 'True'), (186, 'False'),
(187, 'True'), (187, 'False'),
(188, 'True'), (188, 'False'),
(189, 'True'), (189, 'False'),
(190, 'True'), (190, 'False');

-- course_id = 21, MCQs
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES
(191, 'Pandas'), (191, 'NumPy'), (191, 'Matplotlib'), (191, 'Seaborn'),
(192, 'NumPy'), (192, 'Pandas'), (192, 'Scikit-learn'), (192, 'TensorFlow'),
(193, 'head()'), (193, 'tail()'), (193, 'info()'), (193, 'describe()'),
(194, 'np.zeros()'), (194, 'np.ones()'), (194, 'np.empty()'), (194, 'np.full()'),
(195, 'Matplotlib'), (195, 'Pandas'), (195, 'NumPy'), (195, 'Scikit-learn'),
(196, 'dropna()'), (196, 'fillna()'), (196, 'replace()'), (196, 'drop()'),
(197, 'To group data based on a column'), (197, 'To filter data'), (197, 'To merge dataframes'), (197, 'To create pivot tables'),
(198, 'read_csv()'), (198, 'to_csv()'), (198, 'import_csv()'), (198, 'load_csv()'),
(199, 'Scikit-learn'), (199, 'Matplotlib'), (199, 'NumPy'), (199, 'Pandas'),
(200, 'Tuple representing (rows, columns)'), (200, 'List of column names'), (200, 'Data type of each column'), (200, 'Number of missing values');

-- course_id = 139, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(201, 'True'), (201, 'False'),
(202, 'True'), (202, 'False'),
(203, 'True'), (203, 'False'),
(204, 'True'), (204, 'False'),
(205, 'True'), (205, 'False'),
(206, 'True'), (206, 'False'),
(207, 'True'), (207, 'False'),
(208, 'True'), (208, 'False'),
(209, 'True'), (209, 'False'),
(210, 'True'), (210, 'False');

-- course_id = 22, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(221, 'True'), (221, 'False'),
(222, 'True'), (222, 'False'),
(223, 'True'), (223, 'False'),
(224, 'True'), (224, 'False'),
(225, 'True'), (225, 'False'),
(226, 'True'), (226, 'False'),
(227, 'True'), (227, 'False'),
(228, 'True'), (228, 'False'),
(229, 'True'), (229, 'False'),
(230, 'True'), (230, 'False');

-- course_id = 22, MCQs
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES 
(211, '0.25'),
(211, '0.5'),
(211, '0.75'),
(211, '1.0'),

(212, '68%'),
(212, '75%'),
(212, '90%'),
(212, '95%'),

(213, 'Probability of observing the test results under the null hypothesis'),
(213, 'Significance level of the test'),
(213, 'Mean of the population'),
(213, 'Variance of the sample'),

(214, 'Mean'),
(214, 'Median'),
(214, 'Mode'),
(214, 'Range'),

(215, '0.5'),
(215, '1'),
(215, '10'),
(215, '100'),

(216, 'Poisson distribution'),
(216, 'Normal distribution'),
(216, 'Binomial distribution'),
(216, 'Exponential distribution'),

(217, 'Exact value of a parameter'),
(217, 'Range in which the true parameter is expected to lie with a given probability'),
(217, 'Probability of a single event'),
(217, 'Point estimate of a dataset'),

(218, 'Law of Large Numbers'),
(218, 'Central Limit Theorem'),
(218, 'Bayes’ Theorem'),
(218, 'Probability Mass Function'),

(219, 'Maximum value of a dataset'),
(219, 'Weighted average of all possible values'),
(219, 'Mode of the dataset'),
(219, 'Sum of all values in a dataset'),

(220, 'Mean'),
(220, 'Standard deviation'),
(220, 'Median'),
(220, 'Quartiles');

-- course_id = 43, MCQs
INSERT INTO Question_Choices (Question_ID, Choice)
VALUES
(231, 'ls'),
(231, 'dir'),
(231, 'list'),
(231, 'show'),

(232, '/root'),
(232, '/home/username'),
(232, '/usr/bin'),
(232, '/etc/home'),

(233, 'SELECT * FROM table'),
(233, 'SELECT ALL FROM table'),
(233, 'SHOW * FROM table'),
(233, 'FETCH * FROM table'),

(234, '192.168.1.1'),
(234, '255.255.255.0'),
(234, '127.0.0.1'),
(234, '10.0.0.1'),

(235, 'Azure Virtual Machines'),
(235, 'Azure Blob Storage'),
(235, 'Azure Functions'),
(235, 'Azure DevOps'),

(236, 'Platform as a Service (PaaS)'),
(236, 'Infrastructure as a Service (IaaS)'),
(236, 'Software as a Service (SaaS)'),
(236, 'Database as a Service (DBaaS)'),

(237, 'Azure Monitor'),
(237, 'Azure Active Directory'),
(237, 'Azure Virtual Network'),
(237, 'Azure App Service'),

(238, 'User identity and access management'),
(238, 'Cloud storage service'),
(238, 'Compute processing service'),
(238, 'Database management'),

(239, 'To connect and secure cloud resources within a private network'),
(239, 'To store unstructured data'),
(239, 'To host applications'),
(239, 'To provide machine learning models'),

(240, 'Azure DevOps'),
(240, 'Azure Data Factory'),
(240, 'Azure Kubernetes Service'),
(240, 'Azure Logic Apps');

-- course_id = 22, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(241, 'True'), (241, 'False'),
(242, 'True'), (242, 'False'),
(243, 'True'), (243, 'False'),
(244, 'True'), (244, 'False'),
(245, 'True'), (245, 'False'),
(246, 'True'), (246, 'False'),
(247, 'True'), (247, 'False'),
(248, 'True'), (248, 'False'),
(249, 'True'), (249, 'False'),
(250, 'True'), (250, 'False');

-- course_id = 43, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(251, 'True'), (251, 'False'),
(252, 'True'), (252, 'False'),
(253, 'True'), (253, 'False'),
(254, 'True'), (254, 'False'),
(255, 'True'), (255, 'False'),
(256, 'True'), (256, 'False'),
(257, 'True'), (257, 'False'),
(258, 'True'), (258, 'False'),
(259, 'True'), (259, 'False'),
(260, 'True'), (260, 'False');