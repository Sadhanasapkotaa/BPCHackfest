const searchInput = document.getElementById('searchInput');
const resultList = document.getElementById('nearbyPlacesList');
const mapContainer = document.getElementById('map');
const currentMarkers = [];
let routingControl = null;


//Initialize the map
const map = L.map(mapContainer).setView([20.13847, 1.40625], 2);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

// Get user's location and center the map on it
if ('geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition(position => {
        const { latitude, longitude } = position.coords;
        map.setView([latitude, longitude], 10);
        // Add a marker for user's current location
        const userMarker = L.marker([latitude, longitude]).addTo(map);
        // userMarker.bindPopup("Your Location").openPopup();
    }, error => {
        console.error('Error getting user location:', error);
    });
} else {
    console.log('Geolocation is not supported by your browser');
}

document.getElementById('searchButton').addEventListener('click', () => {
    const query = searchInput.value;
    try {
        // Manually provided data
        const responseData = [
            { displayName: 'Bhaktapur', latitude: 27.617, longitude: 85.4296 },
            { displayName: 'Lalitpur', latitude: 27.6669, longitude: 85.3126 },
            { displayName: 'Lalitpur', latitude: 27.6663, longitude: 85.333 }

        ];

        // Set the result list using all the data
        setResultList(responseData);
    } catch (error) {
        console.error('Error fetching locations:', error);
    }
});


// document.getElementById('search-button').addEventListener('click', async () => {
//     const query = searchInput.value;
//     console.log('Search query:', query); // Check if query is being captured correctly
//     try {
//         // Fetch the JSON data from the test.json file
//         const testDataResponse = await fetch('test.json');
//
//         if (!testDataResponse.ok) {
//             throw new Error('Failed to fetch test data');
//         }
//         const testData = await testDataResponse.json();
//
//         const filteredData = testData.filter(item => item.name.includes(query));
//
//         // Set the filtered data as the result list
//         setResultList(filteredData);
//     } catch (error) {
//         console.error('Error fetching or processing test data:', error);
//     }
// });




// Function to display search results
function setResultList(parsedResult) {
    resultList.innerHTML = "";
    for (const marker of currentMarkers) {
        map.removeLayer(marker);
    }
    const bounds = new L.LatLngBounds(); // Create bounds object

    for (const result of parsedResult) {
        const li = document.createElement('li');
        li.classList.add('list-group-item', 'list-group-item-action');
        li.innerHTML = result.name;
        li.addEventListener('click', (event) => {
            for(const child of resultList.children) {
                child.classList.remove('active');
            }
            event.target.classList.add('active');
            const clickedData = parsedResult[event.target.dataset.index];
            const position = new L.LatLng(clickedData.latitude, clickedData.longitude);
            map.flyTo(position, 12);
            createRouteToLocation(clickedData);
        })
        resultList.appendChild(li);

        const position = new L.LatLng(result.latitude, result.longitude);
        currentMarkers.push(new L.marker(position).addTo(map));
        bounds.extend(position); // Extend bounds to include marker position
    }

    // Fit map to the bounds containing all markers
    map.fitBounds(bounds, { padding: [50, 50] }); // Optional padding
}


// Function to create a route from user's location to selected location
function createRouteToLocation(destination) {
    navigator.geolocation.getCurrentPosition(position => {
        const { latitude, longitude } = position.coords;
        const userLocation = [latitude, longitude];

        // Remove existing route overlay if it exists
        if (routingControl !== null) {
            map.removeControl(routingControl);
        }

        // Create routing control and add it to the map
        routingControl = L.Routing.control({
            waypoints: [
                L.latLng(userLocation), // User's location
                L.latLng(destination.latitude, destination.longitude) // Selected location
            ],
            routeWhileDragging: true, // Allow route to be updated while dragging waypoints
            show: false // Hide direction panel
        }).addTo(map);
    }, error => {
        console.error('Error getting user location:', error);
    });
}

