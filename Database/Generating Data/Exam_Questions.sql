-- ExamAnswer('exam_id', 'student_id', Answer)

CREATE TABLE Exam_Questions 
(
Exam_ID INT, 
Question_ID INT,
PRIMARY KEY (Exam_ID, Question_ID)
)

ALTER TABLE Exam_Questions
ADD CONSTRAINT E_FK FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID)
ALTER TABLE Exam_Questions
ADD CONSTRAINT QE_FK FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)

