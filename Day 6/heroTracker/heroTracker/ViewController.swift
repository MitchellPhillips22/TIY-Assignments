//
//  ViewController.swift
//  heroTracker
//
//  Created by Mitchell Phillips on 2/8/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [AnyObject]



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var herosArray = [Hero]()
    var currentHero: Hero?
    var jsonString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        heroInfo()
        print(herosArray)
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return herosArray.count
        
        }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        self.currentHero = self.herosArray[indexPath.row]
        
        cell!.textLabel?.text = "\(self.currentHero!.name)"
        print(currentHero)
        return cell!

        }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.currentHero = self.herosArray[indexPath.row]
       
        self.performSegueWithIdentifier("heroSegue", sender: self)
        
        }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "heroSegue" {
            let heroViewController = segue.destinationViewController as! HeroViewController
            heroViewController.hero = self.currentHero
        }
    }
    func heroInfo() {
        if let filepath = NSBundle.mainBundle().pathForResource("heros", ofType: "json") {
            do {
                jsonString = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
            } catch {
                print("Could not load data")
            }
        } else {
            print("heros not found")
        }
        
        
        let str = String(jsonString)
        
        let data = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        do {
            if let data = data,
                namesArray = try
                    NSJSONSerialization.JSONObjectWithData(data, options: []) as?
                JSONArray {
                    for result in namesArray {
                        
                        if let jsonResult = result as? JSONDictionary {
                            
                            //print(jsonResult)
                            
                            var hero = Hero(name: "", homeworld: "", powers: "", image: "")
                            
                            
                            
                            
                            if let name = jsonResult["name"] as? String {
                                hero.name = name
                                
                                
                            }
                            
                            if let homeworld = jsonResult["homeworld"] as? String {
                                hero.homeworld = homeworld
                            }
                            
                            if let powers = jsonResult["powers"] as? String {
                                hero.powers = powers
                            }
                            if let image = jsonResult["image"] as? String {
                                hero.image = image
                            }
                            
                            herosArray.append(hero)
                            
                        }
                    }
            }
        } catch {
            print("An error occurred")
        }
    }
    }

