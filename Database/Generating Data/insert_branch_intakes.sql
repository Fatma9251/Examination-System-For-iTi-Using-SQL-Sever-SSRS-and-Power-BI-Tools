INSERT INTO Branch_Launches_Intakes (Branch_ID, Intake_ID)
-- Intake IDs 1 to 15 with specific branches
SELECT b.Branch_ID, i.Intake_ID
FROM (VALUES (14)) AS b(Branch_ID)
CROSS JOIN (SELECT Intake_ID FROM Intake WHERE Intake_ID BETWEEN 1 AND 15) i 

UNION ALL

-- Intake IDs 1 to 15 with specific branches
SELECT b.Branch_ID, i.Intake_ID
FROM (VALUES (3), (9), (10)) AS b(Branch_ID)
CROSS JOIN (SELECT Intake_ID FROM Intake WHERE Intake_ID BETWEEN 10 AND 15) i

UNION ALL

-- Intake IDs 16 to 60 with branches 
SELECT b.Branch_ID, i.Intake_ID
FROM (SELECT Branch_ID FROM Branch where Branch_ID IN (14, 10, 9)) b
CROSS JOIN (SELECT Intake_ID FROM Intake WHERE Intake_ID BETWEEN 16 AND 60) i

UNION ALL

-- Intake IDs 45 to 60 with branches 
SELECT b.Branch_ID, i.Intake_ID
FROM (SELECT Branch_ID FROM Branch where Branch_ID NOT IN (14, 10, 9, 1, 2, 6, 7)) b
CROSS JOIN (SELECT Intake_ID FROM Intake WHERE Intake_ID BETWEEN 45 AND 60) i

UNION ALL

-- Intake IDs 45 to 60 with branches 
SELECT b.Branch_ID, i.Intake_ID
FROM (SELECT Branch_ID FROM Branch where Branch_ID IN (1, 2, 6, 7)) b
CROSS JOIN (SELECT Intake_ID FROM Intake WHERE Intake_ID BETWEEN 55 AND 60) i