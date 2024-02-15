<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 2/16/2024
  Time: 12:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Verify user</title>
    <!--========== BOX ICONS ==========-->
    <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
    />

    <!--========== CSS ==========-->
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/userSearch.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <style>
        .qr-code {
            visibility: hidden;
        }
    </style>
</head>
[12:03 AM] Sadhana Sapkota
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <!--========== BOX ICONS ==========-->
    <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
    />

    <!--========== CSS ==========-->
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/userSearch.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <style>
        .qr-code {
            visibility: hidden;
        }
    </style>
</head>
<body style="position: relative">
<!--========== HEADER ==========-->
<header class="l-header" id="header1">
    <nav class="nav bd-container">
        <a href="#" class="nav__logo">OPEN<b>PARK</b></a>

        <div class="nav__menu" id="nav-menu1">
            <ul class="nav__list">
                <li class="nav__item">
                    <span style="margin: 10px;"></span>
                    <%--          <a href="openpark?page=userLoginSignup" class="nav-button">Login</a>--%>

                        <% if (session != null && session.getAttribute("id") != null) { %>
                    <!--if the user is logged in-->
                <li class="nav__item">
                    <a href="openpark?page=userLogout" class="nav-button">Logout</a>
                </li>
                <% } else { %>
                <li class="nav__item">
                    <a href="openpark?page=userLoginSignup" class="nav-button">Login</a>
                </li>
                <% } %>
                <!-- <i class="bx bx-toggle-left change-theme" id="theme-button"></i> -->
                </li>

            </ul>
        </div>

        <div class="nav__toggle" id="nav-toggle1">
            <i class='bx bx-grid-alt'></i>
        </div>
    </nav>
</header>

<main
        style="
        margin-top: 10rem;
        align-items: center;
        display: flex;
        justify-content: center;
      "
>
    <div class="container-fluid">
        <div class="text-center">
            <img
                    src="https://chart.googleapis.com/chart?cht=qr&chl=Hello+World&chs=160x160&chld=L|0"
                    class="qr-code img-thumbnail img-responsive"
            />
        </div>

        <button type="button" class="button" id="generate">Generate QR</button>
    </div>
</main>

<footer class="footer section">
    <div class="footer__container bd-container bd-grid">
        <div class="footer__content">
            <h3 class="footer__title">
                <a href="#" class="footer__logo">OPEN<b>PARK</b></a>
            </h3>
            <p class="footer__description">
                Looking for<br />
                parking space?
            </p>
        </div>

        <div class="footer__content">
            <h3 class="footer__title">Our Services</h3>
            <ul>
                <li><a href="#" class="footer__link">Pricing </a></li>
                <li><a href="#" class="footer__link">Discounts</a></li>
                <li><a href="#" class="footer__link">FAQs</a></li>
            </ul>
        </div>

        <div class="footer__content">
            <h3 class="footer__title">Our Company</h3>
            <ul>
                <li><a href="#" class="footer__link">Blog</a></li>
                <li><a href="#" class="footer__link">About us</a></li>
                <li><a href="#" class="footer__link">Our mision</a></li>
            </ul>
        </div>

        <div class="footer__content">
            <h3 class="footer__title">Social</h3>
            <a href="#" class="footer__social"
            ><i class="bx bxl-facebook-circle"></i
            ></a>
            <a href="#" class="footer__social"><i class="bx bxl-twitter"></i></a>
            <a href="#" class="footer__social"
            ><i class="bx bxl-instagram-alt"></i
            ></a>
        </div>
    </div>

    <p class="footer__copy">
        &#169; 2024 Team Everest. BPC Hackathon. All right reserved
    </p>
</footer>
</body>

<script>
    const id = 2;
    const jsondata = [
        {
            id: 1,
            name: "T-Shirt",
            category: "Clothing",
            price: 20,
            quantity: null,
        },
        {
            id: 2,
            name: "Smartphone",
            category: "Electronics",
            price: 500,
            quantity: null,
        },
        {
            id: 12,
            name: "Headphones",
            category: "Electronics",
            price: 50,
            quantity: null,
        },
    ];

    // Filter the jsondata array to get items with id equal to 12
    const selectedData = jsondata.filter((item) => item.id === id);

    const selectedDataString = JSON.stringify(selectedData);
</script>
<script>
    function htmlEncode(selectedDataString) {
        return $("<div/>").text(selectedDataString).html();
    }
    $(function () {
        $("#generate").click(function () {
            $(".qr-code")
                .css("visibility", "visible")
                .attr(
                    "src",
                    "https://chart.googleapis.com/chart?cht=qr&chl=" +
                    htmlEncode(selectedDataString) +
                    "&chs=160x160&chld=L|0"
                );
        });
    });
