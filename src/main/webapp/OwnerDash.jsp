<%--
  Created by IntelliJ IDEA.
  User: sanzi
  Date: 1/3/2024
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Owner Dashboard</title>

    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://kit.fontawesome.com/9d508255d4.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>

    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/table.css">

    <link rel="stylesheet" href="assets/css/status.css">
    <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>

</head>
<body>
<div class="fristpage">

    <div class="container">



        <div class="progress-bar__container">



            <div class="progress-bar">



                <span class="progress-bar__text"></span>



            </div>



        </div>
    </div>
    <div class="card">
        <div class="cardbike">
            <div class="bike">
                <img src="assets/imgage/Bike_Icon.png" alt="" srcset="">
                <div class="text" >Total Bikes <div id="biketext"></div> </div>

            </div>

        </div>
        <div class="cardcar">
            <div class="car">
                <img src="assets/imgage/Car_Icon.png" alt="" srcset="">
                <div class="text" >Total cars <div id="cartext"></div></div>

            </div>

        </div>
    </div>


    <div class="sidebar">

        <div class="logo-details">



            <div class="logo_name">Open Park</div>

            <i class='bx bx-menu' id="btn" ></i>

        </div>

        <ul class="nav-list">



            <li>

                <a href="openpark?page=ownerDash">

                    <i class="fa-sharp fa-solid fa-house"></i>

                    <span class="links_name">Home</span>

                </a>

                <span class="tooltip">Home</span>

            </li>



            <li>

                <a href="openpark?page=car">

                    <i class="fa-solid fa-car"></i>

                    <span class="links_name">Car</span>

                </a>

                <span class="tooltip">Car</span>

            </li>



            <li>

                <a href="openpark?page=bike">

                    <i class="fa-solid fa-bicycle"></i>

                    <span class="links_name">bike</span>

                </a>

                <span class="tooltip">bike</span>

            </li>



            <li>

                <a href="openpark?page=booking">

                    <i class="fa-solid fa-book"></i>

                    <span class="links_name">Active Booking</span>

                </a>

                <span class="tooltip">Active Booking </span>

            </li>





            <li class="profile">

                <div class="profile-details">

                    <div class="profileimg"> <i class="fa-solid fa-user"  ></i> </div>



                    <div class="name_job">

                        <div class="name"></div>



                    </div>

                </div>

                <a href="openpark?page=adminLogout"> <i class='bx bx-log-out' id="log_out"  ></i> </a>

            </li>

        </ul>

    </div>

    <div class="home-section">
        <div class="tablegrids">
            <div class="tablegrid">

                <!-- Create your table here -->

                <table>

                    <thead>

                    <tr>

                        <th>Today's List</th>

                        <th>Earnings</th>

                    </tr>

                    </thead>

                    <tbody>

                    <tr>

                        <td>Bike</td>

                        <td>Rs.80</td>

                    </tr>

                    <tr>

                        <td>Car</td>

                        <td>Rs.200</td>

                    </tr>
                    <tr>

                        <td>Bike</td>

                        <td>Rs.80</td>

                    </tr>
                    <tr>

                        <td>Bike</td>

                        <td>Rs.80</td>

                    </tr>

                    <!-- Add more rows as needed -->

                    </tbody>

                </table>

            </div>



        </div>
        <div class="chartgrid">
            <div id="chartContainer" style="height: 300px; width: 100%;"></div>
        </div>






    </div>



</div>


<script>

    window.onload = function () {

        var chart = new CanvasJS.Chart("chartContainer", {

            animationEnabled: true,

            theme: "light2",

            title: {

                text: "Earnings Chart"

            },

            axisX: {

                title: "Days" // Label for X-axis

            },

            axisY: {

                title: "Earnings (in Rs.)" // Label for Y-axis

            },

            data: [{

                type: "line",

                indexLabelFontSize: 16,

                dataPoints: [

                    { label: "Day 1", y: 450 },

                    { label: "Day 2", y: 414 },

                    { label: "Day 3", y: 520, indexLabel: "\u2191 highest", markerColor: "red", markerType: "triangle" },

                    { label: "Day 4", y: 460 },

                    { label: "Day 5", y: 450 },

                    { label: "Day 6", y: 500 },

                    { label: "Day 7", y: 480 },

                    { label: "Day 8", y: 480 },

                    { label: "Day 9", y: 410, indexLabel: "\u2193 lowest", markerColor: "DarkSlateGrey", markerType: "cross" },

                    { label: "Day 10", y: 500 },

                    { label: "Day 11", y: 480 },

                    { label: "Day 12", y: 510 }

                ]

            }]

        });

        chart.render();

    }

</script>






<script src="assets/js/nav.js"></script>

<script src="assets/js/status.js"></script>




</body>
</html>
