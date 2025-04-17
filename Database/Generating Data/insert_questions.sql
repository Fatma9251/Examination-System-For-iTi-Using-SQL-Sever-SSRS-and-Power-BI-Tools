-- DELETE FROM Question
-- DBCC CHECKIDENT ('Question', RESEED, 0);
-- course_id = 1, MCQ 
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)  
VALUES  
('Which command is used to list the contents of a directory in Linux?', 'ls', 'MCQ', 1),  
('What is the default home directory for a regular Linux user?', '/home/username', 'MCQ', 1),  
('Which command is used to display the current working directory?', 'pwd', 'MCQ', 1),  
('What does the chmod 755 myscript.sh command do?', 'Gives full permissions to the owner and read-execute to others', 'MCQ', 1),  
('Which of the following commands is used to search for a specific word inside a file?', 'grep', 'MCQ', 1),  
('What is the purpose of the sudo command in Linux?', 'It allows a user to execute commands as another user (usually root)', 'MCQ', 1),  
('Which command is used to view the first 10 lines of a file?', 'head', 'MCQ', 1),  
('What is the function of the man command in Linux?', 'Displays the manual pages of a command', 'MCQ', 1),  
('Which of the following is a package manager for Debian-based distributions?', 'apt', 'MCQ', 1),  
('What does the tar -czf backup.tar.gz /home/user command do?', 'Creates a compressed archive of the /home/user directory', 'MCQ', 1);

-- course_id = 1 , T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)  
VALUES  
('Linux is an open-source operating system.', 'True', 'T/F', 1),  
('The root user in Linux has the same permissions as a standard user.', 'False', 'T/F', 1),  
('The ls command is used to list the contents of a directory.', 'True', 'T/F', 1),  
('In Linux, file extensions like .txt or .sh are required for files to function correctly.', 'False', 'T/F', 1),  
('The rm -rf / command deletes the entire filesystem and should be used with caution.', 'True', 'T/F', 1),  
('Linux file permissions are represented using three categories: Owner, Group, and Others.', 'True', 'T/F', 1),  
('The chmod 777 command makes a file accessible only to the owner.', 'False', 'T/F', 1),  
('The command pwd prints the working directory.', 'True', 'T/F', 1),  
('Linux uses forward slashes (/) in file paths, unlike Windows, which uses backslashes (\).', 'True', 'T/F', 1),  
('Linux can only run on dedicated Linux hardware and not on standard PCs.', 'False', 'T/F', 1);

-- course_id = 31, MCQ
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES 
('Which SQL clause is used to filter results based on a condition?', 'WHERE', 'MCQ', 31),
('What function is used to count the number of rows in a table?', 'COUNT()', 'MCQ', 31),
('Which SQL statement is used to retrieve data from a database?', 'SELECT', 'MCQ', 31),
('What does the GROUP BY clause do in SQL?', 'Groups rows with similar values', 'MCQ', 31),
('Which SQL function is used to find the average value in a column?', 'AVG()', 'MCQ', 31),
('Which keyword is used to remove duplicate values in SQL queries?', 'DISTINCT', 'MCQ', 31),
('Which SQL clause is used to sort query results?', 'ORDER BY', 'MCQ', 31),
('Which type of JOIN returns only matching rows from both tables?', 'INNER JOIN', 'MCQ', 31),
('What is the purpose of the HAVING clause in SQL?', 'Filters grouped results', 'MCQ', 31),
('Which SQL statement is used to insert new records into a table?', 'INSERT INTO', 'MCQ', 31);

-- course = 31, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)  
VALUES  
('What is the primary purpose of a data warehouse?', 'Supporting business intelligence and decision-making', 'MCQ', 32),  
('Which of the following is a key characteristic of a data warehouse?', 'Time-variant', 'MCQ', 32),  
('The process of extracting, transforming, and loading data into a data warehouse is called:', 'ETL', 'MCQ', 32),  
('Which data warehouse architecture consists of multiple subject-oriented databases?', 'Data Mart', 'MCQ', 32),  
('In data warehousing, which schema consists of a large fact table connected to multiple dimension tables?', 'Star Schema', 'MCQ', 32),  
('Which component of a data warehouse is responsible for handling queries and reporting?', 'OLAP Engine', 'MCQ', 32),  
('Which of the following is an advantage of using a data warehouse?', 'Improved decision-making through historical data analysis', 'MCQ', 32),  
('Which type of OLAP stores pre-aggregated data for faster query performance?', 'MOLAP', 'MCQ', 32),  
('Which term describes the process of combining multiple data sources into a unified view?', 'Data Integration', 'MCQ', 32),  
('What is the role of a dimension table in a data warehouse?', 'Providing descriptive attributes for analysis', 'MCQ', 32);

