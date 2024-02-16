<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 2/15/2024
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mapping</title>    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"          integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="          crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
            integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
            crossorigin=""></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
          integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
          crossorigin=""/>
    <script src="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.js"></script>
    <style>
        /* Updated map size and border styling */
        #map {
            height: 600px;
            /* Adjust the height as desired */
            border: 2px solid #ccc;
            border-radius: 5px;
            margin-right: 320px;
            /* Width of the panel in desktop view */
        }

        /* Styling for the sliding panel */
        .panel {
            position: fixed;
            top: 0;
            right: 0;
            /* Fixed to the right in desktop view */
            width: 300px;
            /* Width of the panel in desktop view */
            height: 100%;
            background-color: #fff;
            overflow-y: auto;
            box-shadow: -1px 0px 10px rgba(0, 0, 0, 0.5);
        }

        .leaflet-routing-alt {
            display: none;
        }

        .panel-header {
            text-align: center;
            padding: 10px;
            background-color: #f57c51;
            color: white;
            font-weight: bold;
        }

        .panel-content {
            padding: 20px;
        }

        /* Center and style the search box inside the panel */
        .search-container {
            margin-top: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #searchInput {
            padding: 10px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 5px;
            width: 80%;
            margin-bottom: 10px;
            /* Add some margin below the input */
        }

        #searchButton {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #f57c51;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 50%;
            /* Set the button width to match the input */
        }

        #searchButton:hover {
            background-color: #eb8e6d;
        }

        h1 {
            font-size: 24px;
            color: #f57c51;
            margin-top: 20px;
        }

        /* Style for the buttons */
        .button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .button.book-now {
            background-color: #f57c51; /* Match your theme color */
            color: white;
        }

        .button.directions {
            background-color: #f57c51; /* Match your theme color */
            color: white;
        }

        .button:hover {
            background-color: #eb8e6d; /* Lighten the background color on hover */
        }

        /* Style for button container */
        .button-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }


        /* Styling for the nearby places list */
        #nearbyPlacesList {
            margin-top: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            padding: 10px;
        }

        /* Style each nearby place item */
        .nearby-place {
            margin: 5px 0;
            padding: 5px;
            border-bottom: 1px solid #ddd;
        }

        .hidden {
            display: none;
        }

        /* Show nearby places list when needed */
        #nearbyPlacesList.visible {
            display: block;
        }
        /* Style for the directions container */

        /* Centered success message with styled button */
        #successMessage {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #f57c51;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000; /* Set a higher z-index to ensure it appears above the map */
        }

        #successMessage p {
            color: green; /* Slots Available text color */
        }

        #getQrButton {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #f57c51; /* Match your theme color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        #getQrButton:hover {
            background-color: #eb8e6d;
        }
    </style>
</head>
<body>
<h1>Map of available parking</h1>

<!-- Overall container -->

<div class="container">
    <!-- Map container -->

    <div id="map"></div>


    <!-- Sliding panel with search bar and nearby places list inside -->

    <div class="panel" id="infoPanel">
        <div class="panel-header">Place Details</div>

        <div class="panel-content" id="infoContent">
            <!-- Place details will be populated here -->

            <div class="search-container">
                <input type="text" id="searchInput" placeholder="Enter location" />

                <button id="searchButton">Search</button>

                <button id="clearButton">Clear</button>
            </div>

            <!-- Nearby places list -->

<%--            <div id="nearbyPlacesList" class="hidden"></div>--%>
            <ul id="nearbyPlacesList" class="col-4 list-group">
            </ul>        </div>
    </div>
</div>

<!-- Hidden success message div -->
<!-- Hidden success message div -->
<div id="successMessage" class="hidden">
    <p style="color: green;">Slot available! <button id="getQrButton">Get QR Code</button></p>
</div>


<script src="map.js">


</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
        integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
        crossorigin=""></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-routing-machine/3.2.12/leaflet-routing-machine.min.js"></script>

</body>
</html>
