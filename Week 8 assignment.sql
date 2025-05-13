-- Create a new database schema
CREATE DATABASE EduHaven_NewDB;

-- Use the new schema
USE EduHaven_NewDB;
-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    DateOfBirth DATE
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) UNIQUE NOT NULL,
    Description TEXT,
    Duration INT COMMENT 'Duration in weeks'
);

-- Create Tutors table
CREATE TABLE Tutors (
    TutorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create Enrollments table (Many-to-Many: Students & Courses)
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATETIME DEFAULT NOW(),
    Status ENUM('Active', 'Completed', 'Dropped') DEFAULT 'Active',
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    INDEX idx_student_course (StudentID, CourseID)
);

-- Create Schedules table (One-to-Many: Tutors & Courses)
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    TutorID INT,
    CourseID INT,
    ScheduleDate DATE NOT NULL,
    TimeSlot VARCHAR(50) NOT NULL,
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert sample students
INSERT INTO Students (FirstName, LastName, Email, Phone, DateOfBirth)
VALUES 
    ('Lebo', 'Nkosi', 'lebo.nkosi@email.com', '0723456789', '2005-06-15'),
    ('Kabelo', 'Mokoena', 'kabelo.mokoena@email.com', '0739876543', '2004-12-22'),
    ('Zanele', 'Dlamini', 'zanele.dlamini@email.com', '0825671234', '2005-02-10');

-- Insert sample courses
INSERT INTO Courses (CourseName, Description, Duration)
VALUES 
    ('Mathematics', 'Advanced high school mathematics', 12),
    ('Physics', 'Introductory physics course', 10),
    ('English', 'Comprehensive language studies', 8);

-- Insert sample tutors
INSERT INTO Tutors (FullName, Email, Specialization, Phone)
VALUES 
    ('Sipho Mthembu', 'sipho.mthembu@email.com', 'Mathematics', '0791234567'),
    ('Naledi Mahlangu', 'naledi.mahlangu@email.com', 'Physics', '0763456789'),
    ('Thabo Ndlovu', 'thabo.ndlovu@email.com', 'English', '0719876543');

-- Insert enrollments (students registering for courses)
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES 
    (1, 1, '2025-05-10'), 
    (1, 2, '2025-05-11'), 
    (2, 1, '2025-05-12'), 
    (2, 3, '2025-05-12'),
    (3, 2, '2025-05-13');

-- Insert schedules (tutors assigned to courses)
INSERT INTO Schedules (TutorID, CourseID, ScheduleDate, TimeSlot)
VALUES 
    (1, 1, '2025-05-15', '09:00-10:30'), 
    (2, 2, '2025-05-16', '11:00-12:30'), 
    (3, 3, '2025-05-17', '14:00-15:30');
    
-- Retrieve all students and their enrolled courses
SELECT Students.FirstName, Students.LastName, Courses.CourseName, Enrollments.EnrollmentDate
FROM Enrollments
JOIN Students ON Enrollments.StudentID = Students.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Get tutor schedules
SELECT Tutors.FullName, Courses.CourseName, Schedules.ScheduleDate, Schedules.TimeSlot
FROM Schedules
JOIN Tutors ON Schedules.TutorID = Tutors.TutorID
JOIN Courses ON Schedules.CourseID = Courses.CourseID;

-- Count students enrolled per course
SELECT Courses.CourseName, COUNT(Enrollments.StudentID) AS TotalStudents
FROM Enrollments
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY Courses.CourseName;

-- Indexing foreign key columns for faster joins
CREATE INDEX idx_studentID ON Enrollments(StudentID);
CREATE INDEX idx_courseID ON Enrollments(CourseID);
CREATE INDEX idx_tutorID ON Schedules(TutorID);
CREATE INDEX idx_schedule_courseID ON Schedules(CourseID);

EXPLAIN SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Enrollments
JOIN Students ON Enrollments.StudentID = Students.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

CREATE TABLE CourseStats AS 
SELECT CourseID, COUNT(StudentID) AS TotalStudents 
FROM Enrollments GROUP BY CourseID;
