//
//  ProfileViewController.swift
//  CarLocator
//
//  Created by Mitchell Phillips on 2/16/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

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
            
            let color = UIColor(red: CGFloat(self.redColorValue), green: CGFloat(self.greenColorValue), blue: CGFloat(self.blueColorValue) , alpha: 1.0)
            
            self.view.backgroundColor = color
            
           
            
        }
    func loadDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let today = defaults.objectForKey("LastUsedTime") as? NSDate
        
        if today != nil {
            self.nameText.text = defaults.valueForKey("NameValue") as? String
            self.makeText.text = defaults.stringForKey("MakeValue")
            self.modelText.text = defaults.stringForKey("ModelValue")
            self.yearText.text = defaults.stringForKey("YearValue")
            self.licenseText.text = defaults.stringForKey("LicenseValue")
            
            self.redColorValue = defaults.floatForKey("RedKey")
            self.greenColorValue = defaults.floatForKey("GreenKey")
            self.blueColorValue = defaults.floatForKey("BlueKey")
            
                 }
    }
    func saveDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(NSDate(), forKey: "LastUsedTime")
        
        defaults.setObject(self.nameText.text, forKey: "NameValue")
        defaults.setObject(self.makeText.text, forKey: "MakeValue")
        defaults.setObject(self.modelText.text, forKey: "ModelValue")
        defaults.setObject(self.yearText.text, forKey: "YearValue")
        defaults.setObject(self.licenseText.text, forKey: "LicenseValue")
        print("saveSuccessful")
        
        defaults.synchronize()
    }

}

