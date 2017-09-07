//
//  TableViewController.swift
//  TableViewsAssignment
//
//  Created by Jaxon Stevens on 8/16/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var studentArray = [User]()

   // var selectedUser: String!
    
    /// VIEW DID LOAD ///
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewData()
        
        // Register The TableView Cell and Set teh Cell Identifier Name
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil),
        forCellReuseIdentifier: "students")
       //  self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    /// DID RECIEVE MEMMORY WARNING (NOT USED NOW) ///
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// TABLE VIEW DATA ///
    // Setup the table View Data
    func tableViewData() {
        
        // Student 1
        let mitchesCourse1 = Course(name: "Networking", grade: 99)
        let mitchesCourse2 = Course(name: "Web Apps", grade: 88)
        let mitchesCourse3 = Course(name: "iOS", grade: 100)
        
        let student0 = User(name: "Vancouver", courses: [mitchesCourse1, mitchesCourse2, mitchesCourse3])
        studentArray.append(student0)
        
        // Student 2
        let matiasCourse1 = Course(name: "Networking", grade: 50)
        let matiasCourse2 = Course(name: "Web Apps", grade: 98)
        let matiasCourse3 = Course(name: "iOS", grade: 80)
        
        let student1 = User(name: "Seattle", courses: [matiasCourse1, matiasCourse2, matiasCourse3])
        studentArray.append(student1)
        
        // Student 3
        let rossCourse1 = Course(name: "Networking", grade: 78)
        let rossCourse2 = Course(name: "Web Apps", grade: 89)
        let rossCourse3 = Course(name: "iOS", grade: 86)
        
        let student2 = User(name: "Portland", courses: [rossCourse1, rossCourse2, rossCourse3])
        studentArray.append(student2)

        // student 4
        let berenCourse1 = Course(name: "Networking", grade: 60)
        let berenCourse2 = Course(name: "Web Apps", grade: 77)
        let berenCourse3 = Course(name: "iOS", grade: 87)
        
        let student3 = User(name: "San Francisco", courses: [berenCourse1, berenCourse2, berenCourse3])
        studentArray.append(student3)
        
        // Student 5
        let neoCourse1 = Course(name: "Networking", grade: 60)
        let neoCourse2 = Course(name: "Web Apps", grade: 77)
        let neoCourse3 = Course(name: "iOS", grade: 87)
        
        let student4 = User(name: "Los Angeles", courses: [neoCourse1, neoCourse2, neoCourse3])
        studentArray.append(student4)
        
        // Student 6
        let luisCourse1 = Course(name: "Networking", grade: 90)
        let luisCourse2 = Course(name: "Web Apps", grade: 87)
        let luisCourse3 = Course(name: "iOS", grade: 20)
        
        let student5 = User(name: "San Diego", courses: [luisCourse1, luisCourse2, luisCourse3])
        studentArray.append(student5)
        
        // Student 7 
        let jesseCourse1 = Course(name: "Networking", grade: 55)
        let jesseCourse2 = Course(name: "Web Apps", grade: 80)
        let jesseCourse3 = Course(name: "iOS", grade: 96)
        
        let student6 = User(name: "Palm Springs", courses: [jesseCourse1, jesseCourse2, jesseCourse3])
        studentArray.append(student6)
        
        
    }


    /// NUMBER OF SECTIONS ///
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    /// NUMBER OF ROWS IN SECTION ///
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Return the table View Cells
        return studentArray.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "students", for: indexPath) as?
            TableViewCell {
            
            //let student = students[indexPath.row]
           // cell.StudentLabel.text = student
            
            let currentUser = studentArray[indexPath.row]
            
            cell.StudentLabel.text = currentUser.name
            
            cell.gradeLabel.text = " \(currentUser.getAverageGrade())"
            
            
            
            //let grade = grades[indexPath.row]
           // cell.gradeLabel.text = grade
            
            return cell

        }
        
        return UITableViewCell()
    
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
        
       // var selectedUser = String()
      //  selectedUser = self.tableViewData[indexPath.row]

        

    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
        
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        if segue.identifier == "detailSegue" {
            let vc = segue.destination as! DetailViewController
            vc.studentName = ""
            vc.courseName0 = "Networking"
            vc.courseName1 = "Web Apps"
            vc.courseName2 = "iOS"
        
            
        }
    }
    
    
  

}