-- course_id = 31, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('SQL is only used for retrieving data from databases and cannot be used for data manipulation.', 'False', 'T/F', 31),
('The JOIN clause in SQL is used to combine rows from two or more tables based on a related column.', 'True', 'T/F', 31),
('The GROUP BY clause is used to filter records from a table.', 'False', 'T/F', 31),
('The HAVING clause is used to filter aggregated results, whereas the WHERE clause filters individual rows before aggregation.', 'True', 'T/F', 31),
('In SQL, NULL is the same as an empty string ('').', 'False', 'T/F', 31),
('The ORDER BY clause is used to sort query results in ascending or descending order.', 'True', 'T/F', 31),
('The INNER JOIN returns all records from both tables, regardless of whether there is a match.', 'False', 'T/F', 31),
('A subquery is a query nested inside another SQL query.', 'True', 'T/F', 31),
('The DISTINCT keyword is used to return only unique values from a column.', 'True', 'T/F', 31),
('SQL is case-sensitive when writing queries.', 'False', 'T/F', 31);

-- course_id = 33, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES
('What is Power BI primarily used for?', 'Data Visualization', 'MCQ', 33),
('Which component of Power BI is used for building reports and visualizations?', 'Power BI Desktop', 'MCQ', 33),
('What is the primary function of Power Query in Power BI?', 'Data Cleansing & Transformation', 'MCQ', 33),
('Which language is used in Power BI for creating measures and calculated columns?', 'DAX', 'MCQ', 33),
('What is the function of the Power BI Service?', 'Sharing & Collaborating Reports', 'MCQ', 33),
('Which data connection type allows for real-time updates in Power BI?', 'DirectQuery', 'MCQ', 33),
('What is the key benefit of using a star schema in Power BI data modeling?', 'Simplifies Queries', 'MCQ', 33),
('How can you create relationships between tables in Power BI?', 'Manually in Model View', 'MCQ', 33),
('What feature in Power BI allows you to create interactive visualizations with drill-down capabilities?', 'Drill-through', 'MCQ', 33),
('What is the role of a Gateway in Power BI?', 'Automates Data Refresh', 'MCQ', 33);

-- course_id = 32, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)  
VALUES  
('A data warehouse is designed primarily for transaction processing (OLTP).', 'False', 'T/F', 32),  
('ETL stands for Extract, Transform, and Load.', 'True', 'T/F', 32),  
('A star schema consists of fact tables connected to multiple dimension tables.', 'True', 'T/F', 32),  
('In a data warehouse, historical data is typically stored for long-term analysis.', 'True', 'T/F', 32),  
('A snowflake schema is a more normalized version of a star schema.', 'True', 'T/F', 32),  
('Fact tables contain descriptive information, while dimension tables store numerical data.', 'False', 'T/F', 32),  
('Data warehouses update data in real time, just like transactional databases.', 'False', 'T/F', 32),  
('Data marts are subsets of a data warehouse focused on specific business areas.', 'True', 'T/F', 32),  
('OLAP (Online Analytical Processing) is used for complex queries and reporting in data warehouses.', 'True', 'T/F', 32),  
('Slowly Changing Dimensions (SCD) refers to the way dimension data changes over time.', 'True', 'T/F', 32);

-- course_id = 31, T/F
INSERT INTO Question_Choices (Question_ID, Choice) 
VALUES 
(41, 'T'), (41, 'F'),
(42, 'T'), (42, 'F'),
(43, 'T'), (43, 'F'),
(44, 'T'), (44, 'F'),
(45, 'T'), (45, 'F'),
(46, 'T'), (46, 'F'),
(47, 'T'), (47, 'F'),
(48, 'T'), (48, 'F'),
(49, 'T'), (49, 'F'),
(50, 'T'), (50, 'F');

