package com.example.openpark;

import MailSender.RegistrationSuccessful;
import MailSender.RequestRegistration;
import Model.Admin;
import Hashing.PasswordHashing;
import Model.DateTime;
import Model.User;
import Service.ParkingService;

import java.io.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@MultipartConfig
@WebServlet(name = "openpark", value = "/openpark")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String page = req.getParameter("page");

        if(page.equalsIgnoreCase("adminLogout")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("ownerDash")){

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("Owner.jsp");

            requestDispatcher.forward(req,resp);
        }

        if(page.equalsIgnoreCase("car")){

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("car.jsp");

            requestDispatcher.forward(req,resp);
        }

        if(page.equalsIgnoreCase("bike")){

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("bike.jsp");

            requestDispatcher.forward(req,resp);
        }
        if(page.equalsIgnoreCase("booking")){

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("booking.jsp");

            requestDispatcher.forward(req,resp);
        }



        if(page.equalsIgnoreCase("adminLogin")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("AdminLogin.jsp");
            requestDispatcher.forward(req, resp);
        }


        if(page.equalsIgnoreCase("appadminLogin")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("appAdminLogin.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("aprovadminLogin")) {

            String email = req.getParameter("emailLogin");
            String password = PasswordHashing.hashPassword(req.getParameter("passwordLogin"));

            Admin admin = new ParkingService().authenticateAdmin(email, password);
            if(admin!=null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("OwnerDash.jsp");
            requestDispatcher.forward(req, resp);}
            else{
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("appAdminLogin.jsp");
                requestDispatcher.forward(req, resp);
            }





        }


        if(page.equalsIgnoreCase("appAdmin")){
            String email = req.getParameter("email");

            Admin admin = new Admin();
            req.setAttribute("admin", admin);
            req.setAttribute("email", email);

            new ParkingService().approveAdmin(email, admin);
            RegistrationSuccessful rf = new RegistrationSuccessful();
            rf.sendAccountRegistrationMessage(email);

            System.out.println("Login successfull");




            List<Admin> adminList = new ParkingService().getAdminReq();
            req.setAttribute("admin", admin);
            req.setAttribute("adminList", adminList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("superAdminDash.jsp");
            requestDispatcher.forward(req, resp);


        }

        if (page.equalsIgnoreCase("admindetails")){
            HttpSession session = req.getSession();

            String email = req.getParameter("email");


            if(new ParkingService().isEmailAlreadyExists(email)){
                req.setAttribute("errorMessage", "Email already exist. Try new one");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("AdminLogin.jsp");
                requestDispatcher.forward(req, resp);
            }else{
                Admin admin = new Admin();
                admin.setEmail(req.getParameter("email"));
                admin.setPassword(PasswordHashing.hashPassword(req.getParameter("password")));
                new ParkingService().adminSignUp(admin);

                System.out.println("Admin Data successfully registered");


                session.setAttribute("email", email);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("AdminLogin2.jsp");
                requestDispatcher.forward(req,resp);

            }


        }
        if(page.equalsIgnoreCase("admindetails2")){
            HttpSession session = req.getSession();
            String email = req.getParameter("email");



            if(email != null){
                String bikeCost = req.getParameter("bike_cost");
                String carCost = req.getParameter("car_cost");
                String bikeCostValue = bikeCost.replaceAll("[^0-9]", "");
                String carCostValue = carCost.replaceAll("[^0-9]", "");

                int bikeCostInt = Integer.parseInt(bikeCostValue);
                int carCostInt = Integer.parseInt(carCostValue);

                Admin admin = new Admin();
                admin.setEmail(req.getParameter("email"));
                admin.setIdType(req.getParameter("idSelect"));
                admin.setCarSlot(Integer.parseInt(req.getParameter("car_slots")));
//                admin.setCarSlot(Integer.parseInt(req.getParameter("bike_slots")));
                admin.setHourlyBikeParkingCost(bikeCostInt);
                admin.setHourlyCarParkingCost(carCostInt);
                admin.setStratTime(LocalTime.parse(req.getParameter("start_time")));

                admin.setEndTime(LocalTime.parse(req.getParameter("end_time")));

                new ParkingService().adminSignUp2(admin);
                System.out.println("Admin Data 2 successfully registered");

                session.setAttribute("email", email);
                System.out.println(email);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("AdminLogin3.jsp");
                requestDispatcher.forward(req, resp);



            }else{
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("AdminLogin.jsp");
                requestDispatcher.forward(req, resp);
            }

        }

        if(page.equalsIgnoreCase("admindetails3")){
            HttpSession session1 = req.getSession();
            String email = (String) session1.getAttribute("email");




            if(email != null) {
                System.out.println(email);
                Admin admin = new Admin();
                admin.setEmail(req.getParameter("email"));
                admin.setFullName(req.getParameter("fullname"));

                Part part = req.getPart("photo");
                String fileName = part.getSubmittedFileName();
                System.out.println("the fill name is "+ fileName);
                admin.setPhoto(part.getSubmittedFileName());
                String uploadPath = "C:/Users/sanzi/IdeaProjects/OPENPARK/src/main/webapp/assets/userCredientals/" + fileName;
                try {
                    FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                    InputStream inputStream = part.getInputStream();

                    byte[] data = new byte[inputStream.available()];
                    inputStream.read(data);
                    fileOutputStream.write(data);
                    fileOutputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }

                admin.setAddress(req.getParameter("address"));
                admin.setPhoneNumber(req.getParameter("phone"));
                admin.setIdType(req.getParameter("idSelect"));

                Part part1 = req.getPart("identification");
                String fileName1 = part1.getSubmittedFileName();
                System.out.println("the fill name is "+ fileName1);
                admin.setDocument(part1.getSubmittedFileName());
                String uploadPath1 = "C:/Users/sanzi/IdeaProjects/OPENPARK/src/main/webapp/assets/userCredientals/" + fileName1;

                try {
                    FileOutputStream fileOutputStream = new FileOutputStream(uploadPath1);
                    InputStream inputStream = part1.getInputStream();

                    byte[] data = new byte[inputStream.available()];
                    inputStream.read(data);
                    fileOutputStream.write(data);
                    fileOutputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
                admin.setIdNumber(req.getParameter("idnumber"));

                new ParkingService().adminSignUp3(admin);
                System.out.println("admindetails3 successfully registered");
                RequestRegistration rr = new RequestRegistration();
                rr.sendRequestMessage(email);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(req, resp);


//
            }else {
                System.out.println("email not found");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("AdminLogin.jsp");
                requestDispatcher.forward(req, resp);

            }



        }
        if (page.equalsIgnoreCase("userLogout")) {
            HttpSession session = req.getSession(false);

            if (session != null) {
                // Invalidate the session (log out the user)
                session.invalidate();
            }

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);
        }

        if (page.equalsIgnoreCase("userLoginSignup")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userLoginSignup.jsp");
            requestDispatcher.forward(req, resp);
        }

        if (page.equalsIgnoreCase("userChooseDevice")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userChooseDevice.jsp");
            requestDispatcher.forward(req, resp);
        }

        if (page.equalsIgnoreCase("userSearchLocation")) {
            HttpSession session = req.getSession(false);

            if (session != null && session.getAttribute("id") != null) {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("userdateandtime.jsp");
                requestDispatcher.forward(req, resp);
            } else {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("userLoginSignup.jsp");
                requestDispatcher.forward(req, resp);
            }
        }

        if (page.equalsIgnoreCase("searchLocation")) {

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("searchMap.jsp");
            requestDispatcher.forward(req, resp);
        }

        //for registering new user
        if (page.equalsIgnoreCase("registerUser")) {
            User user = new User();

            user.setName(req.getParameter("userName"));
            user.setEmail(req.getParameter("email"));
            user.setPassword(PasswordHashing.hashPassword(req.getParameter("password")));

//            request.getSession().setAttribute("rental", rental);
            req.getSession().setAttribute("user", user);

            new ParkingService().authorizeUser(user);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);
        }

        //date time from user for booking
        if (page.equalsIgnoreCase("datetime")) {
            DateTime dt = new DateTime();

            dt.setEntryDate(LocalDate.parse(req.getParameter("entryDate")));
            dt.setExitDate(LocalDate.parse(req.getParameter("exitDate")));
            dt.setEntryTime(LocalTime.parse(req.getParameter("entryTime")));
            dt.setExitTime(LocalTime.parse(req.getParameter("exitTime")));

            req.getSession().setAttribute("dt", dt);

            new ParkingService().userBooking(dt);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("searchMap.jsp");
            requestDispatcher.forward(req, resp);
        }

        //for login of user using result set from database
        if (page.equalsIgnoreCase("loginUser")) {
            String email = req.getParameter("emailLogin");
            String password = PasswordHashing.hashPassword(req.getParameter("passwordLogin"));
            String superAdminPassword = PasswordHashing.hashPassword("superadmin@123");

            //Admin login
            if (email.equalsIgnoreCase("admin@gmail.com") && password.equalsIgnoreCase(superAdminPassword)) {
                Admin admin = new Admin();
                List<Admin> adminList = new ParkingService().getAdminReq();
                req.setAttribute("admin", admin);
                req.setAttribute("adminList", adminList);

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("superAdminDash.jsp");
                requestDispatcher.forward(req, resp);

            } else {

                //User Login
                User user = new ParkingService().loginUser(email, password);


                if (user != null) {
                    int id = user.getUserId();

                    //if authentication is successful create session
                    HttpSession session = req.getSession(true);
                    session.setAttribute("id", id);

                    // Create a cookie for the username
                    Cookie cookie = new Cookie("email", email);
                    cookie.setMaxAge(30 * 24 * 60 * 60); // Set the cookie to expire in 30 days
                    resp.addCookie(cookie);

                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
                    requestDispatcher.forward(req, resp);
                } else {
                    req.setAttribute("errorMessage", "Invalid username or password");

                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("userLoginSignup.jsp");
                    requestDispatcher.forward(req, resp);
                }
            }
        }


        if(page.equalsIgnoreCase("qrGenerate")){
            ParkingService service = new ParkingService();
            service.getQR();

            String filePath = "C://Users//Acer//IdeaProjects//OPENPARK//src//main//webapp//test.json";
            BufferedReader reader = new BufferedReader(new FileReader(filePath));
            StringBuilder data = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                data.append(line);
            }
            reader.close();

            // Set content type and send data as response
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(data.toString());

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("qr.jsp");
            requestDispatcher.forward(req, resp);
        }



    }

    public void destroy() {


    }
}