<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Slots</title>
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
        }

        .box {
            width: 100px;
            height: 100px;
            border: 1px solid black;
            margin: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sub-box {
            padding: 10px;
        }

        .full {
            background-color: red;
        }

        .empty {
            background-color: green;
        }
    </style>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-wrapper">
    <c:forEach items="${sensorList}" var="sd" varStatus="loop">
        <div class="container">
            <div class="box ${sd.status eq 'full' ? 'full' : 'empty'}">
                <div class="sub-box">${sd.slotNo}</div>
                <div class="sub-box">${sd.status}</div>
                <div class="sub-box">${sd.distance}</div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
