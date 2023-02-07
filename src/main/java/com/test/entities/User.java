
package com.test.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author bhalc
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 100 ,name = "user_id")
    private int userId;
    @Column(length = 100 ,name = "user_name")
    private String userName;
    @Column(length = 100 ,name = "user_email")
    private String userEmail;
    @Column(length = 100 ,name = "user_password")
    private String userPassword;
    @Column(length = 12 ,name = "user_phone")
    private String userPhone;
    @Column(length = 100 ,name = "user_address")
    private String userAddress;
    @Column(name="user_type")
    private String userType;

    /**
     *
     * @param userId
     * @param userName
     * @param userEmail
     * @param userPassword
     * @param userPhone
     * @param userAddress
     * @param userType
     */
    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userAddress, String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userType=userType;
    }

    /**
     *
     * @param userName
     * @param userEmail
     * @param userPassword
     * @param userPhone
     * @param userAddress
     * @param userType
     */
    public User(String userName, String userEmail, String userPassword, String userPhone, String userAddress,String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userType=userType;
    }

    /**
     *
     */
    public User() {
    }

    /**
     *
     * @return
     */
    public int getUserId() {
        return userId;
    }

    /**
     *
     * @param userId
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     *
     * @return
     */
    public String getUserName() {
        return userName;
    }

    /**
     *
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     *
     * @return
     */
    public String getUserEmail() {
        return userEmail;
    }

    /**
     *
     * @param userEmail
     */
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    /**
     *
     * @return
     */
    public String getUserPassword() {
        return userPassword;
    }

    /**
     *
     * @param userPassword
     */
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    /**
     *
     * @return
     */
    public String getUserPhone() {
        return userPhone;
    }

    /**
     *
     * @param userPhone
     */
    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    /**
     *
     * @return
     */
    public String getUserAddress() {
        return userAddress;
    }

    /**
     *
     * @param userAddress
     */
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    /**
     *
     * @return
     */
    public String getUserType() {
        return userType;
    }

    /**
     *
     * @param userType
     */
    public void setUserType(String userType) {
        this.userType = userType;
    }
    
    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userAddress=" + userAddress + '}';
    }
    
    
    
    
    
}