-- course_id = 34 , MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)  
VALUES  
('What is Tableau primarily used for?', 'Data Visualization', 'MCQ', 34),  
('Which of the following is NOT a type of Tableau chart?', 'Histogram Table', 'MCQ', 34),  
('Which data source can Tableau connect to?', 'All of the above', 'MCQ', 34),  
('Which feature in Tableau is used to create interactive dashboards?', 'Actions', 'MCQ', 34),  
('What is the default aggregation method for numerical fields in Tableau?', 'SUM', 'MCQ', 34),  
('Which of the following is NOT a file type used in Tableau?', '.csv', 'MCQ', 34),  
('Which Tableau feature allows you to combine multiple datasets?', 'Blending', 'MCQ', 34),  
('Which of the following is true about a "Measure" in Tableau?', 'It is typically aggregated', 'MCQ', 34),  
('Which component in Tableau is used for filtering data at different levels?', 'Filters', 'MCQ', 34),  
('What is the purpose of a Tableau Extract (.hyper) file?', 'To store data offline for faster performance', 'MCQ', 34);

-- course_id = 33, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('Power BI is a Microsoft tool used for data visualization and business intelligence.', 'True', 'T/F', 33),
('Power BI can only connect to Excel files and cannot connect to databases.', 'False', 'T/F', 33),
('In Power BI, reports and dashboards are the same and serve identical purposes.', 'False', 'T/F', 33),
('The Power Query Editor in Power BI is used for data transformation and cleaning.', 'True', 'T/F', 33),
('DAX (Data Analysis Expressions) is a programming language used in Power BI for creating measures and calculated columns.', 'True', 'T/F', 33),
('Power BI requires programming knowledge to create visualizations.', 'False', 'T/F', 33),
('Power BI can only be used as a desktop application and does not have cloud-based capabilities.', 'False', 'T/F', 33),
('You can schedule automatic data refreshes in Power BI to keep reports up to date.', 'True', 'T/F', 33),
('Power BI does not support creating custom visualizations.', 'False', 'T/F', 33),
('Power BI allows users to create interactive dashboards with drill-down capabilities.', 'True', 'T/F', 33);

-- course_id = 34, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)  
VALUES  
('Tableau is primarily used for data visualization and business intelligence.', 'True', 'T/F', 34),  
('In Tableau, a dimension is typically used for numerical calculations, while a measure is used for categorical data.', 'False', 'T/F', 34),  
('Tableau can connect to multiple data sources, including Excel, SQL databases, and cloud services.', 'True', 'T/F', 34),  
('A Tableau dashboard allows you to combine multiple visualizations on a single screen.', 'True', 'T/F', 34),  
('The only chart type available in Tableau is a bar chart.', 'False', 'T/F', 34),  
('In Tableau, filters can be applied at the worksheet, dashboard, or data source level.', 'True', 'T/F', 34),  
('A calculated field in Tableau allows you to create new data fields using formulas and expressions.', 'True', 'T/F', 34),  
('Tableau Public is a paid version of Tableau that requires a subscription.', 'False', 'T/F', 34),  
('Parameters in Tableau can be used to create dynamic visualizations by allowing user input.', 'True', 'T/F', 34),  
('Tableau Prep is used for creating dashboards and visualizations.', 'False', 'T/F', 34);

-- course_id = 35, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES 
('What is the first step in data cleaning?', 'Removing duplicates', 'MCQ', 35),
('Which of the following techniques is commonly used to handle missing values?', 'All of the above', 'MCQ', 35),
('Which Python library is commonly used for data cleaning?', 'Pandas', 'MCQ', 35),
('What does data normalization do?', 'Scales values to a standard range', 'MCQ', 35),
('Which method is used to detect and remove outliers?', 'Z-score or IQR method', 'MCQ', 35),
('What is the purpose of data deduplication?', 'Eliminate redundant records', 'MCQ', 35),
('Which of the following is NOT a common data cleaning task?', 'Increasing dataset size artificially', 'MCQ', 35),
('What is the benefit of handling inconsistent data formats?', 'Better data consistency and accuracy', 'MCQ', 35),
('How can categorical data be transformed into numerical data?', 'One-hot encoding', 'MCQ', 35),
('Why is data cleaning crucial before model training?', 'To improve model accuracy and reliability', 'MCQ', 35);

