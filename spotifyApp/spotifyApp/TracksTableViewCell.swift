//
//  TracksTableViewCell.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class TracksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var albumNameLabel: UILabel!

    @IBOutlet weak var popularityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
}
