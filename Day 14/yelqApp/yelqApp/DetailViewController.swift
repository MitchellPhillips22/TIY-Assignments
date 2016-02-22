//
//  DetailViewController.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descripshLabel: UILabel!
    
    @IBAction func mapSegueButton(sender: BorderButton) {
    }

    @IBAction func menuSegueButton(sender: BorderButton) {
        
        
    }
    
    
        var restaurantArray = [Restaurant]()
        var currentRestaurant: Restaurant?
        var jsonString = ""
        
        
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

           
            self.image2.image = UIImage(named: "\(currentRestaurant!.image)")
            print(currentRestaurant?.image)
                
            self.restaurantLabel.text = currentRestaurant?.name
                
            self.descripshLabel.text = currentRestaurant?.description
                
            self.locationLabel.text = currentRestaurant?.location
            
            
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
                        print(currentRestaurant.name)
                    }
                    
                } catch {
                    print("There is no character")
                }
            }
        
    
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "menuSegue" {
            let menuViewController = segue.destinationViewController as! MenuTableViewController
            menuViewController.currentRestaurant = self.currentRestaurant
        }
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