-- course_id = 35, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('Data cleaning is the process of identifying and correcting errors in a dataset.', 'True', 'T/F', 35),
('Missing values in a dataset should always be deleted.', 'False', 'T/F', 35),
('Standardization and normalization are two different techniques used in data preprocessing.', 'True', 'T/F', 35),
('Outliers should always be removed from a dataset.', 'False', 'T/F', 35),
('Data transformation involves converting data into a different format or scale for better analysis.', 'True', 'T/F', 35),
('Duplicate records in a dataset have no impact on analysis.', 'False', 'T/F', 35),
('Feature engineering is a part of data preprocessing that involves creating new meaningful variables from raw data.', 'True', 'T/F', 35),
('Encoding categorical variables is not necessary before using them in machine learning models.', 'False', 'T/F', 35),
('Data cleaning is an iterative process that may need to be repeated multiple times.', 'True', 'T/F', 35),
('Scaling numeric features is only required when working with neural networks.', 'False', 'T/F', 35);

-- course_id = 36, MCQ
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES 
('What is the primary use of Excel in Business Analytics?', 'Data Cleaning and Analysis', 'MCQ ', 36),
('Which Excel function is used to find the average of a range of values?', 'AVERAGE', 'MCQ ', 36),
('What does the VLOOKUP function do in Excel?', 'Searches for a value in the first column of a range', 'MCQ ', 36),
('Which Excel feature allows users to create interactive reports and dashboards?', 'PivotTables', 'MCQ ', 36),
('What is the purpose of a What-If Analysis in Excel?', 'To predict future trends based on historical data', 'MCQ ', 36),
('In Excel, which function is used to combine text from multiple cells?', 'CONCATENATE (or CONCAT)', 'MCQ ', 36),
('Which type of chart is best for analyzing trends over time?', 'Line Chart', 'MCQ ', 36),
('What is the use of the Solver tool in Excel?', 'To perform complex optimizations', 'MCQ ', 36),
('Which Excel function helps in counting the number of cells that meet a certain condition?', 'COUNTIF', 'MCQ ', 36),
('What is Power Query used for in Excel?', 'To extract, transform, and load data', 'MCQ ', 36);

-- course_id = 27, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES 
('Which of the following is NOT a feature of Power BI?', 'Web Development', 'MCQ', 27),
('What is the primary function of Tableau?', 'Data Visualization', 'MCQ', 27),
('Which type of visualization is best for showing trends over time in Power BI?', 'Line Chart', 'MCQ', 27),
('In Tableau, which feature is used to create interactive dashboards?', 'Parameters', 'MCQ', 27),
('What is the role of DAX (Data Analysis Expressions) in Power BI?', 'Creating Custom Calculations', 'MCQ', 27),
('Which of the following is a valid data source for Power BI and Tableau?', 'All of the Above', 'MCQ', 27),
('Which Tableau feature allows users to group and summarize data dynamically?', 'Hierarchy', 'MCQ', 27),
('In Power BI, which feature allows users to create relationships between different tables?', 'Data Model', 'MCQ', 27),
('Which type of join is commonly used in Tableau when connecting multiple data sources?', 'All of the Above', 'MCQ', 27),
('Which visualization tool allows for better integration with Microsoft products?', 'Power BI', 'MCQ', 27);

-- course_id = 36, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('Excel can be used for business analytics, including data visualization, statistical analysis, and reporting.', 'True', 'T/F', 36),
('PivotTables in Excel are only useful for summarizing numeric data.', 'False', 'T/F', 36),
('The IF function in Excel allows for conditional logic in calculations.', 'True', 'T/F', 36),
('Excel does not have built-in tools for regression analysis.', 'False', 'T/F', 36),
('Data validation in Excel helps ensure the accuracy and consistency of data entries.', 'True', 'T/F', 36),
('Excel’s VLOOKUP function can only search for values in the first column of a table.', 'True', 'T/F', 36),
('The Solver tool in Excel is used to find the best possible outcome by adjusting variables under given constraints.', 'True', 'T/F', 36),
('Excel cannot be used for predictive analytics.', 'False', 'T/F', 36),
('The INDEX and MATCH functions in Excel can be used as an alternative to VLOOKUP.', 'True', 'T/F', 36),
('Excel’s Data Analysis ToolPak must be enabled manually before using it for advanced analytics.', 'True', 'T/F', 36);

