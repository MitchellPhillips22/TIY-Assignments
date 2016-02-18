//
//  ProfileViewController.swift
//  CarLocator
//
//  Created by Mitchell Phillips on 2/16/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var makeText: UITextField!
    @IBOutlet weak var modelText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var licenseText: UITextField!
 
    var blueColorValue: Float = 0.5
    var greenColorValue: Float = 0.5
    var redColorValue: Float = 0.5
    
    @IBAction func saveButton(sender: UIButton) {
        saveDefaults()
       
        }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        loadDefaults()
        changeBackgroundColor()
        
    }
        func changeBackgroundColor() {
            
            Config.sharedInstance.loadConfiguation()
            
            let color = UIColor(red: CGFloat(Config.sharedInstance.redColorValue), green: CGFloat(Config.sharedInstance.greenColorValue), blue: CGFloat(Config.sharedInstance.blueColorValue) , alpha: 1.0)
            
            self.view.backgroundColor = color
            
           
            
        }
    func loadDefaults() {
            Config.sharedInstance.loadConfiguation()
        
            // both valueForKey and stringForKey can work here
            self.nameText.text = Config.sharedInstance.name
            self.makeText.text = Config.sharedInstance.make
            self.modelText.text = Config.sharedInstance.model
            self.yearText.text = Config.sharedInstance.year
            self.licenseText.text = Config.sharedInstance.licensePlate
            
            self.redColorValue = Config.sharedInstance.redColorValue
            self.greenColorValue = Config.sharedInstance.greenColorValue
            self.blueColorValue = Config.sharedInstance.blueColorValue
            
    }
    func saveDefaults() {
        
        
        Config.sharedInstance.name = self.nameText.text
        Config.sharedInstance.make = self.makeText.text
        Config.sharedInstance.model = self.modelText.text
        Config.sharedInstance.year = self.yearText.text
        Config.sharedInstance.licensePlate = self.licenseText.text
        print("saveSuccessful")
        
        Config.sharedInstance.saveConfiguration()
    }

}

