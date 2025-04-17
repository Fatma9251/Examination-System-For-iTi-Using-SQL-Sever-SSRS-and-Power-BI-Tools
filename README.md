# Examination System with SQL Server and Power BI Dashboard

## Project Overview

This project involves the design and development of a comprehensive examination system, leveraging SQL Server for data management and Power BI for visualizing insights. The system was built from scratch, beginning with database modeling and schema design, followed by the automation of exam generation and correction processes. Reports and dashboards were then created to provide valuable insights into the performance of registered students.

## Key Components

### 1. **Database Design**
   - **Entity-Relationship Diagram (ERD)**: The database was designed using an ERD to visualize entities and their relationships.
   - **Database Schema & Tables**: Tables were created based on the ERD, with data types and constraints carefully defined.
   - **Data Modeling**: Relationships between entities were mapped out, and normalization techniques were applied to ensure data integrity and avoid redundancy.

### 2. **Stored Procedures & Automation**
   - **CRUD Operations**: Stored procedures were created for Create, Read, Update, and Delete operations to handle and validate data in the system.
   - **Exam Generation**: A stored procedure was developed to automate the process of generating exams for registered students, ensuring the appropriate distribution of questions.
   - **Exam Correction**: Another stored procedure was implemented to automatically grade exams based on predefined correct answers, offering efficient correction without manual intervention.

### 3. **Reports & Dashboards**
   - **SSRS Reports**: SQL Server Reporting Services (SSRS) was used to generate detailed reports on student performance, exam statistics, and other key metrics.
   - **Power BI Dashboards**: Power BI was connected to the SQL Server database to create interactive dashboards and visualizations, providing insights into the data with easy-to-understand charts and graphs.
   - **Insights**: The dashboards helped track performance trends, pass rates, and areas for improvement, which are essential for educators to understand student outcomes.

## Technologies Used

- **Database**: SQL Server
- **Reporting**: SQL Server Reporting Services (SSRS)
- **Data Visualization**: Power BI
- **Programming**: SQL (for stored procedures)
- **Data Modeling**: ERD (Entity-Relationship Diagram)

## Features

- Fully automated exam generation and grading process
- CRUD operations for managing student, exam, and question data beside other organization system data i.e. branches, tracks, instructors, courses, ...etc. 
- Detailed reports with performance analysis
- Interactive Power BI dashboards for visual insights
- Scalable design for handling increasing data and users
