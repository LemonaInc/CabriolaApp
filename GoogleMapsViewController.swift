//
//  GoogleMapsViewController.swift
//  CabriolaApp
//
//  Created by Jaxon Stevens on 10/4/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker
import CoreLocation
import JSSAlertView
    
class GoogleMapsViewController: UIViewController, CLLocationManagerDelegate {
        
    var placesClient: GMSPlacesClient!
    // Declare the location manager
    var locationManager = CLLocationManager()

  // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
        @IBOutlet var nameLabel: UILabel!
        @IBOutlet var addressLabel: UILabel!
    
      // VIEW DID LOAD
        override func viewDidLoad() {
            super.viewDidLoad()
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            placesClient = GMSPlacesClient.shared()
        }
    

    // Location Manager Function 
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }
    }

        
        // Add a UIButton in Interface Builder, and connect the action to this function.
        @IBAction func getCurrentPlace(_ sender: UIButton) {
            
            var didSelectLocationAlert = JSSAlertView().show(self,
                                                             title: "Locating...",
                                                             noButtons: true,
                                                             color: UIColorFromHex (0x32D4E1, alpha: 1),
                                                             iconImage: #imageLiteral(resourceName: "exploreIcon"),
                                                             delay: 2)
            didSelectLocationAlert.setTextTheme(.light)
            
            
            placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
                if let error = error {
                    print("Pick Place error: \(error.localizedDescription)")
                    return
                }
                
                self.nameLabel.text = "No current place"
                self.addressLabel.text = ""
                
                if let placeLikelihoodList = placeLikelihoodList {
                    let place = placeLikelihoodList.likelihoods.first?.place
                    if let place = place {
                        self.nameLabel.text = place.name
                        self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                            .joined(separator: "\n")
                    }
                }
            })
        }
}




   /* override func viewDidLoad() {
        super.viewDidLoad()
        loadView()

    }

    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}
 
    */

