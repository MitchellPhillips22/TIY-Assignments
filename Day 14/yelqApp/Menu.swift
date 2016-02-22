//
//  Menu.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation


class Menu {
    
    var menuName: String = ""
    var dishes = [Dishes]()

    init(dict: JSONDictionary){
        
        if let menuName = dict["menuName"] as? String {
            self.menuName = menuName
        }
        if let results = dict["dishes"] as? JSONArray {
            for result in results {
                let d = Dishes(dict: result)
                self.dishes.append(d)
            }
        }
    }
}
//if let results = dict["menu"] as? JSONArray {
//    for result in results {
//        let m = Menu(dict: result)
//        self.menuArray.append(m)
//        print("menuAppended")
