<%--
  Created by IntelliJ IDEA.
  User: sanzi
  Date: 1/2/2024
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>DashBoard</title>
    <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
    />

    <!--========== CSS ==========-->
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/superadmin.css" />

    <title>OpenPark - No tickets</title>
    <style>
        @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);

        /* Bootstrap Icons */
        @import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");

        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap");

        * {
            font-family: "Poppins" !important;
        }

        /* Mobile Styles */
        @media only screen and (max-width: 767px) {
            .footer__container {
                display: none;
            }

            .footer__content {
                display: none;
            }

            .footer__social {
                display: none;
            }
        }

        /* Responsive Styles */
        @media only screen and (max-width: 991px) {
            .container {
                padding-left: 15px;
                padding-right: 15px;
            }

            .col-xl-3 {
                flex: 0 0 100%;
                max-width: 100%;
            }

            .footer__container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<!-- Dashboard -->
<div class="d-flex flex-column flex-lg-row h-lg-full">
    <!-- Main content -->
    <div class="h-screen flex-grow-1">
        <!-- Header -->

        <!-- Main -->
        <main class="py-6">
            <div class="container">
                <h3 style="margin: 20px 0px; color: #da5525">OPENPARK</h3>
                <!-- Card stats -->
                <div class="row g-6 mb-6">
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >Total Amount</span
                        >
                                        <span class="h3 font-bold mb-0">750.90</span>
                                    </div>
                                    <div class="col-auto">
                                        <div
                                                class="icon icon-shape text-white text-lg rounded-circle"
                                                style="background-color: #da5525"
                                        >
                                            <i class="bi bi-credit-card"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >New applicants</span
                        >
                                        <span class="h3 font-bold mb-0">215</span>
                                    </div>
                                    <div class="col-auto">
                                        <div
                                                class="icon icon-shape text-white text-lg rounded-circle"
                                                style="background-color: #da5525"
                                        >
                                            <i class="bi bi-people"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >Parked Hours</span
                        >
                                        <span class="h3 font-bold mb-0">1.400</span>
                                    </div>
                                    <div class="col-auto">
                                        <div
                                                class="icon icon-shape text-white text-lg rounded-circle"
                                                style="background-color: #da5525"
                                        >
                                            <i class="bi bi-clock-history"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >Profit Margin</span
                        >
                                        <span class="h3 font-bold mb-0">95%</span>
                                    </div>
                                    <div class="col-auto">
                                        <div
                                                class="icon icon-shape text-white text-lg rounded-circle"
                                                style="background-color: #da5525"
                                        >
                                            <i class="bi bi-minecart-loaded"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow border-0 mb-7">
                    <div class="card-header">
                        <h5 class="mb-0">Applicants</h5>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="thead-light">
                            <tr>
                                <th scope="col">Company</th>
                                <th scope="col">email</th>
                                <th scope="col">phone</th>
                                <th scope="col">Id No.</th>
                                <th scope="col">Document</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                        <c:forEach items="${adminList}" var="admin">

                            <tr>
                                <td>
                                    <a class="text-heading font-semibold" href="#">
                                        ${admin.fullName}
                                    </a>
                                </td>
                                <td>
                                        ${admin.email}
                                </td>
                                <td>
                                    <a class="text-heading font-semibold" href="#">
                                ${admin.phoneNumber}
                                    </a>
                                </td>
                                <td>
                                    ${admin.idNumber}
                                </td>
                                <td>
                                    <span class="badge badge-lg badge-dot">
                                        <a href="./assets/userCredientals/${admin.document}"> View document</a>
                        </span>
                                    <div id="verificationModal1" class="modal">
                                        <div class="modal-content">
                                            <span class="close">&times;</span>
                                            <!-- Image element for the verification document -->

                                            <img src="assets/userCredientals/${admin.document}"
                                                    id="${admin.document}"
                                                    alt="${admin.document}"
                                                    style="
                                width: 500px;
                                height: auto;
                                object-fit: cover;
                                position: absolute;
                                margin-top: 60px;
                                align-self: center;
                              "
                                            />
                                        </div>
                                    </div>
                                </td>
                                <td class="text-end">
                                    <a href="openpark?page=appAdmin&email=${admin.email}"  id="btn" onclick="changeText()" class="btn btn-sm btn-neutral">Approve</a>

                                    <a href="openpark?page=emailDelete&email2=${admin.email}">
                                        <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                        <i class="bi bi-trash"></i>
                                        </button>
                                    </a>

                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <br>
                <br>

                <div class="card shadow border-0 mb-7">
                    <div class="card-header">
                        <h5 class="mb-0">Approved Applicants</h5>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="thead-light">
                            <tr>
                                <th scope="col">Company</th>
                                <th scope="col">email</th>
                                <th scope="col">phone</th>
                                <th scope="col">Id No.</th>
                                <th scope="col">Document</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${adminList1}" var="admin1">
                                <tr>
                                    <td>
                                        <a class="text-heading font-semibold" href="#">
                                                ${admin1.fullName}
                                        </a>
                                    </td>
                                    <td>
                                            ${admin1.email}
                                    </td>
                                    <td>
                                        <a class="text-heading font-semibold" href="#">
                                                ${admin1.phoneNumber}
                                        </a>
                                    </td>
                                    <td>
                                            ${admin1.idNumber}
                                    </td>
                                    <td>
                                            <span class="badge badge-lg badge-dot">
                                                <a href="./assets/userCredientals/${admin1.document}"> View document</a>
                                </span>
                                        <div id="verificationModal" class="modal">
                                            <div class="modal-content">
                                                <span class="close">&times;</span>
                                                <!-- Image element for the verification document -->

                                                <img src="assets/userCredientals/${admin1.document}"
                                                     id="${admin1.document}"
                                                     alt="${admin1.document}"
                                                     style="
                                        width: 500px;
                                        height: auto;
                                        object-fit: cover;
                                        position: absolute;
                                        margin-top: 60px;
                                        align-self: center;
                                      "
                                                />
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-end">
                                        <a href="openpark?page=viewSlot"  id="btn1"  class="btn btn-sm btn-neutral">View Slot</a>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<!--========== FOOTER ==========-->
<footer class="footer section" style="margin-top: 140px">
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

<script>

    // f
    // unction changeText(){
    //     const button = document.getElementById("btn");
    //
    //     button.innerText= "Approved";
    // }
    // Get all elements with the class "modal-trigger-image"
    var modalTriggerImages = document.querySelectorAll(
        ".modal-trigger-image"
    );
    // Get the modal and the image element
    var verificationModal = document.getElementById("verificationModal");
    var verificationImage = document.getElementById("verificationImage");

    // Attach a click event listener to each modal-trigger-image
    modalTriggerImages.forEach(function (img) {
        img.onclick = function () {
            // Set the source of the image and display the modal
            verificationImage.src = this.getAttribute("data-src");
            verificationModal.style.display = "block";
        };
    });

    // Get the close button within the modal
    var closeModalBtn = verificationModal.querySelector(".close");

    // Close the modal when the close button is clicked
    closeModalBtn.onclick = function () {
        verificationModal.style.display = "none";
    };

    // Close the modal when clicking outside the image
    window.onclick = function (event) {
        if (event.target === verificationModal) {
            verificationModal.style.display = "none";
        }
    };
</script>

<!--========== SCROLL REVEAL ==========-->
<script src="https://unpkg.com/scrollreveal"></script>

<!--========== MAIN JS ==========-->
<script src="assets/js/main.js"></script>

</body>
</html>
