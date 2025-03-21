CREATE DATABASE Workshop2

use Workshop2
go

CREATE TABLE tblUsers (
    username VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Instructor', 'Student'))
);

CREATE TABLE tblExamCategories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE tblExams (
    exam_id INT PRIMARY KEY,
    exam_title VARCHAR(100) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    category_id INT,
    total_marks INT NOT NULL,
    Duration INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES tblExamCategories(category_id)
);

CREATE TABLE tblQuestions (
    question_id INT PRIMARY KEY,
    exam_id INT,
    question_text TEXT NOT NULL,
    option_a VARCHAR(100) NOT NULL,
    option_b VARCHAR(100) NOT NULL,
    option_c VARCHAR(100) NOT NULL,
    option_d VARCHAR(100) NOT NULL,
    correct_option CHAR(1) NOT NULL CHECK (correct_option IN ('A', 'B', 'C', 'D')),
    FOREIGN KEY (exam_id) REFERENCES tblExams(exam_id)
);

INSERT INTO tblUsers (username, Name, password, Role) VALUES
('instructor1', 'John Doe', 'password123', 'Instructor'),
('instructor2', 'Jane Smith', 'securePass', 'Instructor'),
('student1', 'Alice Brown', 'alicePass', 'Student'),
('student2', 'Bob White', 'bobPass', 'Student');
go
INSERT INTO tblExamCategories (category_id, category_name, description) VALUES
(1, 'Quiz', 'Short assessment to test knowledge'),
(2, 'Midterm', 'Midterm examination covering half of the course'),
(3, 'Final', 'Final examination covering the full course');
go
INSERT INTO tblExams (exam_id, exam_title, Subject, category_id, total_marks, Duration) VALUES
(101, 'Java Basics Quiz', 'Java Programming', 1, 50, 30),
(102, 'Database Midterm', 'Database Systems', 2, 100, 60),
(103, 'Final Exam - Web Development', 'Web Development', 3, 150, 90);
go
INSERT INTO tblQuestions (question_id, exam_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
(1, 101, 'What is the default value of a boolean variable in Java?', 'true', 'false', 'null', '0', 'B'),
(2, 101, 'Which of the following is not a Java primitive type?', 'int', 'String', 'double', 'boolean', 'B'),
(3, 102, 'Which SQL clause is used to filter results?', 'SELECT', 'WHERE', 'ORDER BY', 'GROUP BY', 'B'),
(4, 103, 'Which of the following is a CSS framework?', 'Bootstrap', 'Django', 'Flask', 'Spring', 'A');
go
-- **Quiz Exams (category_id = 1)**
INSERT INTO tblExams (exam_id, exam_title, Subject, category_id, total_marks, Duration) VALUES
(104, 'OOP Fundamentals Quiz', 'Object-Oriented Programming', 1, 50, 30),
(105, 'HTML & CSS Basics Quiz', 'Web Development', 1, 50, 25),
(106, 'Data Structures Quiz', 'Computer Science', 1, 50, 35);
go
-- **Midterm Exams (category_id = 2)**
INSERT INTO tblExams (exam_id, exam_title, Subject, category_id, total_marks, Duration) VALUES
(107, 'Java Programming Midterm', 'Java Programming', 2, 100, 60),
(108, 'Database Design Midterm', 'Database Systems', 2, 100, 75),
(109, 'Networking Midterm', 'Computer Networks', 2, 100, 80);
go
-- **Final Exams (category_id = 3)**
INSERT INTO tblExams (exam_id, exam_title, Subject, category_id, total_marks, Duration) VALUES
(110, 'Advanced Java Final Exam', 'Java Programming', 3, 150, 90),
(111, 'Full-Stack Web Development Final', 'Web Development', 3, 150, 95),
(112, 'Cybersecurity Final', 'Cybersecurity', 3, 150, 100);
go
