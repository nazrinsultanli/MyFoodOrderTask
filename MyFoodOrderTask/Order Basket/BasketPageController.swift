//
//  BasketPageController.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 10.10.23.
//

import UIKit

class BasketPageController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var userData = [UserData]()
    var userManager = UserDataManager.shared
    var sum = 0.0
    
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var orderLabel: UILabel!
    
    @IBOutlet weak var foodPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ORDER"
        myTableView.delegate = self
        myTableView.dataSource = self

    }
    
}


extension BasketPageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userManager.foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "BasketTableCell", for: indexPath) as! BasketTableCell
        cell.foodNAme.text = userManager.foodItems[indexPath.row].foodName
        
        if let price = userManager.foodItems[indexPath.row].foodPrice {
            cell.priceLabel.text = String(price)
        } else {
            cell.priceLabel.text = "N/A" // Or any default value if foodPrice is nil
        }
        
        
        cell.imageViewmy.image = UIImage(named: userManager.foodItems[indexPath.row].foodImage ?? "")
        return cell
    }
    
    
}
