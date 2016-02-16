//
//  ViewController.swift
//  ForceAwakens
//
//  Created by Mitchell Phillips on 2/15/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var characterTable: UITableView!
    
    var characterArray = [StarWarsCharacter]()
    var currentCharacter: StarWarsCharacter?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let (jsonString, starWars) = loadJSONFile("starWars", fileType: "json")
        print(jsonString)
        
        if let starWars = starWars {
            do {
                let object = try NSJSONSerialization.JSONObjectWithData(starWars, options: .AllowFragments)
                if let dict = object as? JSONDictionary {
                    if let characters = dict["characters"] as? JSONArray {
                        for result in characters {
                            let c = StarWarsCharacter(dict: result)
                            self.characterArray.append(c)
                        }
                    }
                }

            } catch {
                print("There is no character")
            }
        }

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let randomNumber = Int(arc4random_uniform(4))
        
        
        if randomNumber == 1 {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("TypeOneCell", forIndexPath: indexPath) as! TypeOneTableViewCell
             let c = self.characterArray[indexPath.row]
            cell.nameLabel?.text = c.name
            cell.affiliationLabel?.text = c.affiliation
            return cell
        
        }
        else if randomNumber == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TypeTwoCell", forIndexPath: indexPath) as! TypeTwoTableViewCell
            let c = self.characterArray[indexPath.row]
            cell.charImage?.image = UIImage(named: c.image)
            return cell
            
        }
        else if randomNumber == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TypeThreeCell", forIndexPath: indexPath) as! TypeThreeTableViewCell
            let c = self.characterArray[indexPath.row]
            cell.descriptionLabel?.text = c.description
            return cell
            }
        return UITableViewCell() 
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            self.currentCharacter = self.characterArray[indexPath.row]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



