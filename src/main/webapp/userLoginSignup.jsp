<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 1/2/2024
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="./assets/css/login.css" />
  <link rel="stylesheet" href="./assets/css/styles.css" />

</head>
<body>
<main>
  <div class="box">
    <div class="inner-box">
      <div class="forms-wrap">
        <form action="openpark?page=loginUser" method="post"  class="sign-in-form">

          <div class="logo">
            <img src="./assets/img/logo.png" alt="easyclass" />
            <h4>openpark</h4>
          </div>

          <div class="heading">
            <h2>Welcome Back</h2>
            <h6>Not registred yet?</h6>
            <a href="#" class="toggle">Sign up</a>
          </div>

          <%--                display error message if username or password is incorrect--%>
          <% if (request.getAttribute("errorMessage") != null) { %>
          <div class="error" style="color: #ff3860;" id="error-message"><%= request.getAttribute("errorMessage") %></div>
          <% } %>

          <div class="actual-form">
            <div class="input-wrap">
              <input
                      type="email"
                      minlength="4"
                      name="emailLogin"
                      class="input-field"
                      autocomplete="off"
                      required
              />
              <label>Email</label>
            </div>

            <div class="input-wrap">
              <input
                      type="password"
                      minlength="4"
                      name="passwordLogin"
                      class="input-field"
                      autocomplete="off"
                      required
              />
              <label>Password</label>
            </div>

            <input type="submit" value="Sign In" class="sign-btn" />

            <p class="text">
              Forgotten your password or you login datails?
              <a href="#">Get help</a> signing in
            </p>
          </div>
        </form>

        <form action="openpark?page=registerUser" method="post" autocomplete="off" class="sign-up-form">
          <div class="logo">
            <img src="./assets/img/logo.png" alt="easyclass" />
            <h4>openpark</h4>
          </div>

          <div class="heading">
            <h2>Get Started</h2>
            <h6>Already have an account?</h6>
            <a href="#" class="toggle">Sign in</a>
          </div>

          <div class="actual-form">
            <div class="input-wrap">
              <input
                      type="text"
                      name="userName"
                      minlength="4"
                      class="input-field"
                      autocomplete="off"
                      required
              />
              <label>Name</label>
            </div>

            <div class="input-wrap">
              <input
                      type="email"
                      name="email"
                      class="input-field"
                      autocomplete="off"
                      required
              />
              <label>Email</label>
            </div>

            <div class="input-wrap">
              <input
                      type="password"
                      name="password"
                      minlength="4"
                      class="input-field"
                      autocomplete="off"
                      required
              />
              <label>Password</label>
            </div>

            <input type="submit" value="Sign Up" class="sign-btn" />

            <p class="text">
              By signing up, I agree to the
              <a href="#">Terms of Services</a> and
              <a href="#">Privacy Policy</a>
            </p>
          </div>
        </form>
      </div>

      <div class="carousel">
        <div class="images-wrapper">
          <img src="./assets/img/image1.png" class="image img-1 show" alt="" />
          <img src="./assets/img/image2.png" class="image img-2" alt="" />
          <img src="./assets/img/image3.png" class="image img-3" alt="" />
        </div>

        <div class="text-slider">
          <div class="text-wrap">
            <div class="text-group">
              <h2>No More tickets</h2>
              <h2> Book your space</h2>
              <h2> Have a fantastic time</h2>
            </div>
          </div>

          <div class="bullets">
            <span class="active" data-value="1"></span>
            <span data-value="2"></span>
            <span data-value="3"></span>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- Javascript file -->

<script src="assets/js/login.js"></script>
</body>
</html>
