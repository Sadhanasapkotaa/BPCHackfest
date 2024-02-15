    document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('getLocationBtn').addEventListener('click', function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
            alert('Geolocation is not supported by this browser.');
        }
    });
});

    function showPosition(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    // Display the location fields
    document.getElementById('latitude').style.display = 'block';
    document.getElementById('longitude').style.display = 'block';

    // Set the obtained coordinates in the location fields
    document.getElementById('latitude').innerText = `Latitude: ${latitude}`;
    document.getElementById('longitude').innerText = `Longitude: ${longitude}`;
}

    function showError(error) {
    let errorMessage = '';
    switch (error.code) {
    case error.PERMISSION_DENIED:
    errorMessage = 'User denied the request for Geolocation.';
    break;
    case error.POSITION_UNAVAILABLE:
    errorMessage = 'Location information is unavailable.';
    break;
    case error.TIMEOUT:
    errorMessage = 'The request to get user location timed out.';
    break;
    case error.UNKNOWN_ERROR:
    errorMessage = 'An unknown error occurred.';
    break;
}
    alert(errorMessage);
}

