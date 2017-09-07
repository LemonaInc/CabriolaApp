//
//  User.swift
//  TableViewsAssignment
//
//  Created by Jaxon Stevens on 8/16/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import Foundation


class User {
    
    let name: String
    let courses: [Course]

    init(name: String, courses: [Course]) {
        self.name = name
        self.courses = courses
    }
    
    func getAverageGrade() -> Int {
        
        // Create for loop to get the average grade
       
        var originalGrade = 0
        
        for course in courses {
            
            let currentGrade = course.grade
            originalGrade = originalGrade + currentGrade
        }
        return originalGrade / courses.count
        
        }
    
}
