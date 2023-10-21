//
//  FoodMenuPageController.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 11.10.23.
//

import UIKit
//2-3
protocol plusButtonClickProtocol {
    func plusButtonClicked(index: Int)
}

class FoodMenuPageController: UIViewController {
    
    var userData = [UserData]()
    var userManager = UserDataManager.shared
    
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var foodCategory = [FoodCategory]()
    let parser = Parser()
    
    var foodMenu = [FoodItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        userData = userManager.userDataArray
     
        navigationItem.title = "food menu"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "ImageLabelButton", bundle: nil), forCellWithReuseIdentifier: "ImageLabelButton")

        
        self.parser.parseJsonFile{ items in
            self.foodCategory = items
            self.collectionView.reloadData()
        }
    }
}

extension FoodMenuPageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodMenu.count
    }
    
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelButton", for: indexPath) as! ImageLabelButton
        cell.delegate = self
        cell.tag = indexPath.row
        cell.setLabelAndImage(labelName: foodMenu[indexPath.item].foodName ?? "",
                              imageName: foodMenu[indexPath.item].foodImage ?? "")
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2-10, height: collectionView.frame.width/2-10)
    }
     
}


//7
extension FoodMenuPageController: plusButtonClickProtocol {
    func plusButtonClicked(index: Int) {
        print("\(index) -----")
        let foodName = foodMenu[index].foodName ?? ""
        showAlert(title: "Add", message: "\(foodName) is added" )
        userManager.foodItems.append(foodMenu[index])
        
        
   
    }
}


extension FoodMenuPageController {
    //--8-- protokolun icerisinde hansi funksiyani cagirdimsa, o funksiyani yaradiram
    func showAlert(title: String, message:String){
        let alertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okButton)
        present(alertController, animated: true)
        
    }
}
