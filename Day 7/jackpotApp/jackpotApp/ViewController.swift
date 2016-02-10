//
//  ViewController.swift
//  jackpotApp
//
//  Created by Mitchell Phillips on 2/9/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball1: UILabel!
    @IBOutlet weak var ball2: UILabel!
    @IBOutlet weak var ball3: UILabel!
    @IBOutlet weak var ball4: UILabel!
    @IBOutlet weak var ball5: UILabel!
    @IBOutlet weak var ball6: UILabel!
    
 
    var currentTicket: Ticket?
    var winningTicket: Ticket?
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var didWin: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ball1.text = "\(currentTicket!.label1)"
        ball2.text = "\(currentTicket!.label2)"
        ball3.text = "\(currentTicket!.label3)"
        ball4.text = "\(currentTicket!.label4)"
        ball5.text = "\(currentTicket!.label5)"
        ball6.text = "\(currentTicket!.label6)"
        
    }

    @IBAction func winAction(sender: UIButton) {
        if currentTicket?.checkTicketAgainstWinner(winningTicket!) == true {
            didWin.text = "Holy crap, you won!!!"
        }
            didWin.text = "Try again!"
    }

}

