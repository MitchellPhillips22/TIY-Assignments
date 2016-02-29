//
//  CityTableViewController.swift
//  WeatherSucks
//
//  Created by Mitchell Phillips on 2/26/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

protocol WeatherProtocol {
    
    func passWeatherInfo(city: City)
    
    func passGoogleInfo(address: String, lat: Double, long: Double)
}

class CityTableViewController: UIViewController, WeatherProtocol, UITableViewDataSource, UITableViewDelegate {
    
    var arrayOfCities = [City]()
    var currentCity = City()
    var arrayOfWeather = [Weather]()
    var currentWeather = Weather()
    var apiController: APIFunction?
    var lat: Double = 0
    var long: Double = 0
    var addressString: String = ""
    var numberFormatter = NSNumberFormatter()
    
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var zipTextField: UITextField!
    @IBAction func addCityButton(sender: UIButton) {
        apiController?.googleMapsFunction(zipTextField.text!)
        self.apiController?.searchWeather("\(lat),\(long)")
        print(currentCity.name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController = APIFunction(d: self)
        
          }
    // MARK: - Protocol Functions
    func passWeatherInfo(city: City) {
        dispatch_async(dispatch_get_main_queue(), {
            self.currentCity = city
            self.currentCity.name = self.addressString
            self.arrayOfCities.insert(self.currentCity, atIndex: 0)
            self.cityTableView.reloadData()

        })
    }
    func passGoogleInfo(address: String, lat: Double, long: Double) {
        addressString = address
        self.lat = lat
        self.long = long
    }
    // MARK: - Table View Functions
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = arrayOfCities[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath) as! CityTableViewCell
        cell.cityNameLabel.text = c.name
        cell.currentTempLabel.text = "\(numberFormatter.stringForObjectValue(c.cityTemp)!)°F"
        cell.currentWeatherLabel.text = c.currentWeather
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let detailView = segue.destinationViewController as! DetailViewController
            detailView.currentCity = self.currentCity
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       performSegueWithIdentifier("detailSegue", sender: self)
        currentCity = arrayOfCities[indexPath.row]
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfCities.count
        
    }
}

