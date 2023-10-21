//
//  BasketTableCell.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 11.10.23.
//

import UIKit

class BasketTableCell: UITableViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var foodNAme: UILabel!
    @IBOutlet weak var imageViewmy: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
