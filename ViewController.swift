//
//  ViewController.swift
//  TableViewsAssignment
//
//  Created by Jaxon Stevens on 8/16/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

// IMPORT
import UIKit
import FacebookLogin
import FBSDKLoginKit
import FacebookCore
import UserNotifications
import FBNotifications
import JSSAlertView
import CoreLocation


class ViewController: UIViewController {
    @IBOutlet weak var
    locationAccessGrantedButton: UIButton!
    
    let locationManager = CLLocationManager()

    // DECLARATIONS //
    var dict : [String : AnyObject]!
    // DECLARATIONS //
    
    // VIEW DID LOAD FUNCTION
    override func viewDidLoad() {
        
       // navigationController?.navigationBar.isUserInteractionEnabled = false
       // navigationController?.navigationBar.tintColor = UIColor.black
        
        
        // Set the button to not visible when the view loads
        locationAccessGrantedButton.isHidden = true
        // Facebook Login Button
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        loginButton.center = view.center
   
        
        //adding login button to subview
       // view.addSubview(loginButton)
        //if the user is already logged in
        if (FBSDKAccessToken.current()) != nil{
            // Call the function to get facebook user data
            getFacebookUserData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    // DID RECIEVE MEMORY WARNING FUNCTION
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  // Prompt a location window when button is pressed
    @IBAction func allowLocationButton(_ sender: Any)
    {

        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
        
            print ("Granted Always")
            // Set the button to visible
            locationAccessGrantedButton.isHidden = false

            locationAccessGrantedAlertView()

        }
        else if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse) {
           
            print("Granted When in use")
            
            // Set the button to visible
            locationAccessGrantedButton.isHidden = false
            
            locationAccessGrantedAlertView()
            
        } else {
            // Set the button to visible
        locationAccessGrantedButton.isHidden = true
         //locationNotGrantedAlertView()
        goToSettingsAlertView()
        
        }
        
    }

    // Next Button Invisible func

    @IBAction func locationAccessGrantedButton(_ sender: Any)
    {
    }
    
    
    
    // LOGIN BUTTON CLICKED FUNCTION (FACEBOOK)
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFacebookUserData()
            }
        }
    }
    
    
    // GET FACEBOOK USER DATA FUNCTION
    func getFacebookUserData() {
        // If the facebook Token does not equal nil
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
   
    
    // Location is not granted view
    func locationNotGrantedAlertView() {
        
        var locationNotGrantedAlert = JSSAlertView().show(self,
         title: "Location Access Denied",
         text: "Go to settings to enable location access for Cabriola",
         color: UIColorFromHex (0xFB5F68, alpha: 1),
         iconImage: #imageLiteral(resourceName: "exploreIcon"))
        locationNotGrantedAlert.setTextTheme(.light)
    }
    
    // Location is granted view
    func locationAccessGrantedAlertView() {
       
        var locationGrantedAlert = JSSAlertView().show(self,
       title: "Get Started",
       text: "Click next to start finding places!",
       color: UIColorFromHex (0x32D4E1, alpha: 1),
        iconImage: #imageLiteral(resourceName: "exploreIcon"))
        locationGrantedAlert.setTextTheme(.light)
        
    }
    
    // Alert view to go to location prefrences in settings
    func goToSettingsAlertView() {
        
        let alertController = UIAlertController (title: "Location Access Denied", message: "Go To Settings to allow your location for Cabriola", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Go To Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "No Thanks", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
} // END
