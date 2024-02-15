<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>

    <script src="./script/getLocation.js"></script>
    <%
        HttpSession session1 = (HttpSession) request.getSession();
        String email = (String) session1.getAttribute("email");
    %>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap');

        :root{
            --primary: #de6f3b;
            --secondary: #bfc0c0;
            --white: #fff;
            --text-clr: #5b6475;
            --header-clr: #25273d;
            --next-btn-hover: #de6f3b;
            --back-btn-hover: #8b8c8c;
        }

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            list-style: none;
            outline: none;
            font-family: 'Open Sans', sans-serif;
        }

        body{
            background: var(--primary);
            color: var(--text-clr);
            font-size: 16px;
            position: relative;
        }

        #locationInfo {
            display: none;
            border: 2px solid var(--secondary);
            border-radius: 10px;
            padding: 10px;
            margin-top: 10px;
            width: 100%;
            font-size: 16px;
            box-sizing: border-box;
            transition: 0.5s ease;
            background-color: white;
        }

        /* Additional style for the button */
        .input_wrap button {
            border: 2px solid var(--secondary);
            padding: 10px;
            background: var(--white);
            color: var(--text-clr);
            width: 100%;
            font-size: 16px;
            border-radius: 10px;
            transition: 0.5s ease;
            cursor: pointer;
        }

        /* Add this style for latitude and longitude fields */
        .input_wrap .location_field {
            display: none;
            border: 2px solid var(--secondary);
            border-radius: 10px;
            padding: 10px;
            margin-top: 10px;
            width: calc(50% - 5px);
            font-size: 16px;
            box-sizing: border-box;
            transition: 0.5s ease;
            background-color: white;
        }
        .wrapper{
            width: 750px;
            max-width: 100%;
            background: var(--white);
            margin: 50px auto 0;
            padding: 50px;
            border-radius: 5px;
        }

        .wrapper .header{
            margin-bottom: 35px;
            display: flex;
            justify-content: center;
        }

        .wrapper .header ul{
            display: flex;
        }

        .wrapper .header ul li{
            margin-right: 50px;
            position: relative;
        }

        .wrapper .header ul li:last-child{
            margin-right: 0;
        }

        .wrapper .header ul li:before{
            content: "";
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 55px;
            width: 100%;
            height: 2px;
            background: var(--secondary);
        }

        .wrapper .header ul li:last-child:before{
            display: none;
        }

        .wrapper .header ul li div{
            padding: 5px;
            border-radius: 50%;
        }

        .wrapper .header ul li p{
            width: 50px;
            height: 50px;
            background: var(--secondary);
            color: var(--white);
            text-align: center;
            line-height: 50px;
            border-radius: 50%;
        }

        .wrapper .header ul li.active:before{
            background: var(--primary);
        }

        .wrapper .header ul li.active p{
            background: var(--primary);
        }

        .wrapper .form_wrap{
            margin-bottom: 35px;
        }

        .wrapper .form_wrap h2{
            color: var(--header-clr);
            text-align: center;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .wrapper .form_wrap .input_wrap{
            width: 350px;
            max-width: 100%;
            margin: 0 auto 20px;
        }

        .wrapper .form_wrap .input_wrap:last-child{
            margin-bottom: 0;
        }

        .wrapper .form_wrap .input_wrap label{
            display: block;
            margin-bottom: 5px;
        }

        .wrapper .form_wrap .input_wrap .input, .select {
            border: 2px solid var(--secondary);
            border-radius: 3px;
            padding: 10px;
            display: block;
            width: 100%;
            font-size: 16px;
            transition: 0.5s ease;
            background-color: white;
            border-radius: 10px;
        }

        .wrapper .form_wrap .input_wrap .input:focus{
            border-color: var(--primary);
        }

        .wrapper .btns_wrap{
            width: 350px;
            max-width: 100%;
            margin: 0 auto;
        }

        .wrapper .btns_wrap .common_btns{
            display: flex;
            justify-content: space-between;
        }

        .wrapper .btns_wrap .common_btns.form_1_btns{
            justify-content: flex-end;
        }

        .wrapper .btns_wrap .common_btns button{
            border: 0;
            padding: 12px 15px;
            background: var(--primary);
            color: var(--white);
            width: 135px;
            justify-content: center;
            display: flex;
            align-items: center;
            font-size: 16px;
            border-radius: 3px;
            transition: 0.5s ease;
            cursor: pointer;
        }

        .wrapper .btns_wrap .common_btns button.btn_back{
            background: var(--secondary);
        }

        .wrapper .btns_wrap .common_btns button.btn_next .icon{
            display: flex;
            margin-left: 10px;
        }

        .wrapper .btns_wrap .common_btns button.btn_back .icon{
            display: flex;
            margin-right: 10px;
        }

        .wrapper .btns_wrap .common_btns button.btn_next:hover,
        .wrapper .btns_wrap .common_btns button.btn_done:hover{
            background: var(--next-btn-hover);
        }

        .wrapper .btns_wrap .common_btns button.btn_back:hover{
            background: var(--back-btn-hover);
        }

        .modal_wrapper{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            visibility: hidden;
        }

        .modal_wrapper .shadow{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            opacity: 0;
            transition: 0.2s ease;
        }

        .modal_wrapper .success_wrap{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-800px);
            background: var(--white);
            padding: 50px;
            display: flex;
            align-items: center;
            border-radius: 5px;
            transition: 0.5s ease;
        }

        .modal_wrapper .success_wrap .modal_icon{
            margin-right: 20px;
            width: 50px;
            height: 50px;
            background: var(--primary);
            color: var(--white);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: 700;
        }

        .input_wrap button {
            border: 0;
            padding: 12px 15px;
            background: var(--primary);
            color: var(--white);
            width: 135px;
            justify-content: center;
            display: flex;
            align-items: center;
            font-size: 16px;
            border-radius: 3px;
            transition: 0.5s ease;
            cursor: pointer;
        }


        .modal_wrapper.active{
            visibility: visible;
        }

        .modal_wrapper.active .shadow{
            opacity: 1;
        }

        .modal_wrapper.active .success_wrap{
            transform: translate(-50%,-50%);
        }
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
                        <option disabled selected>Select Your Id Type:</option>
                        <option>Citizenship</option>
                        <option>Passport</option>
                        <option>National ID</option>
                        <option>Driving licence</option>
                    </select>
                </div>

                <div class="input_wrap">
                    <label for="identification">Identification Document:</label>
                    <input type="file" id="identification" name="identification" class="input" required>
                </div>

                <div class="input_wrap">
                    <label for="idnumber">Identification Number</label>
                    <input type="text" name="idnumber" class="input" id="idnumber" required>
                    <br>
                </div>
                <div class="input_wrap">
                    <label for="latitude">Latitude</label>
                    <input id="latitude" class="location_field"  name="latitude" value="latitude">
                </div>

                <div class="input_wrap">
                    <label for="longitude">Longitude</label>
                    <input id="longitude" class="location_field"  name="longitude" value="longitude">
                </div>

                <div class="input_wrap same_line">
                    <input type="checkbox" id="terms" name="terms" value="terms" style="display: inline;" required>
                    <label for="terms">I agree to the terms</label>
                </div>

                <div class="input_wrap same_line">
                    <input type="checkbox" id="privacy" name="privacy" value="privacy" required>
                    <label for="privacy">I agree to the <a href="#">privacy policy.</a></label>
                </div>
            </div>
        </div>
    </div>
    <div class="btns_wrap">
        <div class="common_btns form_3_btns">
            <a href="adminform2.html">
                <button type="button" class="btn_back"><span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span>Back</button>
            </a>
            <button type="button" class="btn_done">Done</button>
        </div>
    </div>
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