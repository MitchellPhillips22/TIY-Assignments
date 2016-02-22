//
//  Dish.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation


class Dishes {
    
    var dishName: String = ""
    var dishDescripsh: String = ""
    var dishImage: String = ""
    var price: String = ""
    var rating: Int = 0
    
    init(dict: JSONDictionary) {
        
        if let dishName = dict["dishName"] as? String {
            self.dishName = dishName
        }
        if let dishDescripsh = dict["dishDescripsh"] as? String {
            self.dishDescripsh = dishDescripsh
        }
        if let dishImage = dict["dishImage"] as? String {
            self.dishImage = dishImage
        }
        if let price = dict["price"] as? String {
            self.price = price
        }
        if let rating = dict["rating"] as? Int {
            self.rating = rating
        }
        
        
    }
}