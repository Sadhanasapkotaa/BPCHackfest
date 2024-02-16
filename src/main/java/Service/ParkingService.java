package Service;

import DBConnection.DBConnection;
import Model.Admin;
import Model.DateTime;
import Model.User;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ParkingService {

    public boolean isEmailAlreadyExists(String email){
        String query="select count(*) from admindetails where email=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int count = resultSet.getInt(1);
                return count>0;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public  void approveAdmin(String email, Admin admin){
        String query ="update admindetails set access='yes'" + "where email=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            preparedStatement.setString(1,email);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Admin authenticateAdmin(String email, String password) {
        String query = "select * from admindetails where (email = ? and password = ?) and access='yes'";

        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        Admin admin = null;
        try{
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                admin = new Admin();
                admin.setEmail(resultSet.getString("email"));
                admin.setPassword(resultSet.getString("password"));
            }


        } catch (SQLException e) {
            e.printStackTrace();

        }
        return admin;
    }




    public void adminSignUp(Admin admin){

        String query = "insert into admindetails(email , password)" + " values(?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            preparedStatement.setString(1,admin.getEmail());
            preparedStatement.setString(2, admin.getPassword());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    public void adminSignUp2(Admin admin){
        String query = "insert into admindetails1(email , regtype, carslots, bikeslots, bikecost, carcost, starttime, endtime)" + " values(?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            preparedStatement.setString(1,admin.getEmail());
            preparedStatement.setString(2, admin.getIdType());
            preparedStatement.setInt(3, admin.getCarSlot());
            preparedStatement.setInt(4, (admin.getCarSlot()*2));
            preparedStatement.setInt(5, admin.getHourlyCarParkingCost());
            preparedStatement.setInt(6, admin.getHourlyBikeParkingCost());
            preparedStatement.setTime(7, Time.valueOf(admin.getStratTime()));
            preparedStatement.setTime(8, Time.valueOf(admin.getEndTime()));

            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    public void adminSignUp3(Admin admin){
        String query = "insert into admindetails2(email , fullname, photo, address, phone, idtype, document, idnumber )" + " values(?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            preparedStatement.setString(1,admin.getEmail());
            preparedStatement.setString(2, admin.getFullName());
            preparedStatement.setString(3,(admin.getPhoto()));
            preparedStatement.setString(4, admin.getAddress());
            preparedStatement.setString(5, admin.getPhoneNumber());
            preparedStatement.setString(6, admin.getIdType());
            preparedStatement.setString(7, admin.getDocument());
            preparedStatement.setString(8, admin.getIdNumber());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }



    public List<Admin> getAdminReq(){
        ArrayList<Admin> adminList = new ArrayList<>();
        String query = "select * from admindetails2 where access='no'";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Admin admin = new Admin();
                admin.setFullName(resultSet.getString("fullname"));
                admin.setEmail(resultSet.getString("email"));
                admin.setPhoneNumber(resultSet.getString("phone"));
                admin.setIdNumber(resultSet.getString("idnumber"));
                admin.setDocument(resultSet.getString("document"));
                adminList.add(admin);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return adminList;
    }
    public void authorizeUser(User user) {
        String query = "INSERT INTO user1(name, email, password)" + "values(?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //helps to login the user by checking database
    public User loginUser(String email, String password){
        String query= "select * from user1 where email=? and password=?";
        PreparedStatement preparedStatement= new DBConnection().getStatement(query);
        User user= null;

        try{
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                user = new User();

//                user.setUserId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    //get user booking details
    public void userBooking(DateTime dt) {
        String query = "INSERT INTO datetime1(entryDate, exitDate, entryTime, exitTime)" + "values(?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setDate(1, Date.valueOf(dt.getEntryDate()));
            preparedStatement.setDate(2, Date.valueOf(dt.getExitDate()));
            preparedStatement.setTime(3, Time.valueOf(dt.getEntryTime()));
            preparedStatement.setTime(4, Time.valueOf(dt.getExitTime()));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    //if user has bookings
    public boolean userHasParked(String sessionId, int userId){
        String query = "SELECT COUNT(*) FROM parking WHERE sessionId = ? and userId=?";
        boolean hasParked= false;
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, sessionId);
            preparedStatement.setInt(2, userId);

            ResultSet resultSet = preparedStatement.executeQuery();

            // If the result set has a row, the user has already voted
            if (resultSet.next() && resultSet.getInt(1) > 0) {
                hasParked = true;
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return hasParked;
    }

    //select booking details

    public void getQR(){
        String query = "select * from bookingdetails";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();

            JSONArray jsonArray = new JSONArray();

            while (resultSet.next()) {
                int bookingid = resultSet.getInt("bookingid");
                String name = resultSet.getString("name");
                Time startTime = resultSet.getTime("starttime");
                Time endTime = resultSet.getTime("endTime");
                String vehicleType = resultSet.getString("vehicleType");

                ////////////////////////////////////////
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("bookingid", bookingid);
                jsonObject.put("name", name);
                jsonObject.put("startTime", startTime);
                jsonObject.put("endTime", endTime);
                jsonObject.put("vehicleType", vehicleType);

                // Add the JSON object to the JSON array
                jsonArray.add(jsonObject);


            }

            FileWriter writer = new FileWriter("C://Users//Acer//IdeaProjects//OPENPARK//src//main//webapp//test.json");
            System.out.println(jsonArray.toString());
            writer.write(jsonArray.toString());
            System.out.println("JSON data has been written to file.");
            writer.close();


        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        ParkingService service = new ParkingService();
        service.loginUser("user", "user");
    }


}
