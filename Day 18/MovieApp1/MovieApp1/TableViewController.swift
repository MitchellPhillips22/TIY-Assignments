//
//  TableViewController.swift
//  MovieApp1
//
//  Created by Mitchell Phillips on 2/24/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

protocol MoviesProtocol {
    func passMovieInfo(movies: [Movies])
}

class TableViewController: UIViewController, MoviesProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfMovies = [Movies]()
    var currentMovie = Movies()
    var apiController: MovieAPI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController = MovieAPI(delegate: self)
        
        self.apiController?.findMovies()    
  
      }
    
    func passMovieInfo(movies: [Movies]) {
       
        self.arrayOfMovies = movies
        
        dispatch_async(dispatch_get_main_queue(), {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            self.tableView.reloadData()
        })
        for movie in arrayOfMovies {
            print(movie.title)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let m: Movies = self.arrayOfMovies[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as! TableViewCell
            cell.titleLabel.text = m.title
            cell.releaseDateLabel.text = m.release_date
            cell.loadImageFromURL("https://image.tmdb.org/t/p/w185\(m.poster_path)")

//            cell.imageView?.image = m.poster_path
       return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.currentMovie = arrayOfMovies[indexPath.row]
        
        performSegueWithIdentifier("detailSegue", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let detailView = segue.destinationViewController as! DetailViewController
            detailView.detailMovie = self.currentMovie
            
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMovies.count
    }
}
