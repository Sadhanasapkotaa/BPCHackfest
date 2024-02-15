<%--
  Created by IntelliJ IDEA.
  User: sanzi
  Date: 2/16/2024
  Time: 2:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Map Parking Location</title>
    <link
            rel="stylesheet"
            href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
            integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
            crossorigin=""
    />
    <script
            src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
            integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
            crossorigin=""
    ></script>
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

            <div id="nearbyPlacesList" class="hidden"></div>
        </div>
    </div>
</div>

<!-- Hidden success message div -->
<!-- Hidden success message div -->
<div id="successMessage" class="hidden">
    <p style="color: green;">Slot available! <button id="getQrButton">Get QR Code</button></p>
</div>
<script>
    var map = L.map("map");
    var userMarker = L.marker([0, 0]).addTo(map); // Initialize with a default location
    var marker, circle;
    var routingControl;
    var zoomed = false;

    map.setView([51.505, -0.09], 13);

    L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
        maxZoom: 19,
        attribution:
            '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    }).addTo(map);

    navigator.geolocation.watchPosition(success, error);

    function success(pos) {
        const lat = pos.coords.latitude;
        const lng = pos.coords.longitude;
        const accuracy = pos.coords.accuracy;

        // Clear existing marker
        if (marker) {
            map.removeLayer(marker);
        }

        marker = L.marker([lat, lng]).addTo(map);

        if (!zoomed) {
            map.setView([lat, lng], 13);
            zoomed = true;
        }

        // Update user's marker position
        userMarker.setLatLng([lat, lng]);

        // Create a routing control and add it to the map
        if (!routingControl) {
            routingControl = L.Routing.control({
                waypoints: [
                    L.latLng(userMarker.getLatLng()), // User's location
                    L.latLng(lat, lng), // Searched location
                ],
                routeWhileDragging: true,
                lineOptions: {
                    styles: [{ color: "#0000FF", opacity: 0.7, weight: 5 }],
                },
            }).addTo(map);
        } else {
            routingControl.setWaypoints([
                L.latLng(userMarker.getLatLng()), // User's location
                L.latLng(lat, lng), // Searched location
            ]);
        }

        if (!zoomed) {
            zoomed = map.fitBounds(userMarker.getBounds());
        }
    }

    function error(err) {
        if (err === 1) {
            alert("Please allow geolocation access");
        } else {
            alert("Cannot get the current location");
        }
    }

    // Function to display nearby places in the panel
    // Function to display detailed nearby places in the panel
    function displayNearbyPlaces(places) {
        const nearbyPlacesList = document.getElementById("nearbyPlacesList");
        nearbyPlacesList.innerHTML = ""; // Clear previous list items

        places.forEach((place, index) => {
            const placeItem = document.createElement("div");
            placeItem.className = "nearby-place";

            // Display detailed information
            const detailsContainer = document.createElement("div");
            detailsContainer.innerHTML = `<strong>${place.name}</strong><br>
                                  Time Frame: ${place.timeFrame}<br>
                                  Slots Available: ${place.slotsAvailable}`;

            // Create a container for buttons
            const buttonContainer = document.createElement("div");
            buttonContainer.classList.add("button-container");
            // "Book Now" button
            const bookNowButton = document.createElement("button");
            bookNowButton.textContent = "Book Now";
            bookNowButton.classList.add("button", "book-now");
            bookNowButton.addEventListener("click", function () {
                // Display the success message
                const successMessage = document.getElementById("successMessage");
                successMessage.classList.remove("hidden");

                // Scroll to the success message
                successMessage.scrollIntoView({ behavior: "smooth" });

                // Update routing control to navigate to the selected parking place
                routingControl.setWaypoints([
                    L.latLng(userMarker.getLatLng()), // User's location
                    L.latLng(place.latlng[0], place.latlng[1]) // Parking place's location
                ]);
            });

            // "Directions" button
            const directionsButton = document.createElement("button");
            directionsButton.textContent = "Directions";
            directionsButton.classList.add("button", "directions");
            directionsButton.addEventListener("click", function () {
                // Update routing control to navigate to the selected parking place
                routingControl.setWaypoints([
                    L.latLng(userMarker.getLatLng()), // User's location
                    L.latLng(place.latlng[0], place.latlng[1]) // Parking place's location
                ]);
            });

            // Append details and buttons to the place item
            placeItem.appendChild(detailsContainer);
            placeItem.appendChild(bookNowButton);
            placeItem.appendChild(directionsButton);

            nearbyPlacesList.appendChild(placeItem);
        });

        // Show the nearby places list
        nearbyPlacesList.classList.add("visible");
    }


    // Modify your search button click event handler to include the nearby places and routing
    // Modify your search button click event handler to include the nearby places and routing
    document.getElementById("searchButton").addEventListener("click", function () {
        const query = document.getElementById("searchInput").value;

        // Define the bounding box coordinates for Kathmandu Valley
        const birgunjValleyBounds = "85.162,27.010,85.374,27.158";
        // Use the Nominatim geocoding service to search for the location within Kathmandu Valley
        fetch(
            `https://nominatim.openstreetmap.org/search?format=json&q=${query}&viewbox=${birgunjValleyBounds}`
        )
            .then((response) => response.json())
            .then((data) => {
                if (data && data.length > 0) {
                    const result = data[0];
                    const lat = parseFloat(result.lat);
                    const lon = parseFloat(result.lon);

                    // Clear existing marker
                    if (marker) {
                        map.removeLayer(marker);
                    }

                    // Add a new marker for the search result with the custom yellow icon
                    var yellowMarkerIcon = L.icon({
                        iconUrl:
                            "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-yellow.png",
                        iconSize: [25, 41],
                        iconAnchor: [12, 41],
                        popupAnchor: [1, -34],
                        tooltipAnchor: [16, -28],
                        shadowSize: [41, 41],
                    });

                    marker = L.marker([lat, lon], { icon: yellowMarkerIcon }).addTo(
                        map
                    );

                    map.setView([lat, lon], 13);

                    // Create a routing control and add it to the map
                    if (routingControl) {
                        map.removeControl(routingControl);
                    }

                    routingControl = L.Routing.control({
                        waypoints: [
                            L.latLng(userMarker.getLatLng()), // User's location
                            L.latLng(lat, lon), // Searched location
                        ],
                        routeWhileDragging: true,
                        lineOptions: {
                            styles: [{ color: "#0000FF", opacity: 0.7, weight: 5 }],
                        },
                    }).addTo(map);

                    // Simulate nearby places data (you can replace this with your actual data)
                    const nearbyPlaces = [
                        {
                            name: "Parking 1",
                            timeFrame: "6 AM to 6 PM",
                            slotsAvailable: 5,
                            latlng: [27.024112433771297, 84.88423801813673] // Latitude and Longitude for Salesberry Parking
                        },
                        {
                            name: "Parking 2",
                            timeFrame: "7 AM to 8 PM",
                            slotsAvailable: 3,
                            latlng: [27.018177123966105, 84.88039709482999] // Latitude and Longitude for Downtown Parking
                        },
                        {
                            name: "Parking 3",
                            timeFrame: "9 AM to 5 PM",
                            slotsAvailable: 8,
                            latlng: [27.014869652279184, 84.87932948967065] // Latitude and Longitude for Green Park Plaza Parking
                        },
                    ];

// Function to display nearby places on the map as markers
                    function displayNearbyPlacesOnMap(places) {
                        places.forEach((place) => {
                            const marker = L.marker(place.latlng).addTo(map);
                            marker.bindPopup(`<b>${place.name}</b><br>Time Frame: ${place.timeFrame}<br>Slots Available: ${place.slotsAvailable}`);
                        });
                    }

// Call the function to display nearby places as markers on the map
                    displayNearbyPlacesOnMap(nearbyPlaces);
                    // Display the nearby places in the panel
                    displayNearbyPlaces(nearbyPlaces);
                } else {
                    alert("Location not found within Birgunj Valley.");              }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });

    // Modify your clear button click event handler to clear the nearby places and routing
    document
        .getElementById("clearButton")
        .addEventListener("click", function () {
            document.getElementById("searchInput").value = ""; // Clear the input
            closeInfoPanel(); // Close the panel

            // Clear the nearby places list
            const nearbyPlacesList = document.getElementById("nearbyPlacesList");
            nearbyPlacesList.innerHTML = "";
            nearbyPlacesList.classList.remove("visible"); // Hide the list
        });

    // Remove the routing control from the map
    if (routingControl) {
        map.removeControl(routingControl);
    }
    document.getElementById("getQrButton").addEventListener("click", function () {
        // Hide the success message
        const successMessage = document.getElementById("successMessage");
        successMessage.classList.add("hidden");
        window.location.href = "qr.html";
    });
</script>
</body>
</html>

