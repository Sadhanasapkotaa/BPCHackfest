<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
</head>
<body>
<form action="openpark?page=admindetails" method="post">
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
            <div class="form_1 data_info">
                <h2>Personal Info</h2>

                <div class="form_container">
                    <%-- display error message if username or password is incorrect--%>

                    <div class="input_wrap">
                        <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="error" style="color: #ff3860;" id="error-message"><%= request.getAttribute("errorMessage") %></div>
                        <% } %>
                        <label for="email">Email Address</label>
                        <input type="text" name="email" class="input" id="email" required>
                    </div>
                    <div class="input_wrap">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="input" id="password" required>
                    </div>
                    <div class="input_wrap">
                        <label for="confirm_password">Confirm Password</label>
                        <input type="password" name="confirm password" class="input" id="confirm_password" required>
                    </div>
                </div>
            </div>
        </div>
        <div class="btns_wrap">
            <div class="common_btns form_1_btns">
                <button type="submit" class="btn_next" > Next <span class="icon"><ion-icon name="arrow-forward-sharp"></ion-icon></span></button>
            </div>
        </div>
    </div>
</form>
</body>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>

</html>