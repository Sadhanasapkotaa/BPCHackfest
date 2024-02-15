<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Slots</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container-wrapper {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 20px;
            margin: 0;
            padding: 20px;
        }

        .container {
            background-color: #f0f0f0;
            border-radius: 5px;
        }

        .box {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            grid-gap: 10px;
            text-align: center;
            padding: 10px;
        }

        .sub-box {
            background-color: #ddd;
            padding: 5px;
            text-align: center;
            border-radius: 5px;
        }

        @media (max-width: 768px) {
            .container-wrapper {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-wrapper">
    <c:forEach items="${sensorList}" var="sd" varStatus="loop">
        <div class="container">
            <div class="box">
                <div class="sub-box">${sd.slotNo}</div>
                <div class="sub-box">${sd.status}</div>
                <div class="sub-box">${sd.distance}</div>
                <div class="sub-box">4</div>
            </div>
        </div>
<%--        <c:if test="${loop.index % 3 == 0 && not loop.last}">--%>
<%--            <div style="clear: both;"></div>--%>
<%--        </c:if>--%>
    </c:forEach>
</div>
</body>
</html>
