//
//  MovieDeetsViewController.swift
//  movieJson
//
//  Created by Mitchell Phillips on 2/11/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class MovieDeetsViewController: UIViewController {

    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = movie?.title
    }

    @IBOutlet weak var titleLabel: UILabel!

}
