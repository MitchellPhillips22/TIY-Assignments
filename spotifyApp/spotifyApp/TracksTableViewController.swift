//
//  TracksTableViewController.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class TracksTableViewController: UITableViewController {
    
    @IBOutlet weak var tracksTableView: UITableView!
    
    var arrayOfTracks = [Track]()
    var currentArtist = Artist()
    var currentTrack = Track()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfTracks.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

   
}
