//
//  CalcBrain.swift
//  Calculator1
//
//  Created by Mitchell Phillips on 2/12/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//


var numbersArray = [Double]()
var operatorArray = [OperatorType]()
var runningTotal: Double = 0


class CalcBrain {
    
    func multCalc(value1: Double, value2: Double) -> Double {
        return value1 * value2
    }
    func addCalc(value1: Double, value2: Double) -> Double {
        return value1 + value2
    }
    func subCalc(value1: Double, value2: Double) -> Double {
        return value1 - value2
    }
    func divideCalc(value1: Double, value2: Double) -> Double {
        return value1 / value2
    }
    func percentCalc(value1: Double) -> Double {
        return value1 / 100
    }
}
    

