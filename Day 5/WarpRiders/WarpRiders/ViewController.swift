//
//  ViewController.swift
//  WarpRiders
//
//  Created by Mitchell Phillips on 2/4/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: NSTimer?
    
    var count: Int = 10
    
    let speed: NSTimeInterval = 0.3
    
    
    
    @IBOutlet weak var destinationLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    @IBOutlet weak var timeUntilWarpLabel: UILabel!
    
    @IBAction func unwindToMainView (segue: UIStoryboardSegue) {
        
        if segue.identifier == "unwindToMainView" {
            
            let viewControllerTwo = segue.sourceViewController as! TimeSetViewController
            
            let dateString = viewControllerTwo.dateSet
            
            self.destinationLabel.text = dateString
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dates()
    }
    
    func dates() {
        let presentDate = NSDate()
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        
        let todayString = dateFormatter.stringFromDate(presentDate)
        presentTimeLabel.text = todayString
        
    }


    @IBAction func warpButton(sender: UIButton) {
    
        timeUntilWarpLabel.text = "\(count)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(speed,
            target: self,
            selector: "updateUI",
            userInfo: nil,
            repeats: true)


        }
    func updateUI() {
        
        count = count - 1
        
        if count > 0 {
            
            timeUntilWarpLabel.text = "\(count)"
        
        } else {
            timeUntilWarpLabel.text = "WARP"
            
            timer?.invalidate()
            
            self.performSegueWithIdentifier("warpSegue", sender: self)
        
        }
    }
        @IBAction func warpTimeSegue(segue: UIStoryboardSegue) {
            
            if segue.identifier == "warpSegue" {
                
                lastTimeLabel.text = presentTimeLabel.text
                
                presentTimeLabel.text = destinationLabel.text
                
                count = 10
                
                timeUntilWarpLabel.text = "--"
                
            }
            
    }
}

