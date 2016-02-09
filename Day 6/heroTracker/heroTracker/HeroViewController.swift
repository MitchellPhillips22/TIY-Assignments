//
//  HeroViewController.swift
//  heroTracker
//
//  Created by Mitchell Phillips on 2/8/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {

    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = hero?.name
        self.homeworldOutlet.text = hero?.homeworld
        self.powersOutlet.text = hero?.powers
        self.imageOutlet.image = UIImage(named: "\(hero!.image)")
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldOutlet: UILabel!
    @IBOutlet weak var powersOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
}
