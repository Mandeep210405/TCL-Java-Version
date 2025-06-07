package com.tcl.model;

import java.util.Date;

/**
 * Model class for User
 */
public class User {
    private int userId;
    private int tmpId;
    private String fatherName;
    private String motherName;
    private String childName;
    private String email;
    private String contact;
    private String address;
    private int height;
    private int weight;
    private String bloodGroup;
    private String gender;
    private Date birthDate;
    private String birthCertificate;
    private String password;
    
    public User() {
    }
    
    // Getters and Setters
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public int getTmpId() {
        return tmpId;
    }
    
    public void setTmpId(int tmpId) {
        this.tmpId = tmpId;
    }
    
    public String getFatherName() {
        return fatherName;
    }
    
    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }
    
    public String getMotherName() {
        return motherName;
    }
    
    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }
    
    public String getChildName() {
        return childName;
    }
    
    public void setChildName(String childName) {
        this.childName = childName;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getContact() {
        return contact;
    }
    
    public void setContact(String contact) {
        this.contact = contact;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public int getHeight() {
        return height;
    }
    
    public void setHeight(int height) {
        this.height = height;
    }
    
    public int getWeight() {
        return weight;
    }
    
    public void setWeight(int weight) {
        this.weight = weight;
    }
    
    public String getBloodGroup() {
        return bloodGroup;
    }
    
    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public Date getBirthDate() {
        return birthDate;
    }
    
    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
    
    public String getBirthCertificate() {
        return birthCertificate;
    }
    
    public void setBirthCertificate(String birthCertificate) {
        this.birthCertificate = birthCertificate;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
}
