//
//  RegisterPageController.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 10.10.23.
//

import UIKit

class RegisterPageController: UIViewController {
    
    
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    var registerButtonClick:  ((String, String)-> Void)?
    
    var users = [UserData]()
    let helper = FileManagerHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        title = "Register"
        
        helper.readData { userItems in
            self.users = userItems
        }

        
    }
    
    @IBAction func registerButtonClcikedd(_ sender: Any) {
        
        let user = UserData(userFullName: fullNameTextField.text ?? "", userEmail: emailTextField.text ?? "", userPhoneNumber: numberTextField.text ?? "", userPassword: passwordTextField.text ?? "")
        
        users.append(user)

   
        
        registerButtonClick?(emailTextField.text ?? "", passwordTextField.text ?? "")
        helper.writeData(users: users)
        navigationController?.popViewController(animated: true)
        
        
        
        


    }
    
}
