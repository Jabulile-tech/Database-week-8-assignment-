# **EduHaven Student Records Management System**  
A relational database designed in **MySQL** to manage student enrollments, courses, tutors, and schedules efficiently.

## **📌 Project Title**  
EduHaven Student Records Management System

## **📌 Description**  
EduHaven is an **online tutoring management system** that enables efficient handling of student enrollments, course assignments, tutor scheduling, and academic tracking. Designed for **high school learners**, this system ensures data integrity while streamlining operations in an educational environment.

### **Features**
✅ **Student Enrollment & Tracking** – Monitor academic progress and course registration.  
✅ **Tutor Scheduling & Assignments** – Ensure structured learning sessions.  
✅ **Course Management** – Manage course details, durations, and tutor assignments.  
✅ **Database Integrity & Security** – Enforce constraints with **Primary Keys, Foreign Keys, and Indexing** for optimized query performance.

---

## **📌 How to Run/Setup the Project**
### **1. Clone Repository**
```
git clone https://github.com/Jabulile-tech/Dtabase-week-8-assignment/EduHaven_DB.git
```

### **2. Install MySQL & Setup Database**
- Ensure **MySQL** is installed on your system.
- Open **MySQL Workbench** or **Command Line Client**.

### **3. Create Database**
```sql
CREATE DATABASE EduHaven_DB;
USE EduHaven_DB;
```

### **4. Import SQL Schema**
Run the following command to create tables and relationships:
```sql
SOURCE EduHaven_Schema.sql;
```

### **5. Insert Sample Data**
Populate the database with test data using:
```sql
SOURCE EduHaven_SeedData.sql;
```

### **6. Verify Setup**
Run the following query to check that tables are created successfully:
```sql
SHOW TABLES;
```

---

## **📌 Screenshot or Link to ERD**  
Here’s the **Entity Relationship Diagram (ERD)** showcasing the **database structure**:  
📷 _[Insert screenshot or link to ERD here]_

---

Would you like any refinements or additional sections, such as **API endpoints for integration** or **user authentication setup**? 🚀
