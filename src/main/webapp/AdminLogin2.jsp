
  Created by IntelliJ IDEA.
  User: sanzi
  Date: 1/2/2024
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/adminLogin.css">
    <title>Document</title>
    <style>
        .same_line{
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            align-items: center;
            gap:20px;
            margin: 10px 0px;
        }
    </style>

    <%
    HttpSession session1 = (HttpSession) request.getSession();
    String email = (String) session1.getAttribute("email");
    %>

</head>
<body>
<div class="wrapper">
    <div class="header">
        <ul>
            <li class="active form_1_progessbar">
                <div>
                    <p>1</p>
                </div>
            </li>
            <li class="form_2_progessbar">
                <div>
                    <p>2</p>
                </div>
            </li>
            <li class="form_3_progessbar">
                <div>
                    <p>3</p>
                </div>
            </li>
        </ul>
    </div>
    <div class="form_wrap">

        <div class="form_2 data_info" style="display: block;">
            <h2>Parking Information</h2>
            <form action="openpark?page=admindetails2" method="post" enctype="multipart/form-data">
                <div class="form_container">
                    <div class="input_wrap">
<%--                        <label for="email">Email Address</label>--%>
                        <input type="hidden" name="email" class="input" id="email" value="<%=email%>">
                    </div>
                    <div class="input_wrap">
                        <label for="idSelect">Registration Type</label>

                        <select id="idSelect" class="select" name="idSelect" required>
                            <option  disabled selected>Select Your Registration Type:</option>
                            <option>Person</option>
                            <option>Organization</option>
                        </select>
                    </div>

                    <div class="input_wrap">
                        <label for="car_slots">Available Car Slots:</label>
                        <input type="number" name="car_slots" class="input" id="car_slots" required>
                    </div>
<%--                    <div class="input_wrap">--%>
<%--                        <label for="bike_slots">Available Bike Slots:</label>--%>
<%--                        <input type="number" name="bike_slots" class="input" id="bike_slots" required>--%>
<%--                    </div>--%>
                    <div class="input_wrap">
                        <label for="bike_cost">Hourly Bike Parking Cost</label>

                        <input type="text" name="bike_cost" class="input" id="bike_cost" value="Rs.25" readonly>
                    </div>

                    <div class="input_wrap">
                        <label for="car_cost">Hourly Car Parking Cost</label>
                        <input type="text" name="car_cost" class="input" id="car_cost" value="Rs.50" readonly>
                    </div>

                    <div class="input_wrap same_line">
                        <label for="full_time">24 Hour availability</label><br>
                        <input type="checkbox" id="full_time" name="full_time" value="full_time" onclick="checkFunction()" required>

                    </div>

                    <div class="input_wrap" id="startTime">
                        <label for="start_time">Start Time</label><br>
                        <input type="time" id="start_time" name="start_time" value="start_time" class="input" required>
                    </div>
                    <div class="input_wrap"  id="endTime" >
                        <label for="end_time">End Time</label><br>
                        <input type="time" id="end_time" name="end_time" value="end_time" class="input" required>
                    </div>



                </div>
                <div class="btns_wrap">
                    <div class="common_btns form_2_btns">
                        <button type="button" class="btn_back"><span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span><a href="openpark?page=adminLogin">Back</a></button>
                        <button type="submit" class="btn_next">Next <span class="icon"><ion-icon name="arrow-forward-sharp"></ion-icon></span></button>
                    </div>
                </div>
            </form>
        </div>

    </div>

</div>

</body>
<script>

    // Function for hiding start and end task when the checkbox is ticked
    function checkFunction() {
        var checkBox = document.getElementById("fullTime");

        var timeInputStart = document.getElementById("startTime");
        var timeInputEnd = document.getElementById("endTime");

        if (checkBox.checked == true) {
            timeInputStart.style.display = "none";
            timeInputEnd.style.display = "none";
        } else {
            timeInputStart.style.display = "block";
            timeInputEnd.style.display = "block";
        }
    }
</script>
</html>
