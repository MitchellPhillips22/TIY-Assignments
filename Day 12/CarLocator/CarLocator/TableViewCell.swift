//
//  TableViewCell.swift
//  CarLocator
//
//  Created by Mitchell Phillips on 2/16/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var blueColorValue: Float = 0
    var greenColorValue: Float = 0
    var redColorValue: Float = 0
    
    @IBAction func valueChanged(sender: UISlider) {
        
        if sender == blueSlider {
            self.blueColorValue = sender.value
        } else if sender == greenSlider {
            self.greenColorValue = sender.value
        } else if sender == redSlider {
            self.redColorValue = sender.value
        }
        saveDefaults()
        changeBackgroundColor()

    }
    func changeBackgroundColor() {
        
        let color = UIColor(red: CGFloat(self.redColorValue), green: CGFloat(self.greenColorValue), blue: CGFloat(self.blueColorValue) , alpha: 1.0)
        
        self.backgroundColor = color
    }

    override func awakeFromNib() {
        super.awakeFromNib()
       loadDefaults()
        changeBackgroundColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func saveDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(NSDate(), forKey: "LastUsedTime")
        
        defaults.setFloat(self.redColorValue, forKey: "RedKey")
        defaults.setFloat(self.greenColorValue, forKey: "GreenKey")
        defaults.setFloat(self.blueColorValue, forKey: "BlueKey")
        
        defaults.synchronize()
    }
    
    func loadDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let today = defaults.objectForKey("LastUsedTime") as? NSDate
        
        if today != nil {
            self.redColorValue = defaults.floatForKey("RedKey")
            self.greenColorValue = defaults.floatForKey("GreenKey")
            self.blueColorValue = defaults.floatForKey("BlueKey")
            
            self.redSlider.value = self.redColorValue
            self.greenSlider.value = self.greenColorValue
            self.blueSlider.value = self.blueColorValue
        }
    }
}