-- course_id = 41, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES
('What is cloud computing?', 'On-demand delivery of IT resources over the internet', 'MCQ', 41),
('Which of the following is a key characteristic of cloud computing?', 'Pay-as-you-go pricing model', 'MCQ', 41),
('Which cloud deployment model provides services over the public internet?', 'Public Cloud', 'MCQ', 41),
('What does IaaS stand for in cloud computing?', 'Infrastructure as a Service', 'MCQ', 41),
('Which cloud service model provides a platform for developers to build and deploy applications?', 'PaaS', 'MCQ', 41),
('What is the main benefit of using cloud computing for businesses?', 'Scalability and flexibility', 'MCQ', 41),
('Which of the following is NOT a major cloud service provider?', 'Oracle Excel', 'MCQ', 41),
('Which technology enables multiple users to share computing resources in cloud computing?', 'Virtualization', 'MCQ', 41),
('What is a disadvantage of cloud computing?', 'Dependency on internet connectivity', 'MCQ', 41),
('Which cloud service model provides software applications over the internet?', 'SaaS', 'MCQ', 41);

-- course = 27, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('Power BI and Tableau are both widely used tools for data visualization and business intelligence.', 'True', 'T/F', 27),
('Tableau is a Microsoft product, just like Power BI.', 'False', 'T/F', 27),
('Both Power BI and Tableau support connecting to multiple data sources, including databases and cloud services.', 'True', 'T/F', 27),
('Power BI is better suited for users in Microsoft ecosystems, while Tableau is platform-independent.', 'True', 'T/F', 27),
('In Tableau, dashboards and worksheets are the same and serve the same purpose.', 'False', 'T/F', 27),
('Power BI allows users to create DAX (Data Analysis Expressions) calculations for advanced analytics.', 'True', 'T/F', 27),
('Tableau does not support real-time data updates, unlike Power BI.', 'False', 'T/F', 27),
('Power BI Service is a cloud-based platform that allows sharing and collaboration of reports and dashboards.', 'True', 'T/F', 27),
('Both Power BI and Tableau provide built-in AI-driven insights for data analysis.', 'True', 'T/F', 27),
('Tableau and Power BI require programming knowledge to create visualizations.', 'False', 'T/F', 27);

-- course_id = 139, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES 
('What does SQL stand for?', 'Structured Query Language', 'MCQ', 139),
('Which SQL statement is used to retrieve data from a database?', 'SELECT', 'MCQ', 139),
('What type of database is SQL primarily used for?', 'Relational databases', 'MCQ', 139),
('Which of the following is NOT a valid SQL constraint?', 'ALTER KEY', 'MCQ', 139),
('What SQL clause is used to filter records based on a condition?', 'WHERE', 'MCQ', 139),
('What is the purpose of the JOIN operation in SQL?', 'To combine rows from two or more tables', 'MCQ', 139),
('Which SQL statement is used to insert new records into a table?', 'INSERT INTO', 'MCQ', 139),
('Which SQL function is used to count the number of rows in a table?', 'COUNT()', 'MCQ', 139),
('In SQL, what is the purpose of the GROUP BY clause?', 'To group records that have the same values in a specified column', 'MCQ', 139),
('What keyword is used to update existing data in an SQL table?', 'UPDATE', 'MCQ', 139);

