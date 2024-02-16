# TeamEverest - Project "Open Park" for BPC HACKATHON

# Project Description

Openpark is a Java-based parking system that utilizes MySQL as its database. The aim of the project is to provide a user-friendly and efficient platform for booking and renting the available parking areas nearby your locations.


## Getting Started

To get started with the project, you will need to:

1. Install Java,MySQL and Tomcat on your local machine.
2. Clone the repository.
3. Import the project into your preferred IDE.
4. Be sure to update the URL, USERNAME, and PASSWORD constants in the DBUtil.java file with your MySQL database connection details.

For ESP setup, you will need to:

1. Save the 'index.php' file inside the esprequire folder to your 'xampp\htdocs'.
2. Use the code provided in the same folder in .txt file for backend data processing.
    
## Features

To run the application, start your Tomcat server and run the project in your local web browser. The application allows you to:

### Super Admin

This privileged user has comprehensive access to all functions within the application and oversees the entire system's operation and data management. Moreover it can: 

- Approve the admin 
- Verify the parking space
- See the available slot information
 
### House Owners

They have the opportunity to rent out their parking spaces to end customers, thereby utilizing their private property and earning income. Additionally:

- Rent the open available designated parking space
- Create profiles providing details about their available parking spaces
- User Booking and list view

### End Customers
 
End customers are users seeking parking solutions. They can use the application to:
 
- Search for available parking spaces in specific areas.
- Book parking spaces for desired durations.
- Receive QR codes for access.
- Make payments securely through the app2E


## Tech Stack

**Frontend:** JSP, HTML, CSS, Bootstrap, JavaScript

**Server:** Apache Tomcat 8.5.87

**Database Connectivity:** JDBC

**Backend:** Java Servlet

**External libraries:** JSTL 1.2, GSON 2.10.1, Leaflet 1.9.4


# Screenshots

![Login Page](https://private-user-images.githubusercontent.com/92221867/305538154-aed29ac2-8203-450b-91e8-378d92b57cf9.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDgxMTI0OTMsIm5iZiI6MTcwODExMjE5MywicGF0aCI6Ii85MjIyMTg2Ny8zMDU1MzgxNTQtYWVkMjlhYzItODIwMy00NTBiLTkxZTgtMzc4ZDkyYjU3Y2Y5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAyMTYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMjE2VDE5MzYzM1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTdiNTdkYzcxYjBlYTVlZjQ2NDM2MWJjMmQxZWNiOTk4MzIzZDA1ODI4YWMwYTM4NjkwMzAyODZkNmIzYmZhN2ImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.1rRoLaRMNyela_rgvscyaLuoQFo_ptuyh5NQUq6G0T0)

![Authorize User Details](https://user-images.githubusercontent.com/92221867/235431692-df39112c-43fa-41fa-9653-0d2cfed0590f.png)
 
![Admin Dashbord](https://user-images.githubusercontent.com/92221867/235432082-6f50bed4-59d3-4d27-8fb7-bd7eac811259.png)

![User Vote](https://user-images.githubusercontent.com/92221867/235432197-73960dcb-2541-4817-b235-3be4ddb163cc.png)





