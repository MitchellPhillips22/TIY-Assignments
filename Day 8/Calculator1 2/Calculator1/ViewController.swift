//
//  ViewController.swift
//  Calculator1
//
//  Created by Mitchell Phillips on 2/10/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

enum OperatorType: String {
    case Add = "+"
    case Subtract = "-"
    case Multiply = "x"
    case Divide = "÷"
    case Percent = "%"
    case Equals = "="
}

    var firstNumber = 0
    var secondNumber = 0
    var isTypingNumber = false

    var brain = CalcBrain()

class ViewController: UIViewController {

    @IBAction func numberClicked(sender: BorderButton) {
        var number = sender.currentTitle
        
        if isTypingNumber {
            calculatorDisplay.text = calculatorDisplay.text + number
        } else {
            calculatorDisplay.text = number
            isTypingNumber = true
        }
    }
    
    @IBAction func operatorClicked(sender: BorderButton) {
        isTypingNumber = false
        firstNumber = calculatorDisplay.text.toInt()!
        operationString = sender.currentTitle
        
    }
    @IBAction func equalsClicked(sender: BorderButton) {
        
        
    }
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet weak var totalDisplay: UILabel!
    
    
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

