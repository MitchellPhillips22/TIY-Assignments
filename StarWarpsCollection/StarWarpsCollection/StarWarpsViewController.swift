//
//  StarWarpsViewController.swift
//  StarWarpsCollection
//
//  Created by Mitchell Phillips on 3/3/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit
import CoreData

protocol StarWarsProtocol {
    func passPlanetInfo(planet: Planet)
    func passPeopleInfo(people: Person)
    
}

class StarWarpsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrayOfInfo = [Person(), Planet()]
    
    var currentPerson = Person()
    
    var currentPlanet = Planet()
    
    let moc = DataController().managedObjectContext


    override func viewDidLoad() {
        super.viewDidLoad()
        
                
               
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! StarWarpsCollectionViewCell
        cell.nameLabel.text =  currentPerson.name
        cell.eyeColorLabel.text = currentPerson.eyeColor
        
        
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfInfo.count
        
    }
    func seedPersonPlusPlanet() {
        
        
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as! Person
        
        let today = NSDate()
        
        entity.setValue("Luke Skywalker", forKey: "name")
        entity.setValue("Male", forKey: "gender")
        entity.setValue(today, forKey: "created")
        
        let entityStarship = NSEntityDescription.insertNewObjectForEntityForName("Starship", inManagedObjectContext: moc) as! Planet
        
        entityStarship.setValue("Melennium Falcon", forKey: "name")
        entityStarship.setValue(today, forKey: "created")
        
        let entityStarship2 = NSEntityDescription.insertNewObjectForEntityForName("Starship", inManagedObjectContext: moc)
        
        entityStarship2.setValue("X-wing", forKey: "name")
        entityStarship2.setValue(today, forKey: "created")
        
        
        do {
            try moc.save()
            
        } catch {
            
            fatalError("failure to save context \(error)")
        }
        
        
    }
    

}

