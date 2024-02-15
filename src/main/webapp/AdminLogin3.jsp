<%--Created by IntelliJ IDEA.
  User: sanzi
  Date: 1/2/2024
  Time: 12:25 PM
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
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="assets/js/adminLogin.js" defer></script>
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
<form action="openpark?page=admindetails3" method="post" enctype="multipart/form-data" >

    <div class="form_wrap">
        <div class="form_3 data_info">
            <h2>Owner's KYC</h2>
                <div class="form_container">
                    <div class="input_wrap">
                                                <label for="email">Email Address</label>
                        <input type="text" name="email" class="input" id="email" value="<%=email%>">
                    </div>
                    <div class="input_wrap">
                        <label for="fullname">Full Name</label>
                        <input type="text" name="fullname" class="input" id="fullname" required>
                    </div>

                    <div class="input_wrap">
                        <label for="photo">Your Recent Photo:</label>
                        <input type="file" id="photo" name="photo" class="input" required>
                    </div>

                    <div class="input_wrap">
                        <label for="address">Contact Address</label>
                        <input type="text" name="address" class="input" id="address" required>
                    </div>

                    <div class="input_wrap">
                        <label for="phone">Phone Number</label>
                        <input type="text" name="phone" class="input" id="phone" required>
                    </div>

                    <div class="input_wrap">
                        <label for="idSelect">Identification Type</label>

                        <select id="idSelect" class="select" name="idSelect" required>
                            <option  disabled selected>Select Your Id Type:</option>
                            <option>Citizenship</option>
                            <option>Passport</option>
                            <option>National ID</option>
                            <option>Driving licence</option>
                        </select>
                        <!-- <input type="text" name="Current Company" class="input" id="company"> -->
                    </div>

                    <div class="input_wrap">
                        <label for="identification">Identification Document:</label>
                        <input type="file" id="identification" name="identification"  class="input" required>
                    </div>

                    <div class="input_wrap">
                        <label for="idnumber">Identification Number</label>
                        <input type="text" name="idnumber" class="input" id="idnumber" required>
                        <br>
                    </div>
<%--                    <div class="input_wrap">--%>
<%--                        <label for="latitude">Latitude</label>--%>
<%--                        <input id="latitude" class="location_field" type="text">--%>
<%--                    </div>--%>

<%--                    <div class="input_wrap">--%>
<%--                        <label for="longitude">Longitude</label>--%>
<%--                        <input id="longitude" class="location_field" type="text">--%>
<%--                    </div>--%>
<%--                    <button type="button" id="getLocationBtn">Get Location</button>--%>

                    <div class="input_wrap same_line">
                        <input type="checkbox" id="terms" name="terms" value="terms" style="display: inline;" required>
                        <label for="terms"> I agree to the <a>terms and conditions.</a></label><br>
                    </div>
                    <div class="input_wrap same_line">
                        <input type="checkbox" id="privacy" name="privacy" value="privacy" required>
                        <label for="privacy"> I agree to the <a>privacy policy.</a></label><br>
                    </div>
                </div>
        </div>
    </div>
    <div class="btns_wrap">
        <div class="common_btns form_3_btns">
            <a href="adminform2.html">
                <button type="button" class="btn_back"><span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span>Back</button>
            </a>
            <button type="submit" class="btn_done">Done</button>
        </div>
    </div>
            </form>
</div>

<div class="modal_wrapper">
    <div class="shadow"></div>
    <div class="success_wrap">
        <span class="modal_icon"><ion-icon name="checkmark-sharp"></ion-icon></span>
        <p>You have successfully completed the process.</p>
    </div>
</div>


</body>
</html>
