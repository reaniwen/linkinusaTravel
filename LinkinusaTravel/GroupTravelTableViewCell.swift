//
//  CustomTableViewCell.swift
//  LinkinusaTravel
//
//  Created by Rean on 1/1/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit
import Parse

class GroupTravelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadItem(title title: String, price: String, imageFile: PFFile) {
        self.backgroundImage.image = UIImage(named: "1.png")
        self.priceLabel.text = price
        self.titleLabel.text = title
        
        imageFile.getDataInBackgroundWithBlock { (imageData, error) -> Void in
            if error == nil {
                self.backgroundImage.image = UIImage(data: imageData!)
            }
        }
        
    }
}
