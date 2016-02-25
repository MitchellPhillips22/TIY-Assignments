//
//  DetailViewController.swift
//  MovieApp1
//
//  Created by Mitchell Phillips on 2/24/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailMovie = Movies()
    
    @IBOutlet weak var detailImageView: UIImageView!

    @IBOutlet weak var detailTitleView: UILabel!

    @IBOutlet weak var overviewLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailTitleView.text = detailMovie.title
        self.overviewLabel.text = detailMovie.overview
        loadImageFromURL("https://image.tmdb.org/t/p/w185\(detailMovie.poster_path)")
    }
    func loadImageFromURL(urlString: String) {
        
        if urlString.isEmpty == false {
            
            dispatch_async(dispatch_get_main_queue(), {
                if let url = NSURL(string: urlString) {
                    if let data = NSData(contentsOfURL: url) {
                        self.detailImageView.image = UIImage(data: data)
                    }
                }
            })
        } else {
            debugPrint("Invalid \(urlString)")
        }
    }
    

}
