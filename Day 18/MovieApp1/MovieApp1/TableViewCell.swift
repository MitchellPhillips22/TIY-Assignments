//
//  TableViewCell.swift
//  MovieApp1
//
//  Created by Mitchell Phillips on 2/24/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        func loadImageFromURL(urlString: String) {
            
            if urlString.isEmpty == false {
                
                dispatch_async(dispatch_get_main_queue(), {
                    if let url = NSURL(string: urlString) {
                        if let data = NSData(contentsOfURL: url) {
                            self.posterImageView.image = UIImage(data: data)
                        }
                    }
                })
            } else {
                debugPrint("Invalid \(urlString)")
            }
        }
        

    
}
