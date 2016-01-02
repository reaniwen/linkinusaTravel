//
//  CustomTableViewCell.swift
//  LinkinusaTravel
//
//  Created by Rean on 1/1/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadItem(title title: String, image: UIImage) {
        self.backgroundImage.image = image
        self.titleLabel.text = title
    }

}
