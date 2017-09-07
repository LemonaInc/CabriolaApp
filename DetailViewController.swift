//
//  DetailViewController.swift
//  TableViewsAssignment
//
//  Created by Jaxon Stevens on 8/16/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController  {
    
var studentName = String()
var courseName0 = String()
var courseName1 = String()
var courseName2 = String()
    
    @IBOutlet var studentNameLabel: UILabel!
    
    @IBOutlet var courseNameLabel0: UILabel!
    @IBOutlet var courseNameLabel1: UILabel!
    @IBOutlet var courseNameLabel2: UILabel!


    
    
    override func viewWillAppear(_ animated: Bool){
        studentNameLabel.text = studentName
        
        courseNameLabel0.text = courseName0
        courseNameLabel1.text = courseName1
        courseNameLabel2.text = courseName2
        
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

