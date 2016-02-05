//
//  timeSetViewController.swift
//  WarpRiders
//
//  Created by Mitchell Phillips on 2/4/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class TimeSetViewController: UIViewController {

    var dateSet = ""
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func datePickerAction(sender: UIDatePicker) {
    
    let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        
        dateSet = dateFormatter.stringFromDate(datePicker.date)
        
        
    }
}
