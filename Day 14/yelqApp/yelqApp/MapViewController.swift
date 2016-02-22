//
//  MapViewController.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/20/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var currentRestaurant: Restaurant?
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
       let newLatitude = currentRestaurant!.latitude
        let newLongitude = currentRestaurant!.longitude
        let myLocation = CLLocation(latitude: newLatitude, longitude: newLongitude)
        let center = CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude)
        
        centerMapOnLocation(myLocation)
        
        self.createAnnotation("\(currentRestaurant!.name)", subTitle: "\(currentRestaurant!.location)", coordinate: center)
    }
    func geoLocation(fullAddressString: String) {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(fullAddressString, completionHandler: { placemarks, error in
            
            
        })
    }
    
    func createAnnotation(title: String, subTitle: String, coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subTitle
        annotation.coordinate = coordinate
        
        if self.mapView != nil {
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPinId"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            
            annotationView?.pinTintColor = UIColor.magentaColor()
            
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView?.canShowCallout = true
            
            let leftIconView = UIImageView(frame: CGRectMake(0, 0, 37, 30))
            leftIconView.image = UIImage(named: "\(currentRestaurant!.image)")
            annotationView?.leftCalloutAccessoryView = leftIconView
        }
        return annotationView
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }


}
