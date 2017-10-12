//
//  SetLocationViewController.swift
//  CabriolaApp
//
//  Created by Jaxon Stevens on 10/4/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import JSSAlertView


class SetLocationViewController: UIViewController {
    
   // Import the global class
    let global = Global()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        setLocationAlertView()
        
    }

    @IBAction func locateUserButton(_ sender: Any) {

    }
    
    // Set Location Alert View Popup
    public func setLocationAlertView() {
        var didSelectLocationAlert = JSSAlertView().show(self,
        title: "Finding your location",
        noButtons: true,
        color: UIColorFromHex (0x2F302F, alpha: 1),
        iconImage: #imageLiteral(resourceName: "exploreIcon"),
        delay: 2)
        didSelectLocationAlert.setTextTheme(.light)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
