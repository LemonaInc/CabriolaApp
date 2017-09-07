//
//  MapViewController.swift
//  CabriolaApp
//
//  Created by Jaxon Stevens on 9/6/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapViewController: UIViewController {
  
    @IBOutlet weak var Map: MKMapView!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        // Set the longitude for the location
        var vancouver = CLLocationCoordinate2DMake (49.2827, -123.11934)
        // Create the annotation
        var vancouverAnnotation = MKPointAnnotation()
        vancouverAnnotation.coordinate = vancouver
        vancouverAnnotation.title = "Vancouver, BC"
        vancouverAnnotation.subtitle = "Canada"
        // Set the span of the coordinate
        var span = MKCoordinateSpanMake(0.2,0.2)
        // Create the region for the initial mapview
        var region = MKCoordinateRegion(center: vancouver, span: span)
        // Set the initial map region to the region defined
        Map.setRegion(region, animated: true)
        // Add the annotation to the MapView
        Map.addAnnotation(vancouverAnnotation)
        
        
    }
    
}

