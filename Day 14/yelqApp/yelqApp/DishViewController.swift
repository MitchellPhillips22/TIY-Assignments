//
//  DishViewController.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/19/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class DishViewController: UIViewController {
 
    var dishDetail: Dishes?
    
    @IBOutlet weak var dishDetailImage: UIImageView!
    @IBOutlet weak var dishDetailName: UILabel!
    
    @IBOutlet weak var dishPrice: UILabel!
    @IBOutlet weak var dishRating: UILabel!
    @IBOutlet weak var dishDescripsh: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dishDetailImage.image = UIImage(named: "\(dishDetail?.dishImage)")
        self.dishDetailName.text = dishDetail?.dishName
        self.dishPrice.text = dishDetail?.price
        self.dishDescripsh.text = dishDetail?.dishDescripsh
        
        
    }
}
