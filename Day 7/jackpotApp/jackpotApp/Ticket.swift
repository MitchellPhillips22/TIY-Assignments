

import Foundation

class Ticket {
    
    var label1: Int = 0
    var label2: Int = 0
    var label3: Int = 0
    var label4: Int = 0
    var label5: Int = 0
    var label6: Int = 0
    
    init() {
        
    }
    
    func generateTicket() {
        
        self.label1 = Int(arc4random_uniform(53)) + 1
        self.label2 = Int(arc4random_uniform(53)) + 1
        self.label3 = Int(arc4random_uniform(53)) + 1
        self.label4 = Int(arc4random_uniform(53)) + 1
        self.label5 = Int(arc4random_uniform(53)) + 1
        self.label6 = Int(arc4random_uniform(53)) + 1
    }
    
    func checkTicketAgainstWinner(winningTicket: Ticket) -> Bool {
     if self.label1 == winningTicket.label1 &&
        self.label2 == winningTicket.label2 &&
        self.label3 == winningTicket.label3 &&
        self.label4 == winningTicket.label4 &&
        self.label5 == winningTicket.label5 &&
        self.label6 == winningTicket.label6 {
            
            return true
        }
            return false
    }
}
