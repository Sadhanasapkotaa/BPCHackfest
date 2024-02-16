<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Slots</title>
    <style>
        .container-wrapper {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); /* Adjust minmax values as needed */
            gap: 20px;
            padding: 20px; /* Add padding to container wrapper */
        }

        .container {
            margin-bottom: 20px; /* Add margin to container */
        }

        .box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100px;
            border: 1px solid #000;
            border-radius: 10px; /* Add border radius */
            padding: 10px; /* Add padding */
            cursor: pointer; /* Change cursor to pointer for clickable elements */
        }

        .full {
            background-color: red;
        }

        .empty {
            background-color: green;
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
<% String useremail = (String) session.getAttribute("email"); %>
<div class="container-wrapper">
    <c:forEach items="${sensorList}" var="sd" varStatus="loop">
        <div class="container">
            <c:choose>
                <c:when test="${sd.status eq 'empty'}">
                    <div class="box empty" onclick="confirmBooking(${sd.slotNo})">
                        <div class="sub-box">${sd.slotNo}</div>
                        <div class="sub-box">${sd.status}</div>
                        <div class="sub-box">${sd.distance}</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="box full" onclick="showMessage()">
                        <div class="sub-box">${sd.slotNo}</div>
                        <div class="sub-box">${sd.status}</div>
                        <div class="sub-box">${sd.distance}</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <form id="bookingForm" method="post" action="openpark?page=bookingSlot">
            <input type="hidden" id="slotNo" name="slotNo" value=${sd.slotNo}>

            <input type="hidden" name="email" value=<%=useremail%> >
                    </form>
    </c:forEach>
</div>

<!-- Hidden form to handle booking submission -->


<script>
    function confirmBooking(slotNo) {
        var confirmation = confirm("Are you sure you want to book slot " + slotNo + "?");
        if (confirmation) {
            // Set slot number and submit the form
            document.getElementById('slotNo').value = slotNo;
            document.getElementById('bookingForm').submit();
        } else {
            // Do nothing
        }
    }

    function showMessage() {
        alert("This slot is already full or booked.");
    }
</script>
</body>
</html>
