//
//  MainPageController.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 07.10.23.
//

import UIKit

class MainPageController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var foodCategory = [FoodCategory]()
    let parser = Parser()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let basketImage    = UIImage(systemName: "basket.fill")
        
        
        let profileImage  = UIImage(systemName: "person.crop.circle.fill")

        let basketButton   = UIBarButtonItem(image: basketImage,  style: .plain, target: self, action: #selector(basketButtonTapped))
        basketButton.tintColor = .orange
        
        let profileButton = UIBarButtonItem(image: profileImage,  style: .plain, target: self, action: #selector(profileButtonTapped))
        profileButton.tintColor = .black

        navigationItem.rightBarButtonItems = [basketButton, profileButton]
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "ImageLabelButton", bundle: nil), forCellWithReuseIdentifier: "ImageLabelButton")

        
        
        self.parser.parseJsonFile{ items in
            self.foodCategory = items
            self.collectionView.reloadData()
            
            
        }
    }
    
    @objc func basketButtonTapped() {
        let cv = storyboard?.instantiateViewController(withIdentifier: "BasketPageController") as! BasketPageController
        navigationController?.show(cv, sender: nil)
    }
    
    @objc func profileButtonTapped() {
        let cv = storyboard?.instantiateViewController(withIdentifier: "ProfilePageController") as! ProfilePageController
        navigationController?.show(cv, sender: nil)
    }
    
}




extension MainPageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodCategory.count
    }
    
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelButton", for: indexPath) as! ImageLabelButton
        cell.setLabelAndImage(labelName: foodCategory[indexPath.item].category ?? "", imageName: foodCategory[indexPath.item].categoryImage ?? "")
        cell.buttonPlus.isHidden = true
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2-10, height: collectionView.frame.width/2-10)
    }
     
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cv = storyboard?.instantiateViewController(withIdentifier: "FoodMenuPageController") as! FoodMenuPageController
        cv.foodMenu = foodCategory[indexPath.item].categoryType ?? []
        navigationController?.show(cv, sender: nil)
        
    }

}

