<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 1/2/2024
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Open Park</title>
  <!--========== BOX ICONS ==========-->
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

  <!--========== CSS ==========-->
  <link rel="stylesheet" href="assets/css/styles.css">
  <link rel="stylesheet" href="assets/css/userSearch.css">
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
          <span style="margin: 10px;">Already have an account?</span> <a href="userLoginSignup.html" class="nav-button">Login</a>
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
  <!--========== CHOOSE DEVICE ==========-->
  <section class="decoration section bd-container" id="decoration" >
    <h2 class="orange section-title">Choose a Location of Your Preference</h2>
    <form autocomplete="off"  action="">
      <div class="autocomplete shadow send__direction" >
        <input class="send__input" id="myInput" type="text" name="myLocation" placeholder="Location">
      </div>
      <a class="button" style="margin:10px">Search</a>
    </form>
  </section>

  <!--========== SEND FEEDBACK ==========-->
  <section class="send section">
    <div class="send__container bd-container bd-grid">
      <div class="send__content">
        <h2 class="section-title-center send__title">Send Feedback Now</h2>
        <p class="send__description">Start giving away feedbacks we can optimize the application and curate an interactive experience for you!</p>
        <form action="user?page=searchLocation">
          <div class="send__direction">
            <input type="text" placeholder="House address" name="location" class="send__input">
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

<!--========== FORM AUTOCOMPLETE JS ==========-->
<script>
  function autocomplete(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
            /*insert the value for the autocomplete text field:*/
            inp.value = this.getElementsByTagName("input")[0].value;
            /*close the list of autocompleted values,
            (or any other open lists of autocompleted values:*/
            closeAllLists();
          });
          a.appendChild(b);
        }
      }
    });
    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
    });
    function addActive(x) {
      /*a function to classify an item as "active":*/
      if (!x) return false;
      /*start by removing the "active" class on all items:*/
      removeActive(x);
      if (currentFocus >= x.length) currentFocus = 0;
      if (currentFocus < 0) currentFocus = (x.length - 1);
      /*add class "autocomplete-active":*/
      x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
      /*a function to remove the "active" class from all autocomplete items:*/
      for (var i = 0; i < x.length; i++) {
        x[i].classList.remove("autocomplete-active");
      }
    }
    function closeAllLists(elmnt) {
      /*close all autocomplete lists in the document,
      except the one passed as an argument:*/
      var x = document.getElementsByClassName("autocomplete-items");
      for (var i = 0; i < x.length; i++) {
        if (elmnt != x[i] && elmnt != inp) {
          x[i].parentNode.removeChild(x[i]);
        }
      }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
      closeAllLists(e.target);
    });
  }

  /*An array containing all the country names in the world:*/
  var countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua & Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central Arfrican Republic","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauro","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","North Korea","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre & Miquelon","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka","St Kitts & Nevis","St Lucia","St Vincent","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Turks & Caicos","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

  /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
  autocomplete(document.getElementById("myInput"), countries);
</script>
</body>
</html>