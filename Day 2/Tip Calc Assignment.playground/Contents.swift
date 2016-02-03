/* ###Tip Calculator

Create a new playgound file called "TipCalculator".
    
1. Create a function to calculate the tip amount. It should accept two values - totalAmount and percentage and return the total amount of the tip as well as the final total for the customer. Hint: *use tuples*

2. Create a Class called TipCalculator with one property called dollarAmount.

    - It should have an *initializer* that accepts the dollarAmount

    - It should have a function that calculates a tip it should accept a tipPercentage that is of type Double and returns the tipAmount of type Double.

    - It should have a method called printPossibleTips() that calculates and prints the tip amount for three values 15%, 18% and 20%.

HARD MODE:

Write an App that uses a textField for the dollarAmount and tipPercentage and a button that calculates the final dollar amount to be paid.
*/

import UIKit

class TipCalculator {
    
    var dollarAmount: Double
    
    init(dollarAmount: Double) {
        self.dollarAmount = dollarAmount
    }
    func calculate(percent: Double) -> Double {
        
        return self.dollarAmount * percent
    }
    
    func printPossibleTips() {
        let tip15 = calculate(0.15)
        let tip18 = calculate(0.18)
        let tip20 = calculate(0.20)
        
        print("For 15% of \(self.dollarAmount), \(tip15), for 18%, \(tip18), for 20%, \(tip20).")
    }
}

let myTip = TipCalculator(dollarAmount: 54.00)

myTip.printPossibleTips()








