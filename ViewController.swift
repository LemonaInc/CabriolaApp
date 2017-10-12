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


class ViewController: UIViewController {

    // DECLARATIONS //
    var dict : [String : AnyObject]!
    // DECLARATIONS //
    
    // VIEW DID LOAD FUNCTION
    override func viewDidLoad() {
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
        getStartedAlertView()
    }
    
    
    
    // DID RECIEVE MEMORY WARNING FUNCTION
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
   
    
    // When the map is loaded call this alert view
    func getStartedAlertView() {
        
        var roxaWelcomeAlertView = JSSAlertView().show(self,
         title: "Welcome!",
         text: "Get Started by creating a profile!",
         color: UIColorFromHex (0x2F302F, alpha: 1),
         iconImage: #imageLiteral(resourceName: "exploreIcon"))
        roxaWelcomeAlertView.setTextTheme(.light)
    }
    
    
    
} // END
