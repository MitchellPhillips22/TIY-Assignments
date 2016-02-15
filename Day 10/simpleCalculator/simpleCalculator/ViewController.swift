//
//  ViewController.swift
//  simpleCalculator
//
//  Created by Mitchell Phillips on 2/14/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    var value1: Double = 0
    var runningTotal: Double = 0
    var hasTappedNumber = false
    var hasPerformedCalculation = false
    var isFirstTap = true
    var operatorString = ""
    
    
    @IBOutlet weak var calcScreen: UILabel!
    
    func updateUI() {
        calcScreen.text = "\(runningTotal)"
    }
    
    // MARK: - Functions
    
    func calculate() {
        if operatorString == "+" {
            runningTotal = runningTotal + value1
        }
        if operatorString == "-" {
            runningTotal = runningTotal - value1
        }
        if operatorString == "*" {
            runningTotal = runningTotal * value1
        }
        if operatorString == "/" {
            runningTotal = runningTotal / value1
        }
    }
    
    // MARK: - Button Actions

    @IBAction func minusTapped(sender: UIButton) {
        if hasPerformedCalculation == true {
            operatorString = "-"
            updateUI()
            value1 = 0
            hasPerformedCalculation = false
            
        }
        if isFirstTap == true {
            operatorString = "-"
            runningTotal = value1
            value1 = 0
            updateUI()
            isFirstTap = false
        } else {
            calculate()
            operatorString = "-"
            value1 = 0
            updateUI()
        }
        
    }

    @IBAction func plusTapped(sender: UIButton) {
        if hasPerformedCalculation == true {
            operatorString = "+"
            value1 = 0
            updateUI()
            hasPerformedCalculation = false
        }
        if isFirstTap == true {
            operatorString = "+"
            runningTotal = value1
            value1 = 0
            isFirstTap = false
            updateUI()
        } else {
            calculate()
            operatorString = "+"
            value1 = 0
            updateUI()
            
        }
        
    }

    @IBAction func numberTapped(sender: UIButton) {
        value1 = value1 * 10 + Double(sender.tag)
        hasTappedNumber = true
        updateUI()
        print(value1, runningTotal)
        
    }

    @IBAction func divideTapped(sender: UIButton) {
        if hasPerformedCalculation == true {
            operatorString = "/"
            value1 = 0
            updateUI()
            hasPerformedCalculation = false
            return
        }
        if isFirstTap == true {
            operatorString = "/"
            runningTotal = value1
            value1 = 0
            isFirstTap = false
            updateUI()
            return
        } else {
            calculate()
            operatorString = "/"
            value1 = 0
            updateUI()
            return
        }
    }
    
    @IBAction func multiplyTapped(sender: UIButton) {
        if hasPerformedCalculation == true {
            operatorString = "*"
            value1 = 0
            updateUI()
            hasPerformedCalculation = false
            return
        }
        if isFirstTap == true {
            operatorString = "*"
            runningTotal = value1
            value1 = 0
            isFirstTap = false
            updateUI()
            return
        } else {
            calculate()
            operatorString = "*"
            value1 = 0
            updateUI()
            return
        }
        
        
    }
    @IBAction func equalsTapped(sender: UIButton) {
        calculate()
        value1 = 0
        updateUI()
        hasPerformedCalculation = true
        print(value1 , runningTotal)
        
    }
    
    func convertStringToDouble(str: String?) -> Double {
        
        var doubleValue:Double = 0
        
        if str == nil || str == "" {
            return doubleValue
        } else {
            if let str = str {
                doubleValue = Double(str)!
            }
        }
        return doubleValue
    }

    @IBAction func clearButton(sender: UIButton) {
        value1 = 0
        runningTotal = 0
        isFirstTap = true
        hasPerformedCalculation = false
        hasTappedNumber = false
        updateUI()
    }
    
    
    
    
    
}

