
function makeESewaPayment() {
    const esewaID = '9806800001';
    const password = 'Nepal@123';
    const mpin = '1122';
    const merchantID = 'EPAYTEST';
    const token = '123456';
    const secretKey = '8gBm/:&EnhH.1/q';
  
    const paymentData = {
      esewa_id: esewaID,
      password: password,
      mpin: mpin,
      merchant_code: merchantID,
      token: token,
      amount: 100, // Amount in paisa (1 NPR = 100 paisa)
      invoice_number: 'INV123',
      service_code: 'TEST',
      success_url: 'YOUR_SUCCESS_URL',
      failure_url: 'YOUR_FAILURE_URL',
    };
  
    $.ajax({
      url: 'https://uat.esewa.com.np/epay/main',
      type: 'POST',
      data: paymentData,
      success: function (response) {
        console.log(response);
        // Redirect the user to eSewa for payment
        window.location.href = response;
      },
      error: function (error) {
        console.error('Error making eSewa payment:', error);
        alert('Error making eSewa payment. Please try again later.');
      },
    });
  }
  


  