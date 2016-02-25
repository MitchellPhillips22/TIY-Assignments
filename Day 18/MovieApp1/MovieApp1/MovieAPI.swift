//
//  MovieAPI.swift
//  MovieApp1
//
//  Created by Mitchell Phillips on 2/24/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class MovieAPI {
    
    var arrayOfMovies = [Movies]()
    var delegate: MoviesProtocol?
    
    init(delegate: TableViewController) {
        self.delegate = delegate
    }
    
    func findMovies() {
        
        let urlString = "http://api.themoviedb.org/3/movie/popular?api_key=97958a1f161adcd2855c885b48a7f297"
        
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                if error != nil {
                    print("error with data task url")
                } else {
                    print(data)
                    
                    if let data = data {
                        
                        do {
                            if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                                
                                if let results = dict["results"] as? JSONArray {
                                    for result in results {
                                        
                                        let m = Movies(dict: result)
                                        
                                        self.arrayOfMovies.append(m)
                                        
                                    }
                                    self.delegate?.passMovieInfo(self.arrayOfMovies)
                                }
                                
                                
                            } else {
                                print("it didn't")
                            }
                        } catch {
                        }
                    }
                }
            })
            task.resume()
        }
    }
}
