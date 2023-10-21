//
//  ProfilePageController.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 11.10.23.
//

import UIKit

class ProfilePageController: UIViewController {
    
    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var orderlist: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    var users = [UserData]()
    let helper = FileManagerHelper()
    let emailSaved = UserDefaults().string(forKey: "saveEmail")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper.readData { userItems in
            self.users = userItems
            
            if let index = users.firstIndex(where: { $0.userEmail == emailSaved }) {
                let user = users[index]
                self.email.text = user.userEmail
                self.password.text = user.userPassword
                self.number.text = user.userPhoneNumber
                self.name.text = user.userFullName
            }
        }
    }
    
    
    
    @IBAction func logOutButtonClicked(_ sender: Any) {
        
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.setLoginRootViewController(windowScene: windowScene)
        }
    }
}
