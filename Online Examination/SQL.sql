CREATE DATABASE Online_Examination
GO

CREATE TABLE tblUsers (
    username VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Instructor', 'Student'))
);

CREATE TABLE tblExamCategories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(50) NOT NULL,
    description TEXT NULL
);

CREATE TABLE tblExams (
    exam_id INT PRIMARY KEY IDENTITY(1,1),
    exam_title VARCHAR(100) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    category_id INT NOT NULL,
    total_marks INT NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    FOREIGN KEY (category_id) REFERENCES tblExamCategories(category_id) ON DELETE CASCADE
);

CREATE TABLE tblQuestions (
    question_id INT PRIMARY KEY IDENTITY(1,1),
    exam_id INT NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(100) NOT NULL,
    option_b VARCHAR(100) NOT NULL,
    option_c VARCHAR(100) NOT NULL,
    option_d VARCHAR(100) NOT NULL,
    correct_option CHAR(1) NOT NULL CHECK (correct_option IN ('A', 'B', 'C', 'D')),
    FOREIGN KEY (exam_id) REFERENCES tblExams(exam_id) ON DELETE CASCADE
);

INSERT INTO tblUsers (username, name, password, role) VALUES
('instructor1', 'Walter White', 'heisenberg', 'Instructor'),
('instructor2', 'Gustavo Fring', 'chickenman', 'Instructor'),
('student1', 'Jessie Pinkman', 'milflover', 'Student'),
('student2', 'Kid Name Finger', 'finger', 'Student');

INSERT INTO tblExamCategories (category_name, description) VALUES
('Quiz', 'Short assessment to test knowledge'),
('Midterm', 'Midterm examination covering half of the course'),
('Final', 'Final examination covering the full course');

INSERT INTO tblExams (exam_title, subject, category_id, total_marks, duration) VALUES
('Java Basics Quiz', 'Java Programming', 1, 50, 30),
('Database Midterm', 'Database Systems', 2, 100, 60),
('Final Exam - Web Development', 'Web Development', 3, 150, 90);

INSERT INTO tblQuestions (exam_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
(1, 'What is the default value of a boolean variable in Java?', 'true', 'false', 'null', '0', 'B'),
(1, 'Which of the following is not a Java primitive type?', 'int', 'String', 'double', 'boolean', 'B'),
(2, 'Which SQL clause is used to filter results?', 'SELECT', 'WHERE', 'ORDER BY', 'GROUP BY', 'B'),
(3, 'Which of the following is a CSS framework?', 'Bootstrap', 'Django', 'Flask', 'Spring', 'A');
