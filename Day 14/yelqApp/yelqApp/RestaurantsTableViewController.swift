//
//  RestaurantsTableViewController.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//


import UIKit


class RestaurantsTableViewController: UITableViewController {
    

    
    var restaurantArray = [Restaurant]()
    var currentRestaurant: Restaurant?
    var jsonString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let (jsonString, data) = loadJSONFile("restaurantsJSON", fileType: "json")
        print(jsonString)
        
        if let data = data {
            
            do {
                
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dict = object as? JSONDictionary {
                    
                    if let results = dict["restaurants"] as? JSONArray {
                        for result in results {
                            
                            let m = Restaurant(dict: result)
                            self.restaurantArray.append(m)
                            
                        }
                    }
                }
                for currentRestaurant in restaurantArray {
                  
                }
                
            } catch {
                print("There is no character")
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellForRowRestaurant = self.restaurantArray[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath) as! RestaurantTableViewCell
        print(cellForRowRestaurant.location)
        cell.restaurantLabel.text = cellForRowRestaurant.name
        cell.locationLabel.text = cellForRowRestaurant.location
        cell.imageOutlet.image = UIImage(named: "\(cellForRowRestaurant.image)")
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentRestaurant = restaurantArray[indexPath.row]
        
        self.performSegueWithIdentifier("showDetails", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails" {
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.currentRestaurant = self.currentRestaurant
        }
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func loadJSONFile(filename: String, fileType: String) -> (String, NSData?) {
        
        var returnString = ""
        var data: NSData? = nil
        
        guard let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileType) else { return (returnString, data) }
        
        if let jsondata = NSData(contentsOfURL: filePath) {
            if let jsonString = NSString(data: jsondata, encoding: NSUTF8StringEncoding) {
                returnString = jsonString as String
                data = jsondata
            }
        }
        return (returnString, data)
    }
    
}

