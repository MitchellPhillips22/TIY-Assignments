//
//  MenuTableViewController.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var currentRestaurant: Restaurant?
    var currentMenu: Menu?
    var dishesArray = [Dishes]()
    var currentDish: Dishes?

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print(dishesArray, "dishesArray")
        currentMenu = currentRestaurant?.menuArray.first
        for dish in (currentMenu?.dishes)! {
            dishesArray.append(dish)
            print(dish.dishName)
        }
    }
        
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let currentDish = self.currentMenu?.dishes[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("dishCell", forIndexPath: indexPath) as! MenuTableViewCell
        
        cell.dishImage.image = UIImage(named: (currentDish?.dishImage)!)
        cell.dishNameLabel.text = currentDish?.dishName
        cell.ratingLabel.text = "\(currentDish!.rating)"
        cell.priceLabel.text = currentDish?.price
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       self.currentDish = currentMenu?.dishes[indexPath.row]
    }
       // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dishesArray.count)
        return dishesArray.count
    }
    



}
