package Model;

import java.sql.Time;
import java.time.LocalTime;

public class Admin {

   private int id ;

   private String email;

   private String password;

   private String regType;

   private int carSlot;

   private int bikeSlot;

   private int hourlyBikeParkingCost;

   private int hourlyCarParkingCost;

   private LocalTime stratTime ;


   private LocalTime endTime;

   public String getPhoto() {
      return photo;
   }

   public void setPhoto(String photo) {
      this.photo = photo;
   }

   private String fullName;

   private String photo;

   private String address;

   private String phoneNumber;

   private String idType;

   private String document;

   private String idNumber;

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getRegType() {
      return regType;
   }

   public void setRegType(String regType) {
      this.regType = regType;
   }

   public int getCarSlot() {
      return carSlot;
   }

   public void setCarSlot(int carSlot) {
      this.carSlot = carSlot;
   }

   public int getBikeSlot() {
      return bikeSlot;
   }

   public void setBikeSlot(int bikeSlot) {
      this.bikeSlot = bikeSlot;
   }

   public int getHourlyBikeParkingCost() {
      return hourlyBikeParkingCost;
   }

   public void setHourlyBikeParkingCost(int hourlyBikeParkingCost) {
      this.hourlyBikeParkingCost = hourlyBikeParkingCost;
   }

   public int getHourlyCarParkingCost() {
      return hourlyCarParkingCost;
   }

   public void setHourlyCarParkingCost(int hourlyCarParkingCost) {
      this.hourlyCarParkingCost = hourlyCarParkingCost;
   }

   public LocalTime getStratTime() {
      return Time.valueOf(stratTime).toLocalTime();
   }

   public LocalTime getEndTime() {
      return Time.valueOf(endTime).toLocalTime();
   }



   public void setStratTime(LocalTime stratTime) {
      this.stratTime = stratTime;
   }



   public void setEndTime(LocalTime endTime) {
      this.endTime = endTime;
   }

   public String getFullName() {
      return fullName;
   }

   public void setFullName(String fullName) {
      this.fullName = fullName;
   }



   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getPhoneNumber() {
      return phoneNumber;
   }

   public void setPhoneNumber(String phoneNumber) {
      this.phoneNumber = phoneNumber;
   }

   public String getIdType() {
      return idType;
   }

   public void setIdType(String idType) {
      this.idType = idType;
   }

   public String getDocument() {
      return document;
   }

   public void setDocument(String document) {
      this.document = document;
   }

   public String getIdNumber() {
      return idNumber;
   }

   public void setIdNumber(String idNumber) {
      this.idNumber = idNumber;
   }
}
