

import UIKit


var value1: Double = 15.62
var value2: Double = 43.87

var total = value1 + value2

value1 = 12.8

total = total + value1
total = total - value1
total = total * value1
total = total / value1

enum OperatorType: String {
    case Add = "+"
    case Subtract = "-"
    case Multiply = "x"
    case Divide = "/"
    
}

class CalculatorBrain {
    
    var runningTotal: Double = 0
    
    func multCalc(value1: Double, value2: Double) -> Double {
        return value1 * value2
    }
    
}

var brain = CalculatorBrain()