</script>
</html>

[12:03 AM] Sadhana Sapkota
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <!--========== BOX ICONS ==========-->
    <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
    />

    <!--========== CSS ==========-->
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/userSearch.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <style>
        .qr-code {
            visibility: hidden;
        }
    </style>
</head>
<body style="position: relative">
<!--========== HEADER ==========-->
<header class="l-header" id="header" style="display: block">
    <nav class="nav bd-container">
        <a href="#" class="nav__logo">OPEN<b>PARK</b></a>

        <div class="nav__menu" id="nav-menu">
            <ul class="nav__list">
                <li class="nav__item">
                    <a href="#home" class="nav__link active-link">Home</a>
                </li>
                <li class="nav__item">
                    <a href="#share" class="nav__link">Owner</a>
                </li>
                <li class="nav__item">
                    <a href="#decoration" class="nav__link">Features</a>
                </li>
                <li class="nav__item">
                    <a href="#accessory" class="nav__link">Pricing</a>
                </li>

                <li class="nav__item">
                    <a href="userLoginSignup.html" class="nav-button">Login</a>
                    <!-- <i class="bx bx-toggle-left change-theme" id="theme-button"></i> -->
                </li>
            </ul>
        </div>

        <div class="nav__toggle" id="nav-toggle">
            <i class="bx bx-grid-alt"></i>
        </div>
    </nav>
</header>

<main
        style="
        margin-top: 10rem;
        align-items: center;
        display: flex;
        justify-content: center;
      "
>
    <div class="container-fluid">
        <div class="text-center">
            <img
                    src="https://chart.googleapis.com/chart?cht=qr&chl=Hello+World&chs=160x160&chld=L|0"
                    class="qr-code img-thumbnail img-responsive"
            />
        </div>

        <button type="button" class="button" id="generate1">Generate QR</button>
    </div>
</main>

<footer class="footer section">
    <div class="footer__container bd-container bd-grid">
        <div class="footer__content">
            <h3 class="footer__title">
                <a href="#" class="footer__logo">OPEN<b>PARK</b></a>
            </h3>
            <p class="footer__description">
                Looking for<br />
                parking space?
            </p>
        </div>

        <div class="footer__content">
            <h3 class="footer__title">Our Services</h3>
            <ul>
                <li><a href="#" class="footer__link">Pricing </a></li>
                <li><a href="#" class="footer__link">Discounts</a></li>
                <li><a href="#" class="footer__link">FAQs</a></li>
            </ul>
        </div>

        <div class="footer__content">
            <h3 class="footer__title">Our Company</h3>
            <ul>
                <li><a href="#" class="footer__link">Blog</a></li>
                <li><a href="#" class="footer__link">About us</a></li>
                <li><a href="#" class="footer__link">Our mision</a></li>
            </ul>
        </div>

        <div class="footer__content">
            <h3 class="footer__title">Social</h3>
            <a href="#" class="footer__social"
            ><i class="bx bxl-facebook-circle"></i
            ></a>
            <a href="#" class="footer__social"><i class="bx bxl-twitter"></i></a>
            <a href="#" class="footer__social"
            ><i class="bx bxl-instagram-alt"></i
            ></a>
        </div>
    </div>

    <p class="footer__copy">
        &#169; 2024 Team Everest. BPC Hackathon. All right reserved
    </p>
</footer>
</body>

<script>
    const id = 2;
    const jsondata = [
        {
            id: 1,
            name: "T-Shirt",
            category: "Clothing",
            price: 20,
            quantity: null,
        },
        {
            id: 2,
            name: "Smartphone",
            category: "Electronics",
            price: 500,
            quantity: null,
        },
        {
            id: 12,
            name: "Headphones",
            category: "Electronics",
            price: 50,
            quantity: null,
        },
    ];

    // Filter the jsondata array to get items with id equal to 12
    const selectedData = jsondata.filter((item) => item.id === id);

    const selectedDataString = JSON.stringify(selectedData);
</script>
<script>
    function htmlEncode(selectedDataString) {
        return $("<div/>").text(selectedDataString).html();
    }
    $(function () {
        $("#generate").click(function () {
            $(".qr-code")
                .css("visibility", "visible")
                .attr(
                    "src",
                    "https://chart.googleapis.com/chart?cht=qr&chl=" +
                    htmlEncode(selectedDataString) +
                    "&chs=160x160&chld=L|0"
                );
        });
    });
</script>
</html>

</html>
