//
//  Global.swift
//  CabriolaApp
//
//  Created by Jaxon Stevens on 10/4/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import JSSAlertView

class Global: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func setLocationAlertViewGlobal() {
        
        var didSelectLocationAlert = JSSAlertView().show(self,
         title: "Finding your location",
         noButtons: true,
         color: UIColorFromHex (0x2F302F, alpha: 1),
         iconImage: #imageLiteral(resourceName: "exploreIcon"),
         delay: 2)
        didSelectLocationAlert.setTextTheme(.light)
    }
    
    func testFunc() {
        
        print("WOW")
    }
    

   
    


}
