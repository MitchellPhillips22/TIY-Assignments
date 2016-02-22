//
//  MenuTableViewCell.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/19/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    
    @IBOutlet weak var dishNameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
