WITH Numbers AS (
    SELECT 1 AS Intake_Number
    UNION ALL
    SELECT Intake_Number + 1 FROM Numbers WHERE Intake_Number < 45
)
INSERT INTO Intake (Intake_Number, Type)
SELECT Intake_Number, 'PTP' FROM Numbers WHERE Intake_Number <= 15
UNION ALL
SELECT Intake_Number, 'ICC' FROM Numbers;

