//
//  APIController.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class APIController {
    
    var delegate: MusicProtocol?
    var arrayOfArtists = [Artist]()
    var arrayOfTracks = [Track]()
    
    init(a: ArtistTableViewController) {
        self.delegate = a
    }
    
    func findArtist(artistName: String) {
        
        let urlString = "https://api.spotify.com/v1/search?q=\(artistName)&type=artist"
        
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    print("error, \(error)")
                }
                if let data = data {
                    do {
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                            if let results = dict["artists"] as? JSONDictionary {
                                if let items = results["items"] as? JSONArray {
                                    let itemDict = items.first
                                    let a = Artist(dict: itemDict!)
                                    
                                    self.delegate?.passArtistInfo(a)
                                }
                            }
                        }
                    } catch {
                    }
                }
            })
            task.resume()
        }
    }
    func searchTopTracks(idString: String) {
        
        let urlString = "https://api.spotify.com/v1/artists/\(idString)/top-tracks?country=US"
        
        if let url = NSURL(string: urlString) {
            print(url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    print("error, \(error)")
                }
                if let data = data {
                    do {
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                            if let results = dict["tracks"] as? JSONArray {
                                for result in results {
                                    let t = Track(dict: result)
                                    self.arrayOfTracks.append(t)
                                    
                                }
                                self.delegate?.passTrackList(self.arrayOfTracks)
                            }
                        }
                    } catch {
                        print("can't parse dictionary")
                    }
                }
                
            })
            task.resume()
        }
        
    }
}