-- course_id = 41, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('Cloud computing allows users to access computing resources over the internet without requiring local hardware.', 'True', 'T/F', 41),
('Infrastructure as a Service (IaaS) provides only software applications and does not include hardware resources.', 'False', 'T/F', 41),
('Public cloud services are hosted on-premises by individual organizations.', 'False', 'T/F', 41),
('Software as a Service (SaaS) eliminates the need for users to install and maintain software on their local machines.', 'True', 'T/F', 41),
('Cloud computing guarantees 100% uptime without any risk of outages.', 'False', 'T/F', 41),
('Hybrid cloud combines both private and public cloud solutions to optimize performance and security.', 'True', 'T/F', 41),
('Cloud storage solutions such as Google Drive and Dropbox use cloud computing technologies.', 'True', 'T/F', 41),
('Cloud computing is only beneficial for large enterprises and not small businesses.', 'False', 'T/F', 41),
('Multi-tenancy in cloud computing means that multiple customers share the same computing resources securely.', 'True', 'T/F', 41),
('Edge computing and cloud computing are the same technology.', 'False', 'T/F', 41);

-- course_id = 21, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES
('What is the primary library used for data manipulation in Python?', 'Pandas', 'MCQ', 21),
('Which Python library is used for numerical computing and working with arrays?', 'NumPy', 'MCQ', 21),
('What function is used to display the first few rows of a Pandas DataFrame?', 'head()', 'MCQ', 21),
('In NumPy, what function is used to create an array filled with zeros?', 'np.zeros()', 'MCQ', 21),
('Which of the following is used for data visualization in Python?', 'Matplotlib', 'MCQ', 21),
('What method is used to remove missing values from a Pandas DataFrame?', 'dropna()', 'MCQ', 21),
('What is the purpose of the groupby() function in Pandas?', 'To group data based on a column', 'MCQ', 21),
('Which function is used in Pandas to read a CSV file?', 'read_csv()', 'MCQ', 21),
('Which of the following is a machine learning library in Python?', 'Scikit-learn', 'MCQ', 21),
('What is the output of df.shape in Pandas?', 'Tuple representing (rows, columns)', 'MCQ', 21);

-- course_id = 139, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('SQL stands for Structured Query Language.', 'True', 'T/F', 139),
('A primary key in a relational database table can have duplicate values.', 'False', 'T/F', 139),
('The JOIN clause in SQL is used to combine rows from two or more tables based on a related column.', 'True', 'T/F', 139),
('A foreign key in one table must always reference a primary key in another table.', 'True', 'T/F', 139),
('SQL queries are case-sensitive by default.', 'False', 'T/F', 139),
('The GROUP BY clause is used to filter records from a table.', 'False', 'T/F', 139),
('The HAVING clause is used to filter aggregated results, whereas the WHERE clause filters individual rows before aggregation.', 'True', 'T/F', 139),
('The INNER JOIN returns all records from both tables, regardless of whether there is a match.', 'False', 'T/F', 139),
('SQL allows the use of subqueries, which are queries nested inside another SQL query.', 'True', 'T/F', 139),
('Normalization is the process of reducing data redundancy in a relational database.', 'True', 'T/F', 139);

-- course_id = 22, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES 
('What is the probability of getting a heads when flipping a fair coin?', '0.5', 'MCQ', 22),
('In a normal distribution, what percentage of data falls within one standard deviation of the mean?', '68%', 'MCQ', 22),
('What does the p-value represent in hypothesis testing?', 'Probability of observing the test results under the null hypothesis', 'MCQ', 22),
('Which measure of central tendency is most affected by extreme values?', 'Mean', 'MCQ', 22),
('What is the sum of all probabilities in a probability distribution?', '1', 'MCQ', 22),
('Which of the following distributions is used for modeling count data?', 'Poisson distribution', 'MCQ', 22),
('What does a confidence interval represent in statistical analysis?', 'Range in which the true parameter is expected to lie with a given probability', 'MCQ', 22),
('In statistics, which theorem states that the sampling distribution of the mean approaches normality as sample size increases?', 'Central Limit Theorem', 'MCQ', 22),
('What is the expected value of a discrete random variable?', 'Weighted average of all possible values', 'MCQ', 22),
('Which of the following is a measure of dispersion in a dataset?', 'Standard deviation', 'MCQ', 22);

