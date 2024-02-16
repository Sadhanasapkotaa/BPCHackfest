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
 
### Organization Owners

They have the opportunity to rent out their parking spaces to end customers, thereby utilizing their private property and earning income. Additionally:

- Rent the open available designated parking space
- Create profiles providing details about their available parking spaces
- User Booking and list view

### End Customers
 
End customers are users seeking parking solutions. They can use the application to:
 
- Search for available parking spaces in specific areas.
- Book parking spaces for desired durations.
- Receive QR codes for access.


## Tech Stack

**Frontend:** JSP, HTML, CSS, Bootstrap, JavaScript

**Server:** Apache Tomcat 8.5.87

**Database Connectivity:** JDBC

**Backend:** Java Servlet

**External libraries:** JSTL 1.2, GSON 2.10.1, Leaflet 1.9.4


# Screenshots

![Landing Page](https://private-user-images.githubusercontent.com/92221867/305537125-19696cb1-368a-4091-8a57-705221b66a1e.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDgxMTQwNDcsIm5iZiI6MTcwODExMzc0NywicGF0aCI6Ii85MjIyMTg2Ny8zMDU1MzcxMjUtMTk2OTZjYjEtMzY4YS00MDkxLThhNTctNzA1MjIxYjY2YTFlLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAyMTYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMjE2VDIwMDIyN1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTFmYWIyOWE4ZTdmYmMwZWZhYzM2Zjc2MjVlMTY2OGM5NWJhZTAwMmZlYjg1ZDZmYTYwZjkyZGZiMGQzZDhhN2MmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.u_-J5yyw-kxShN7A83dhgf_RSQFUZbmHI2n6IMbFvlg)

![Map](https://private-user-images.githubusercontent.com/92221867/305538154-aed29ac2-8203-450b-91e8-378d92b57cf9.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDgxMTM5MzUsIm5iZiI6MTcwODExMzYzNSwicGF0aCI6Ii85MjIyMTg2Ny8zMDU1MzgxNTQtYWVkMjlhYzItODIwMy00NTBiLTkxZTgtMzc4ZDkyYjU3Y2Y5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAyMTYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMjE2VDIwMDAzNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBmMGM3YTNhMTQzNjEwODJlNGUyN2YwYmYxMTg4MGUwMDMxM2FlNjExYjY4MGQ5OGY4ZmI2YTlhZjk5YWRhYTAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.AEvEe9ymOuKoCoPot_9X5hNhh6ap6hXXihBQ5t9rKgw)
 
![Slot Booking](https://private-user-images.githubusercontent.com/92221867/305538823-12657016-984b-429f-ae04-60fa018bb255.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDgxMTQxMTQsIm5iZiI6MTcwODExMzgxNCwicGF0aCI6Ii85MjIyMTg2Ny8zMDU1Mzg4MjMtMTI2NTcwMTYtOTg0Yi00MjlmLWFlMDQtNjBmYTAxOGJiMjU1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAyMTYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMjE2VDIwMDMzNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWZkNjM1NDg4NWI1Nzg1M2Y4ZTYyZGRiM2NmMWY1MzBiNGQ1MmFhZDRkMTMxZGZhODI1YTM5ZTkxNmEwMTM0ZDcmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.SjifbMT8Oy-OIfRcxpqCwd4vUXFKjukRg-QtEVzrajE)

![QR Verification](https://private-user-images.githubusercontent.com/92221867/305538879-605d94c8-9e2a-4930-a951-accc175d438c.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDgxMTQxOTgsIm5iZiI6MTcwODExMzg5OCwicGF0aCI6Ii85MjIyMTg2Ny8zMDU1Mzg4NzktNjA1ZDk0YzgtOWUyYS00OTMwLWE5NTEtYWNjYzE3NWQ0MzhjLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAyMTYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMjE2VDIwMDQ1OFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWE1ODQ0ZWQyY2E4NzFhNWUzZWYyNTI0MDlkN2RlYzBmNmJiNDA4YWMxZjU2ZWNlNDVhNzBiNjJkMDdlZTRiNzAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.u7Ox_Ua5DwGyb4GIXQcx9So6F55FUuZj6ZCB-umlhkM)





