document.addEventListener("DOMContentLoaded", function() {
    const slots = document.querySelectorAll('.slot');
  
    slots.forEach(slot => {
      slot.addEventListener('click', function() {
        const vehicleType = prompt('Do you want to book this slot for a car or a bike? Enter "car" or "bike".').toLowerCase();
  
        if (!slot.classList.contains('booked')) {
          if (vehicleType === 'car') {
            const bookedParts = slot.querySelectorAll('.booked').length;
            if (bookedParts === 0) {
              slot.querySelectorAll('.available').forEach(part => {
                part.style.backgroundColor = 'red';
                part.classList.add('booked');
              });
              slot.classList.add('booked');
              alert('Slot booked for car successfully!');
            } else {
              alert('This slot has been partially booked for bikes. Only bikes can be parked here.');
            }
          } else if (vehicleType === 'bike') {
            const availablePart = slot.querySelector('.available:not(.booked)');
            if (availablePart) {
              availablePart.style.backgroundColor = 'red';
              availablePart.classList.add('booked');
              const bookedParts = slot.querySelectorAll('.booked').length;
              if (bookedParts === 4) {
                slot.classList.add('booked');
              }
              alert('Slot booked for bike successfully!');
            } else {
              alert('There is not enough space for bikes in this slot!');
            }
          } else {
            alert('Invalid vehicle type. Please enter "car" or "bike".');
          }
        } else {
          alert('Slot already booked!');
        }
      });
    });
  });
  