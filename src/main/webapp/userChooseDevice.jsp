<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 1/2/2024
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  !--========== BOX ICONS ==========-->
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

  <!--========== CSS ==========-->
  <link rel="stylesheet" href="assets/css/styles.css">
    <title> Open Park</title>
</head>
<body>
<!--========== SCROLL TOP ==========-->
<a href="#" class="scrolltop" id="scroll-top">
  <i class='bx bx-up-arrow-alt scrolltop__icon'></i>
</a>

<!--========== HEADER ==========-->
<header class="l-header" id="header">
  <nav class="nav bd-container">
    <a href="#" class="nav__logo">OPEN<b>PARK</b></a>

    <div class="nav__menu" id="nav-menu">
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

    <div class="nav__toggle" id="nav-toggle">
      <i class='bx bx-grid-alt'></i>
    </div>
  </nav>
</header>

<main class="l-main">

  <!--========== DECORATION ==========-->
  <section class="decoration section bd-container" id="decoration">
    <h2 class="section-title orange">
      Choose Your Preferred<br />
      Vehicle Type
    </h2>
    <div class="decoration__container bd-grid">
      <div class="decoration__data">
        <img
                src="assets/img/Bike_Icon.png"
                alt=""
                class="decoration__img"
        />
        <h3 class="decoration__title">Two-wheeler Parking</h3>
        <h5> Rs. 25 per hour </h5>

        <a href="openpark?page=userSearchLocation" class="button button-link">Choose</a>

      </div>

      <div class="decoration__data">
        <img
                src="assets/img/Car_Icon.png"
                alt=""
                class="decoration__img"
        />
        <h3 class="decoration__title">Four-wheeler Parking</h3>
        <h5> Rs. 100 per hour </h5>
        <a href="openpark?page=userSearchLocation" class="button button-link">Choose</a>

      </div>
    </div>
  </section>


  <!--========== SEND FEEDBACK ==========-->
  <section class="send section">
    <div class="send__container bd-container bd-grid">
      <div class="send__content">
        <h2 class="section-title-center send__title">Send Feedback Now</h2>
        <p class="send__description">Start giving away feedbacks we can optimize the application and curate an interactive experience for you!</p>
        <form action="">
          <div class="send__direction">
            <input type="text" placeholder="House address" class="send__input">
            <a href="#" class="button">Send Feedback</a>
          </div>
        </form>
      </div>

      <div class="send__img">
        <img src="assets/img/send.png" alt="">
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
<script>
  let suggestions = [
    "Channel",
    "CodingLab",
    "CodingNepal",
    "YouTube",
    "YouTuber",
    "YouTube Channel",
    "Blogger",
    "Bollywood",
    "Vlogger",
    "Vechiles",
    "Facebook",
    "Freelancer",
    "Facebook Page",
    "Designer",
    "Developer",
    "Web Designer",
    "Web Developer",
    "Login Form in HTML & CSS",
    "How to learn HTML & CSS",
    "How to learn JavaScript",
    "How to became Freelancer",
    "How to became Web Designer",
    "How to start Gaming Channel",
    "How to start YouTube Channel",
    "What does HTML stands for?",
    "What does CSS stands for?",
  ];
</script>
</body>
</html>
