//
//  TracksTableViewController.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class TracksTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tracksTableView: UITableView!
    
    var arrayOfTracks = [Track]()
    var currentArtist = Artist()
    var currentTrack = Track()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       arrayOfTracks = currentArtist.arrayOfTracks
        
    }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfTracks.count
    }
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let t = arrayOfTracks[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath) as! TracksTableViewCell
        cell.albumNameLabel.text = t.albumName
        cell.trackNameLabel.text = t.songName
        cell.popularityLabel.text = "\(t.popularity)"
        return cell
    }
}
