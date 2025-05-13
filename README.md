# **EduHaven Student Records Management System**
A **relational database** designed in **MySQL** for managing student enrollments, courses, tutors, and schedules efficiently.

## **Features**
✅ **Student Management** – Store student details securely.  
✅ **Course Management** – Track courses with duration and descriptions.  
✅ **Tutor Assignments** – Manage tutor schedules and specialization.  
✅ **Enrollments** – Monitor student course registrations dynamically.  

## **Database Schema**
### **Entities & Relationships**
- **Students** *(StudentID, Name, Email, Phone, DOB)*
- **Courses** *(CourseID, Name, Description, Duration)*
- **Tutors** *(TutorID, Name, Email, Specialization)*
- **Enrollments** *(Tracks Student-Course Many-to-Many relationship)*
- **Schedules** *(Links Tutors to Courses)*

## **Installation Instructions**
### **1. Clone Repository**
```
git clone https://github.com/your-repo/EduHaven_DB.git
```
### **2. Setup MySQL Database**
```sql
CREATE DATABASE EduHaven_DB;
USE EduHaven_DB;
```
### **3. Run SQL Schema**
```sql
SOURCE EduHaven_Schema.sql;
```
### **4. Insert Sample Data**
```sql
SOURCE EduHaven_SeedData.sql;
```
## **Usage**
### **Retrieving Enrolled Students**
```sql
SELECT Students.FirstName, Students.LastName, Courses.CourseName 
FROM Enrollments
JOIN Students ON Enrollments.StudentID = Students.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
```
### **Tracking Tutor Schedules**
```sql
SELECT Tutors.FullName, Courses.CourseName, Schedules.ScheduleDate, Schedules.TimeSlot
FROM Schedules
JOIN Tutors ON Schedules.TutorID = Tutors.TutorID
JOIN Courses ON Schedules.CourseID = Courses.CourseID;
```

## **Future Enhancements**
🚀 **Authentication System** – Secure tutor/student login.  
🚀 **Admin Dashboard** – Manage enrollments and payments visually.  
🚀 **Performance Optimization** – Indexing for faster queries.  

---
