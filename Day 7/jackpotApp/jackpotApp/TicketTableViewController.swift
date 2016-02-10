//
//  TicketTableViewController.swift
//  jackpotApp
//
//  Created by Mitchell Phillips on 2/9/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class TicketTableViewController: UITableViewController {

    @IBOutlet weak var ticketTableView: UITableView!
    
    var ticketsArray = [Ticket]()
    var currentTicket: Ticket?
    var winningTicket = Ticket()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winningTicket.generateTicket()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketsArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TicketCell", forIndexPath: indexPath) as! TicketTableViewCell
        
        let ticket = ticketsArray[indexPath.row]
        
        cell.label1.text = "\(ticket.label1)"
        cell.label2.text = "\(ticket.label2)"
        cell.label3.text = "\(ticket.label3)"
        cell.label4.text = "\(ticket.label4)"
        cell.label5.text = "\(ticket.label5)"
        cell.label6.text = "\(ticket.label6)"
        
        //cell.textLabel?.text = ticketsArray[indexPath.row]
        
        return cell
    }
    
    // MARK: - Action Methods
    
    @IBAction func addTicket(sender: AnyObject) {
    
        print("Add")
    
        let ticket = Ticket()
        
        ticket.generateTicket()
    
        ticketsArray.insert(ticket, atIndex: 0)
        
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentTicket = ticketsArray[indexPath.row]
        self.performSegueWithIdentifier("ballViewerSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ballViewerSegue" {
            let viewController = segue.destinationViewController as! ViewController
            viewController.currentTicket = currentTicket
            
            viewController.winningTicket = winningTicket
        }
    }
}
