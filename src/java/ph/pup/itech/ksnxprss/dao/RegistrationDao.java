/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ph.pup.itech.ksnxprss.dao;

import ph.pup.itech.ksnxprss.model.RegistrationModel;

public class RegistrationDao {
    
    public RegistrationModel getRegistrationDetails(RegistrationModel registration){
        RegistrationModel registrationDetails;
        
        String userName = registration.getUserName();
        String password = registration.getPassword();
        String firstName = registration.getFirstName();
        String middleName = registration.getMiddleName();
        String lastName = registration.getBirthday();
        String location = registration.getLocation();
        String birthday = registration.getBirthday();
        long number = registration.getNumber();
        
        registrationDetails = new RegistrationModel(userName, password,
                firstName, middleName, lastName, location, birthday, number);
        
        System.out.println("Registration Details " + registrationDetails);
        return registrationDetails;
    } 
    
}
