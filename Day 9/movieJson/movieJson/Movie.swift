//
//  Movie.swift
//  movieJson
//
//  Created by Mitchell Phillips on 2/11/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation

class Movie {
    var poster_path: String = ""
    var adult: Bool = false
    var overview: String = ""
    var release_date: String = ""
    var genre_ids: [Int] = [0]
    var id: Int = 0
    var original_title: String = ""
    var original_language: String = ""
    var title: String = ""
    var backdrop_path: String = ""
    var popularity: Double = 0.0
    var vote_count: Int = 0
    var video: Bool = false
    var vote_average: Double = 0.0
    
    init(dict: JSONDictionary) {
        
        if let poster_path = dict["poster_path"] as? String {
            self.poster_path = poster_path
        }
        if let adult = dict["adult"] as? Bool {
            self.adult = adult
        }
        if let overview = dict["overview"] as? String {
            self.overview = overview
        }
        if let release_date = dict["release_date"] as? String {
            self.release_date = release_date
        }
        if let genre_ids = dict["genre_ids"] as? [Int] {
            self.genre_ids = genre_ids
        }
        if let id = dict["id"] as? Int {
            self.id = id
        }
        if let original_title = dict["original_title"] as? String {
            self.original_title = original_title
        }
        if let original_language = dict["original_language"] as? String {
            self.original_language = original_language
        }
        if let title = dict["title"] as? String {
            self.title = title
        }
        if let backdrop_path = dict["backdrop_path"] as? String {
            self.backdrop_path = backdrop_path
        }
        if let popularity = dict["popularity"] as? Double {
            self.popularity = popularity
        }
        if let vote_count = dict["vote_count"] as? Int {
            self.vote_count = vote_count
        }
        if let video = dict["video"] as? Bool {
            self.video = video
        }
        if let vote_average = dict["vote_average"] as? Double {
            self.vote_average = vote_average
        }
    }
}


