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
import JSSAlertView

class MapViewController: UIViewController {
  
    // Import the SetLocationViewController to be called
    let setLocationViewController = SetLocationViewController()

    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        map.delegate = self as? MKMapViewDelegate
        map.showsScale = true
        map.showsPointsOfInterest = true
        map.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        
        // Set the longitude for the location
        var vancouver = CLLocationCoordinate2DMake (49.2827, -123.11934)
        // Create the annotation
        var vancouverAnnotation = MKPointAnnotation()
        vancouverAnnotation.coordinate = vancouver
        vancouverAnnotation.title = "Vancouver, BC"
        vancouverAnnotation.subtitle = "Canada"
        
        
        
        var VFS = CLLocationCoordinate2DMake (49.280228, -123.102707)
        
        var vancouverFilmSchool = MKPointAnnotation()
        vancouverFilmSchool.coordinate = VFS
        vancouverFilmSchool.title = "VFS"
        vancouverFilmSchool.subtitle = "Vancouver Film School"


        // Set the span of the coordinate
        var span = MKCoordinateSpanMake(0.2,0.2)
        // Create the region for the initial mapview
        var region = MKCoordinateRegion(center: vancouver, span: span)
        // Set the initial map region to the region defined
        map.setRegion(region, animated: true)
        // Add the annotation to the MapView
        map.addAnnotation(vancouverAnnotation)
        map.addAnnotation(vancouverFilmSchool)

        
        
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
    mapLoadedAlertView()

    }
    
    
    // When the map is loaded call this alert view
    func mapLoadedAlertView() {
        
        var roxaWelcomeAlertView = JSSAlertView().show(self,
         title: "Welcome To Vancouver",
         text: "Lets find some places for you!",
         color: UIColorFromHex (0x32D4E1, alpha: 1),
         iconImage: #imageLiteral(resourceName: "exploreIcon"))
        roxaWelcomeAlertView.setTextTheme(.light)
    }
    
    
}

