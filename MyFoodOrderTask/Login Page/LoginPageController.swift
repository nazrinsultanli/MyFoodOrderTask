//
//  LoginPageController.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 10.10.23.
//

import UIKit

class LoginPageController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var users = [UserData]()
    let helper = FileManagerHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        emailTextfield.layer.cornerRadius = emailTextfield.frame.size.height/2
        emailTextfield.layer.masksToBounds = true
        emailTextfield.layer.borderWidth = 0.5
        
        passwordTextfield.layer.cornerRadius = passwordTextfield.frame.size.height/2
        passwordTextfield.layer.masksToBounds = true
        passwordTextfield.layer.borderWidth = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        helper.readData { userItems in
            self.users = userItems
        }
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let enteredEmail = emailTextfield.text
        let enteredPassword = passwordTextfield.text
        
        UserDefaults.standard.setValue(true, forKey: "LoggedIn")
        UserDefaults.standard.setValue(enteredEmail, forKey: "saveEmail") // logini yadda saxlamaq ucun
        
        if users.contains(where: { $0.userEmail == enteredEmail && $0.userPassword == enteredPassword }) {
            // errorLoginLabel.isHidden = true
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.setMainRootViewController(windowScene: windowScene)
            }
        } else {
            //errorLoginLabel.isHidden = false
            //errorLoginLabel.text = "Yanlish login"
        }
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        let cv = storyboard?.instantiateViewController(withIdentifier: "RegisterPageController") as! RegisterPageController
        
        cv.registerButtonClick = { email, password in
            self.emailTextfield?.text = email
            self.passwordTextfield?.text = password
            
        }
        
        navigationController?.show(cv, sender: nil)
    }
    
}


extension LoginPageController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // errorLoginLabel.isHidden = true
        if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
