/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ph.pup.itech.ksnxprss.model;

/**
 *
 * @author Christian
 */
public class AdminModel {

    private String userID;
    private String password;
    private String firstN;
    private String middleN;
    private String lastN;
    private String completeAddress;
    private String birthday;
    private String mobileNumber;
    private String userRole;
    private String accountStatus;
    private String loginStatus;

    public AdminModel(String userID, String password, String firstN, String middleN, String lastN, String completeAddress, String birthday, String mobileNumber, String userRole) {
        this.userID = userID;
        this.password = password;
        this.firstN = firstN;
        this.middleN = middleN;
        this.lastN = lastN;
        this.completeAddress = completeAddress;
        this.birthday = birthday;
        this.mobileNumber = mobileNumber;
        this.userRole = userRole;

    }

    public AdminModel() {

    }

    public AdminModel(String userID, String firstN, String middleN, String lastN, String userRole) {
        this.userID = userID;
        this.firstN = firstN;
        this.middleN = middleN;
        this.lastN = lastN;
        this.userRole = userRole;
    }

    public AdminModel(String userID, String password, String firstN, String middleN, String lastN, String completeAddress, String birthday, String mobileNumber, String accountStatus, String loginStatus, String userRole) {
        this.userID = userID;
        this.password = password;
        this.firstN = firstN;
        this.middleN = middleN;
        this.lastN = lastN;
        this.completeAddress = completeAddress;
        this.birthday = birthday;
        this.mobileNumber = mobileNumber;
        this.accountStatus = accountStatus;
        this.loginStatus = loginStatus;
        this.userRole = userRole;
    }

    public AdminModel(String userID, String password) {
        this.userID = userID;
        this.password = password;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstN() {
        return firstN;
    }

    public void setFirstN(String firstN) {
        this.firstN = firstN;
    }

    public String getMiddleN() {
        return middleN;
    }

    public void setMiddleN(String middleN) {
        this.middleN = middleN;
    }

    public String getLastN() {
        return lastN;
    }

    public void setLastN(String lastN) {
        this.lastN = lastN;
    }

    public String getCompleteAddress() {
        return completeAddress;
    }

    public void setCompleteAddress(String completeAddress) {
        this.completeAddress = completeAddress;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getLoginStatus() {
        return loginStatus;
    }

    public void setLoginStatus(String loginStatus) {
        this.loginStatus = loginStatus;
    }

}
