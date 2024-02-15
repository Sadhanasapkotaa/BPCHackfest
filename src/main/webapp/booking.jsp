<%--
  Created by IntelliJ IDEA.
  User: sanzi
  Date: 1/3/2024
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Active Booking</title>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/9d508255d4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/carbike.css">
</head>
<body>
<div class="sidebar">
    <div class="logo-details">

        <div class="logo_name">Open Park</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">

        <li>
            <a href="openpark?page=ownerDash">
                <i class="fa-sharp fa-solid fa-house"></i>
                <span class="links_name">Home</span>
            </a>
            <span class="tooltip">Home</span>
        </li>

        <li>
            <a href="openpark?page=car">
                <i class="fa-solid fa-car"></i>
                <span class="links_name">Car</span>
            </a>
            <span class="tooltip">Car</span>
        </li>

        <li>
            <a href="openpark?page=bike">
                <i class="fa-solid fa-bicycle"></i>
                <span class="links_name">bike</span>
            </a>
            <span class="tooltip">bike</span>
        </li>

        <li>
            <a href="openpark?page=booking">
                <i class="fa-solid fa-book"></i>
                <span class="links_name">Active Booking</span>
            </a>
            <span class="tooltip">Active Booking </span>
        </li>


        <li class="profile">
            <div class="profile-details">
                <div class="profileimg"> <i class="fa-solid fa-user"  ></i> </div>

                <div class="name_job">
                    <div class="name"></div>

                </div>
            </div>
            <a href="openpark?page=adminLogout"> <i class='bx bx-log-out' id="log_out"  ></i> </a>
        </li>
    </ul>
</div>
<section class="booking-section">
    <main class="table">

        <section class="table__header">

            <h1>Active Bookings</h1>

            <div class="input-group">

                <input type="search" placeholder="Search Data...">

                <img src="assets/imgage/search.png" alt="">

            </div>

            <div class="export__file">

                <label for="export-file" class="export__file-btn" title="Export File"></label>

                <input type="checkbox" id="export-file">

                <div class="export__file-options">

                    <label>Export As &nbsp; &#10140;</label>

                    <label for="export-file" id="toPDF">PDF <img src="assets/imgage/pdf.png" alt=""></label>

                    <label for="export-file" id="toEXCEL">EXCEL <img src="assets/imgage/excel.png" alt=""></label>

                </div>

            </div>

        </section>

        <section class="table__body">

            <table>

                <thead>

                <tr>

                    <th> Date <span class="icon-arrow">&UpArrow;</span></th>

                    <th> Customer <span class="icon-arrow">&UpArrow;</span></th>

                    <th> Category <span class="icon-arrow">&UpArrow;</span></th>

                    <th> Check In <span class="icon-arrow">&UpArrow;</span></th>

                    <th> Check Out <span class="icon-arrow">&UpArrow;</span></th>

                    <th> Status <span class="icon-arrow">&UpArrow;</span></th>

                    <th> Amount <span class="icon-arrow">&UpArrow;</span></th>

                </tr>

                </thead>

                <tbody>

                <tr>

                    <td>2023 September   </td>

                    <td>Ram Tamang </td>
                    <td>Bike <i class="fa-solid fa-bicycle"></i></td>

                    <td> 8:00 PM</td>

                    <td> 9:00 PM </td>

                    <td>  <p class="status pending">Pending</p> </td>

                    <td> <strong>Rs.80 </strong></td>

                </tr>
                <tr>

                    <td>2023 September   </td>

                    <td>krishna koirala </td>

                    <td> Bike <i class="fa-solid fa-bicycle"></i></td>

                    <td> 10:00 PM</td>

                    <td> 11:00 PM </td>

                    <td>  <p class="status pending">Pending</p> </td>

                    <td> <strong>Rs.80 </strong></td>

                </tr>
                <tr>

                    <td>2023 September   </td>

                    <td>sita khadka </td>

                    <td> car <i class="fa-solid fa-car"></i></td>

                    <td> 10:00 PM</td>

                    <td> 11:00 PM </td>

                    <td>  <p class="status pending">Pending</p> </td>

                    <td> <strong>Rs.200</strong></td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td> </td>

                    <td>  </td>

                    <td>  </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td></td>

                    <td>  </td>

                    <td> </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td> </td>

                    <td>  </td>

                    <td>  </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td> </td>

                    <td>  </td>

                    <td>  </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td> </td>

                    <td>  </td>

                    <td>  </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td> </td>

                    <td>  </td>

                    <td> </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td></td>

                    <td>  </td>

                    <td> </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                <tr>

                    <td> </td>
                    <td></td>

                    <td> </td>

                    <td>  </td>

                    <td>  </td>

                    <td>



                    </td>

                    <td> <strong></strong> </td>

                </tr>

                </tbody>

            </table>

        </section>

    </main>


    <script src="assets/js/nav.js"></script>
</section>
</body>


</body>
</html>