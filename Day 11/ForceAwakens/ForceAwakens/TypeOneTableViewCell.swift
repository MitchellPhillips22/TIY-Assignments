//
//  TypeOneTableViewCell.swift
//  ForceAwakens
//
//  Created by Mitchell Phillips on 2/15/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class TypeOneTableViewCell: UITableViewCell {
    
    var starWarsChar: StarWarsCharacter?

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var affiliationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
