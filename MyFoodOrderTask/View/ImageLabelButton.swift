//
//  ImageLabelButton.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 07.10.23.
//

import UIKit

class ImageLabelButton: UICollectionViewCell {
    //4
    var delegate: plusButtonClickProtocol?
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var MyLabelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabelAndImage (labelName: String?, imageName: String?) {
        if let labelName = labelName, let imageName = imageName{
            myImageView.image = UIImage(named: imageName)
            MyLabelView.text = labelName
        }

    }

    //1
    @IBAction func plusButtonClicked(_ sender: Any) {
        //5
        delegate?.plusButtonClicked(index: tag)
    }
}