-- course_id = 21, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('Python is one of the most widely used programming languages for data science.', 'True', 'T/F', 21),
('Pandas is a Python library used for numerical computations and matrix operations.', 'False', 'T/F', 21),
('The matplotlib library in Python is used for data visualization.', 'True', 'T/F', 21),
('Python does not support machine learning and artificial intelligence applications.', 'False', 'T/F', 21),
('Jupyter Notebook is a popular tool for writing and running Python code in data science.', 'True', 'T/F', 21),
('In Python, a DataFrame is a two-dimensional labeled data structure provided by the Pandas library.', 'True', 'T/F', 21),
('The seaborn library in Python is used for creating interactive dashboards.', 'False', 'T/F', 21),
('The scikit-learn library is commonly used for machine learning tasks in Python.', 'True', 'T/F', 21),
('Python does not have built-in functions for handling missing data.', 'False', 'T/F', 21),
('Feature engineering is a crucial step in data science where new features are created to improve model performance.', 'True', 'T/F', 21);

-- course_id = 43, MCQs
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)
VALUES
('What is Microsoft Azure?', 'A. A cloud computing service', 'MCQ ', 43),
('Which Azure service is used to store large amounts of unstructured data, such as images and videos?', 'A. Azure Blob Storage', 'MCQ ', 43),
('What is the primary benefit of using cloud computing services like Microsoft Azure?', 'C. Provides scalability and flexibility', 'MCQ ', 43),
('Which Azure service provides scalable virtual machines in the cloud?', 'A. Azure Virtual Machines', 'MCQ ', 43),
('What type of service model is Azure App Service categorized under?', 'B. Platform as a Service (PaaS)', 'MCQ ', 43),
('Which tool in Azure allows monitoring and managing cloud resources in real time?', 'A. Azure Monitor', 'MCQ ', 43),
('What is Azure Active Directory (Azure AD) used for?', 'B. User identity and access management', 'MCQ ', 43),
('What is the purpose of Azure Virtual Network (VNet)?', 'C. To connect and secure cloud resources within a private network', 'MCQ ', 43),
('Which Azure service is used for serverless computing?', 'C. Azure Functions', 'MCQ ', 43),
('What is Azure DevOps primarily used for?', 'B. Application development and deployment', 'MCQ ', 43);

-- course_id = 22, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID) 
VALUES 
('Probability measures the likelihood of an event occurring, ranging between 0 and 1.', 'True', 'T/F', 22),
('The mean, median, and mode are all measures of central tendency.', 'True', 'T/F', 22),
('Standard deviation measures the center of a dataset.', 'False', 'T/F', 22),
('A normal distribution is also known as a bell curve.', 'True', 'T/F', 22),
('The sum of probabilities of all possible outcomes in an experiment must be greater than 1.', 'False', 'T/F', 22),
('A p-value in hypothesis testing indicates the probability of observing the results given that the null hypothesis is true.', 'True', 'T/F', 22),
('Correlation implies causation.', 'False', 'T/F', 22),
('In a dataset, outliers can significantly affect the mean but have little impact on the median.', 'True', 'T/F', 22),
('Bayes'' Theorem is used to update probabilities based on new evidence.', 'True', 'T/F', 22),
('A larger sample size increases the variability of a sample mean.', 'False', 'T/F', 22);

-- course_id = 43, T/F
INSERT INTO Question (Question, Answer, Question_Type, Course_ID)  
VALUES  
('Microsoft Azure is a cloud computing platform provided by Google', 'False', 'T/F', 43),  
('Azure Virtual Machines (VMs) allow users to run applications in the cloud as if they were on a physical computer', 'True', 'T/F', 43),  
('Azure Blob Storage is used to store large amounts of unstructured data', 'True', 'T/F', 43),  
('Azure Functions require users to manage the underlying infrastructure manually', 'False', 'T/F', 43),  
('Azure Active Directory (Azure AD) provides identity and access management services', 'True', 'T/F', 43),  
('Azure Virtual Network (VNet) allows secure communication between Azure resources', 'True', 'T/F', 43),  
('Azure DevOps is primarily used for cloud storage', 'False', 'T/F', 43),  
('Azure SQL Database is a relational database service in the cloud', 'True', 'T/F', 43),  
('Azure provides a Pay-as-You-Go pricing model', 'True', 'T/F', 43),  
('Azure does not support hybrid cloud environments', 'False', 'T/F', 43);