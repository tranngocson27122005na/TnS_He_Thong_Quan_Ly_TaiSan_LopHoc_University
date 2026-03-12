📚 Classroom Asset Management System
PRJ301 – Java Web Application
1. 📌 Project Description

The Classroom Asset Management System is a web application developed using Java Servlet, JSP, and JDBC following the MVC architecture.

The purpose of this system is to help educational institutions manage classroom equipment such as:

Projectors

Tables

Chairs

Computers

Other classroom devices

The system allows administrators to add, update, assign, and track assets in classrooms, ensuring efficient management and monitoring of classroom resources.

2. 🎯 Project Objectives

The main objectives of this project are:

Build a Java Web application using MVC architecture

Apply Servlet and JSP for backend development

Use JSTL for dynamic view rendering

Connect to a SQL database using JDBC

Implement user authentication

Manage classroom assets and their assignments

Provide asset reports and statistics

3. 👥 System Actors

The system includes the following actors:

1. Administrator

The administrator manages the entire system.

Responsibilities:

Manage asset information

Add new assets

Update asset details

Assign assets to classrooms

View asset reports

Monitor asset distribution

2. Staff / User

Staff members can:

View asset information

Check assets assigned to classrooms

Monitor asset usage

4. ⚙️ Business Functions

The system provides several core functions.

4.1 User Authentication

Users must log in before accessing the system.

Functions:

Login

Session management

Logout

Password reset via email

Flow
User → login.jsp
        ↓
LoginController
        ↓
NguoiDungDAO
        ↓
Database
        ↓
Home Page
4.2 Asset Management

Administrators can manage classroom assets.

Functions:

View asset list

Add new asset

Edit asset information

Delete asset

Example assets:

Projector
Chair
Table
Computer
Speaker
4.3 Classroom Management

The system manages classrooms in the building.

Example classroom information:

Room A101
Building A
Capacity: 40 students

Each classroom can contain multiple assets.

4.4 Assign Assets to Classrooms

Assets can be assigned to specific classrooms.

Example:

Room A101
-----------
30 Chairs
15 Tables
1 Projector

This relationship is managed through the PhongTaiSan table.

4.5 Asset Movement History

The system records asset movement between rooms.

Example:

Projector moved
From: Room A101
To: Room B203
Date: 2024-05-01

This helps track asset usage and relocation.

4.6 Reporting and Statistics

The system generates reports such as:

Assets in each classroom

Total number of assets

Asset distribution across rooms

Example report:

Room A101
---------
Projector : 1
Chair     : 30
Table     : 15
5. 🏗 System Architecture

The system follows the MVC (Model – View – Controller) architecture.

User (Browser)
      │
      ▼
JSP Pages (View)
      │
      ▼
Servlet Controllers
      │
      ▼
DAO Layer
      │
      ▼
Database
6. 📂 Project Structure
src
│
├── controller
│     LoginController.java
│     HomeController.java
│     TaiSanController.java
│     ForgotPasswordController.java
│
├── dao
│     NguoiDungDAO.java
│     TaiSanDAO.java
│
├── model
│     NguoiDung.java
│     TaiSan.java
│     PhongHoc.java
│     PhongTaiSan.java
│     SinhVien.java
│
├── util
│     DBContext.java
│     EmailUtil.java
│
├── filter
│     AuthFilter.java
│
web
│
├── login.jsp
├── home.jsp
├── sidebar.jsp
├── chatbox.jsp
├── taisan_list.jsp
├── taisan_add.jsp
├── taisan_edit.jsp
├── forgot_password.jsp
├── verify_otp.jsp
├── reset_password.jsp
7. 🗄 Database Design

The system includes several main tables.

Users Table
NguoiDung
---------
id
username
password
email
role
Assets Table
TaiSan
---------
id
tenTaiSan
moTa
soLuong
Classroom Table
PhongHoc
---------
id
tenPhong
toaNha
sucChua
Asset Assignment Table
PhongTaiSan
---------
phongId
taiSanId
soLuong
Asset History Table
LichSuTaiSan
---------
id
taiSanId
phongCu
phongMoi
ngayChuyen
nguoiChuyen
8. 🔐 Security Features

The system includes basic security mechanisms.

Authentication Filter

Unauthorized users cannot access protected pages.

AuthFilter
Session Management

User sessions are maintained using:

HttpSession
Password Security

Passwords should be stored using hashing algorithms such as BCrypt.

9. 🔄 System Workflow

Example workflow for managing assets:

User Login
     ↓
Home Dashboard
     ↓
View Asset List
     ↓
Add / Edit / Delete Asset
     ↓
Assign Asset to Classroom
     ↓
Update Database
10. 🧰 Technologies Used
Technology	Purpose
Java	Backend programming
Servlet	Controller layer
JSP	View layer
JSTL	JSP logic tags
JDBC	Database connection
HTML5	Web structure
CSS3	Styling
Bootstrap	Responsive design
SQL Server / MySQL	Database
Apache Tomcat	Application server
11. 🚀 Future Improvements

Possible improvements for this system include:

Advanced search for assets

Asset movement tracking

Role-based access control

Dashboard with charts and statistics

REST API integration

12. 👨‍💻 Author

Student: Your Name
Course: PRJ301 – Java Web Application Development

📷 Screenshots

(Add screenshots of your application interface here)

Login Page

Home Dashboard

Asset Management Page

Classroom Asset Report
