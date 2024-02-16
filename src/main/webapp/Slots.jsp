<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Slots</title>
    <meta http-equiv="refresh" content="3">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 20px;
        }
        /*.container-wrapper {*/
        /*    display: grid;*/
        /*    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); !* Adjust minmax values as needed *!*/
        /*    gap: 20px;*/
        /*    padding: 20px; !* Add padding to container wrapper *!*/
        /*}*/

        .container-wrapper {
            display: grid;
            grid-template-columns: repeat(4, minmax(200px, 1fr)); /* Display four slots per row */
            gap: 20px;
            padding: 20px; /* Add padding to container wrapper */
        }
        .container {
            margin-bottom: 20px; /* Add margin to container */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100px;
            width: 100px; /* Set width to create square box */
            border-radius: 10px; /* Add border radius */
            padding: 10px; /* Add padding */
            cursor: pointer; /* Change cursor to pointer for clickable elements */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            background-color: #fff;
        }
        .box:hover {
            transform: translateY(-5px);
        }
        .full {
            background-color: #ff6161;
            color: #fff;
        }
        .empty {
            background-color: #6dd17e;
            color: #fff;
        }
        .sub-box {
            font-size: 16px;
            font-weight: bold;
        }
        @media (max-width: 768px) {
            /* Adjust styles for smaller screens */
            .container-wrapper {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); /* Adjust minmax values for smaller screens */
            }
        }
        @media (max-width: 576px) {
            /* Adjust styles for even smaller screens */
            .container-wrapper {
                grid-template-columns: repeat(auto-fill, minmax(100px, 1fr)); /* Adjust minmax values for even smaller screens */
            }
        }
    </style>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String useremail = (String) session.getAttribute("email1"); %>
<h1 style="text-align: center">${companyName}</h1>
<div class="container-wrapper">
    <c:forEach items="${sensorList}" var="sd" varStatus="loop">
        <div class="container">
            <c:choose>
                <c:when test="${sd.status eq 'empty'}">
                    <div class="box empty" onclick="confirmBooking(${sd.slotNo})">
                        <div class="sub-box">Slot ${sd.slotNo}</div>
                        <div class="sub-box">${sd.status}</div>
<%--                        <div class="sub-box">${sd.distance}</div>--%>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="box full" onclick="showMessage()">
                        <div class="sub-box">Slot ${sd.slotNo}</div>
                        <div class="sub-box">${sd.status}</div>
<%--                        <div class="sub-box">${sd.distance}</div>--%>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</div>

<!-- Hidden form to handle booking submission -->



</body>
</html>
