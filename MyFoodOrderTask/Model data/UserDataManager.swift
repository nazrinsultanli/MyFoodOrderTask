//
//  UserDataManager.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 30.09.23.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    
    var foodItems = [FoodItem]()
  
    
    //    var userIDCopy = 0
    //    var userNumber = 0
    var userDataArray = [
        UserData(
            userFullName: "Nazrin Dolkhanova",
            userEmail: "coach.nazrin@gmail.com",
            userPhoneNumber: "0998000859",
            userPassword: "anamanam"),
        UserData(
            userFullName: "Nazka Sultashka",
            userEmail: "1",
            userPhoneNumber: "0998000859",
            userPassword: "1"
            
        )
    ]
    
}
