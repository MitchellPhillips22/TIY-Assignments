//
//  DetailViewController.swift
//  WeatherSucks
//
//  Created by Mitchell Phillips on 2/28/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var weatherIconImage: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var detailTempLabel: UILabel!
    
    var currentCity = City()
    
    var numberFormatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberFormatter.maximumFractionDigits = 0
        print(currentCity.icon)
        weatherIconImage.image = UIImage(named: "\(currentCity.icon)")
        cityLabel.text = currentCity.name
        summaryLabel.text = currentCity.currentWeather
        detailTempLabel.text = "\(numberFormatter.stringForObjectValue(currentCity.cityTemp)!)°F"
        
    }
}
