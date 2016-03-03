//
//  ArtistTableViewController.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

protocol MusicProtocol {
    
    func passArtistInfo(artist: Artist)
    
}

class ArtistTableViewController: UIViewController, MusicProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var artistSearchText: UITextField!

    @IBOutlet weak var artistTableView: UITableView!
    
    @IBAction func searchButton(sender: UIButton) {
        
        apiControl?.findArtist(artistSearchText.text!)
            print(currentArtist.name)
        
        
    }
    
    var arrayOfArtists = [Artist]()
    var currentArtist = Artist()
    var apiControl: APIController?
    var currentTrack = Track()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayOfArtists = DataStore.sharedInstance.arrayOfArtists
        
        self.apiControl = APIController(a: self)
        
        if DataStore.sharedInstance.saveArtists() {
            print("it save")
        } else {
            print("it didn't save")
        }
    
    }
 
    
    func passArtistInfo(artist: Artist) {
        dispatch_async(dispatch_get_main_queue(), {
        self.currentArtist = artist
        self.arrayOfArtists.insert(self.currentArtist, atIndex: 0)
        self.artistTableView.reloadData()
            
        })
        
       
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TrackSegue" {
            let tracksTableView = segue.destinationViewController as! TracksTableViewController
            tracksTableView.currentArtist = self.currentArtist
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentArtist = arrayOfArtists[indexPath.row]
       performSegueWithIdentifier("TrackSegue", sender: self)
           }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let a = arrayOfArtists[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ArtistCell", forIndexPath: indexPath) as! ArtistTableViewCell
        cell.artistLabel.text = a.name
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfArtists.count
    }
}

