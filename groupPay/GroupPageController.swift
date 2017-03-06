//
//  viewControllerThree.swift LOL at Joe's naming
//  groupPay
//
//  Created by STROBEL, JOSEPH on 1/9/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class GroupPageController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var gotGroup: Group?
    var gotGroupIndex: Int?
    
    
    @IBOutlet var peopleTable: UITableView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gotGroup!.people.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let savedGroups = loadGroups(){
            allGroups = savedGroups
        }
        var personName  = gotGroup?.people[indexPath.row].name
        cell.textLabel?.text = personName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        let currentPersonName = currentCell.textLabel?.text
        
        for i in (allGroups[gotGroupIndex!].people) {
            if ( i.name == currentPersonName )
            {
                personToPass = i
                indexOfPerson = allGroups[gotGroupIndex!].people.index(of: personToPass)
            }
        }
        groupToPass = gotGroup
        indexOfGroup = gotGroupIndex
        performSegue(withIdentifier: "groupPageToPersonPage" , sender: self )
    }
    
    override func viewDidLoad() {
        if let savedGroups = loadGroups(){
            allGroups = savedGroups
        }
        gotGroupIndex = indexOfGroup
        gotGroup = groupToPass
        groupNameLabel.text = gotGroup?.name
    }
 
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            gotGroup?.people.remove(at: indexPath.row)
            allGroups[indexOfGroup].people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],  with: UITableViewRowAnimation.automatic)
            saveGroups()
        
            }

        }
    }

    

