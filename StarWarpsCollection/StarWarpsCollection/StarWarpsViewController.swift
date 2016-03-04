//
//  StarWarpsViewController.swift
//  StarWarpsCollection
//
//  Created by Mitchell Phillips on 3/3/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

protocol StarWarsProtocol {
    func passPlanetInfo(planet: Planet)
    func passPeopleInfo(people: People)
    
}

class StarWarpsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrayOfInfo = [People(), Planet()]
    var currentPerson = People()
    var currentPlanet = Planet()

    override func viewDidLoad() {
        super.viewDidLoad()
        
                
               
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! StarWarpsCollectionViewCell
        
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfInfo.count
        
    }
}

