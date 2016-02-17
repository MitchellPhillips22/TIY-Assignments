//
//  ViewController.swift
//  ForceAwakens
//
//  Created by Mitchell Phillips on 2/15/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    @IBOutlet weak var characterTable: UITableView!
    
    var characterArray = [StarWarsCharacter]()
    var currentCharacter: StarWarsCharacter?

    var jsonString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (jsonString, data) = loadJSONFile("starWars", fileType: "json")
        print(jsonString)
        
        if let data = data {
            
            do {
                
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                    print("cool")
                if let dict = object as? JSONDictionary {
                    
                    if let results = dict["characters"] as? JSONArray {
                        for result in results {
                            
                            let c = StarWarsCharacter(dict: result)
                            self.characterArray.append(c)
                            
                        }
                    }
                }
                for currentCharacter in characterArray {
                    print(currentCharacter.name)
                }

            } catch {
                print("There is no character")
            }
        }

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = self.characterArray[indexPath.row]
        
        var cell: UITableViewCell?
        
        if c.number == 1 {
             let typeOneCell = tableView.dequeueReusableCellWithIdentifier("TypeOneCell", forIndexPath: indexPath) as! TypeOneTableViewCell
            cell.nameLabel?.text = c.name
            cell.affiliationLabel?.text = c.affiliation
            print("cool")

        }
        
    }
    
//    var currentNumber = currentCharacter?.number
//    
//    if currentNumber == currentNumber {
//    
//    let cell = tableView.dequeueReusableCellWithIdentifier("TypeOneCell", forIndexPath: indexPath) as! TypeOneTableViewCell
//    let c = self.characterArray[indexPath.row]
//    cell.nameLabel?.text = c.name
//    cell.affiliationLabel?.text = c.affiliation
//    print("cool")
//    
//    
//    }
//    if currentNumber == currentNumber {
//    let cell = tableView.dequeueReusableCellWithIdentifier("TypeTwoCell", forIndexPath: indexPath) as! TypeTwoTableViewCell
//    let c = self.characterArray[indexPath.row]
//    cell.charImage?.image = UIImage(named: c.image)
//    print("rad")
//    
//    
//    }
//    if currentNumber == currentNumber {
//    let cell = tableView.dequeueReusableCellWithIdentifier("TypeThreeCell", forIndexPath: indexPath) as! TypeThreeTableViewCell
//    let c = self.characterArray[indexPath.row]
//    cell.descriptionLabel?.text = c.description
//    print("nice")
//    
//    
//    }
//    return UITableViewCell()
//}
//





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



