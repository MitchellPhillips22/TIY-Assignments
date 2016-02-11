//
//  ViewController.swift
//  movieJson
//
//  Created by Mitchell Phillips on 2/11/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var currentMovie: Movie?
    var moviesArray = [Movie]()
    @IBOutlet weak var moviesList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (jsonString, popular) = loadJSONFile("popular", fileType: "json")
        print(jsonString)
        
        if let popular = popular {
            do {
                let object = try NSJSONSerialization.JSONObjectWithData(popular, options: .AllowFragments)
                
                if let dict = object as? JSONDictionary {
                    
                    if let results = dict["results"] as? JSONArray {
                        for result in results {
                            let m = Movie(dict: result)
                            self.moviesArray.append(m)
                        }
                    }
                }
            } catch {
                print("Unable to parse JSON string")
            }
        }
    }
    // MARK: - Table View Functions
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentMovie = self.moviesArray[indexPath.row]
        self.performSegueWithIdentifier("movieDeetsSegue", sender: self)
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        self.currentMovie = self.moviesArray[indexPath.row]
        if let title = self.currentMovie?.title {
            cell.textLabel?.text = "\(title)"
        }
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "movieDeetsSegue" {
            let movieDeetsViewController = segue.destinationViewController as! MovieDeetsViewController
            movieDeetsViewController.movie = currentMovie
        }
    }
    
    // MARK: - Load JSON
    
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

