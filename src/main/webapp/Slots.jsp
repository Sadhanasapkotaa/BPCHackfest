<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Slots</title>
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
        <%-- Start of scriptlet --%>
        <c:choose>
            <c:when test="${sd.status eq 'full'}">
                <style>
                    .container {
                        background-color: red;
                    }
                </style>
            </c:when>
            <c:otherwise>
                <style>
                    .container {
                        background-color: #00ff00; /* your default color when status is not full */
                    }
                </style>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
</body>
</html>
