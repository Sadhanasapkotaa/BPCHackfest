<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

    <!--========== BOX ICONS ==========-->
    <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
    />

    <!--========== CSS ==========-->
    <link rel="stylesheet" href="assets/css/styles.css" />
</head>
<body>
<!--========== SCROLL TOP ==========-->
<a href="#" class="scrolltop" id="scroll-top">
    <i class="bx bx-up-arrow-alt scrolltop__icon"></i>
</a>

<!--========== HEADER ==========-->
<header class="l-header" id="header">
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

<%--                <li class="nav__item">--%>
<%--                    <a href="openpark?page=userLoginSignup" class="nav-button">Login</a>--%>
<%--                    <!-- <i class="bx bx-toggle-left change-theme" id="theme-button"></i> -->--%>
<%--                </li>--%>

                <% if (session != null && session.getAttribute("id") != null) { %>
                <!--if the user is logged in-->
                <li class="nav__item">
                    <a href="openpark?page=userLogout" class="nav-button">Logout</a>
                </li>
                <% } else { %>
                <li class="nav__item">
                    <a href="openpark?page=userLoginSignup" class="nav-button">Login as User</a>
                </li>
                <% } %>


            </ul>
        </div>

        <div class="nav__toggle" id="nav-toggle">
            <i class="bx bx-grid-alt"></i>
        </div>
    </nav>
</header>

<main class="l-main">
    <!--========== HOME ==========-->
    <section class="home" id="home">
        <div class="home__container bd-container bd-grid">
            <div class="home__img">
                <img src="assets/img/Landing.png" alt="" />
            </div>

            <div class="home__data">
                <h1 class="home__title">Urban Parking Solution</h1>
                <p class="home__description">
                    Open Park team introduces an onestop for our most pressing urban
                    parking problems.The parking-space sharing helps us to detect untouched area for parking.
                </p>
                <a href="openpark?page=userChooseDevice" class="button">Get Started</a>
<%--                <a href="openpark?page=OpenMap">Map</a>--%>
                <a href="openpark?page=ParkingSlot">Slot</a>
            </div>
        </div>
    </section>

    <!--========== SHARE ==========-->
    <section class="share section bd-container" id="share">
        <div class="share__container bd-grid">
            <div class="share__data">
                <h2 class="section-title-center">
                    Sharing your  <br />
                    Parking Space
                </h2>
                <p class="share__description">
                    Sharing the extra parking space for effective management of the vehicles
                    supports you and other for better space.
                </p>
                <a href="openpark?page=appadminLogin" class="button">Login as Owner</a>
                <a href="openpark?page=adminLogin" class="button">Register</a>
            </div>

            <div class="share__img">
                <img src="assets/img/shared.png" alt="" />
            </div>
        </div>
    </section>

    <!--========== DECORATION ==========-->
    <section class="decoration section bd-container" id="decoration">
        <h2 class="section-title">
            Park Sharing Facility's<br />
            Core Features
        </h2>
        <div class="decoration__container bd-grid">
            <div class="decoration__data">
                <img
                        src="assets/img/Bike_Icon.png"
                        alt=""
                        class="decoration__img"
                />
                <h3 class="decoration__title">Bike Parking Facility</h3>
            </div>

            <div class="decoration__data">
                <img
                        src="assets/img/Car_Icon.png"
                        alt=""
                        class="decoration__img"
                />
                <h3 class="decoration__title">Car Parking Facility</h3>
            </div>

            <div class="decoration__data">
                <img
                        src="assets/img/decoration3.png"
                        alt=""
                        class="decoration__img"
                />
                <h3 class="decoration__title">Top-notch Security</h3>
            </div>
        </div>
    </section>

    <!--========== ACCESSORIES ==========-->
    <section class="accessory section bd-container" id="accessory">
        <h2 class="section-title">
            Park at  <br />
            Best Services
        </h2>

        <div class="accessory__container bd-grid">
            <div class="accessory__content">
                <img
                        src="assets/img/Bike_Icon.png"
                        alt=""
                        class="accessory__img"
                />
                <h3 class="accessory__title">Bike Park Pricing</h3>
                <span class="accessory__category">Per Hour</span>
                <span class="accessory__preci">Rs. 25</span>
                <a href="#" class="button accessory__button"
                ><i class="bx bx-heart"></i
                ></a>
            </div>

            <div class="accessory__content">
                <img
                        src="assets/img/Car_Icon.png"
                        alt=""
                        class="accessory__img"
                />
                <h3 class="accessory__title">Car Park Pricing</h3>
                <span class="accessory__category">Per Hour</span>
                <span class="accessory__preci">Rs. 100</span>
                <a href="#" class="button accessory__button"
                ><i class="bx bx-heart"></i
                ></a>
            </div>


        </div>
    </section>

    <!--========== SEND FEEDBACK SECTION ==========-->
    <section class="send section">
        <div class="send__container bd-container bd-grid">
            <div class="send__content">
                <h2 class="section-title-center send__title">Send Feedback Now</h2>
                <p class="send__description">
                    Start giving away feedbacks we can optimize the application and
                    curate an interactive experience for you!
                </p>
                <form action="">
                    <div class="send__direction">
                        <input
                                type="text"
                                placeholder="House address"
                                class="send__input"
                        />
                        <a href="#" class="button">Send Feedback</a>
                    </div>
                </form>
            </div>

            <div class="send__img">
                <img src="assets/img/send.png" alt="" />
            </div>
        </div>
    </section>
</main>

<!--========== FOOTER ==========-->
<footer class="footer section">
    <div class="footer__container bd-container bd-grid">
        <div class="footer__content">
            <h3 class="footer__title">
                <a href="#" class="footer__logo">OPEN<b>PARK</b></a>
            </h3>
            <p class="footer__description">Looking for<br> parking space?</p>
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
            <a href="#" class="footer__social"><i class='bx bxl-facebook-circle '></i></a>
            <a href="#" class="footer__social"><i class='bx bxl-twitter'></i></a>
            <a href="#" class="footer__social"><i class='bx bxl-instagram-alt'></i></a>
        </div>
    </div>

    <p class="footer__copy">&#169; 2024 Team Everest. Kathfest Hackathon. All right reserved</p>
</footer>

<!--========== SCROLL REVEAL ==========-->
<script src="https://unpkg.com/scrollreveal"></script>

<!--========== MAIN JS ==========-->
<script src="assets/js/main.js"></script>
</body>
</html>