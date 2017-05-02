//
//  subGroupViewController.swift
//  groupPay
//
//  Created by WEST, CARTER on 3/23/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
class subGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableOfSubGroup: UITableView!
    
    @IBOutlet weak var backButton: UIButton!
    
    var gotGroupIndex: Int?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allGroups[gotGroupIndex!].people.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var personName  = allGroups[gotGroupIndex!].people[indexPath.row].name
        if greenOrRed == [] {
            cell.backgroundColor = UIColor.green
        }
        else {
            let green = greenOrRed[indexPath.row]
            if green {
                cell.backgroundColor = UIColor.green
            }
            else {
                cell.backgroundColor = UIColor.red
            }
        }
        cell.textLabel?.text = personName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        let indexPath = tableView.indexPathForSelectedRow!
        if ( tableOfSubGroup.cellForRow(at: indexPath)?.backgroundColor == UIColor.green){
                   tableOfSubGroup.cellForRow(at: indexPath)?.backgroundColor = UIColor.red
        }
        else {
            tableOfSubGroup.cellForRow(at: indexPath)?.backgroundColor = UIColor.green
        }
        tableOfSubGroup.deselectRow(at: indexPath, animated: false)
    }
   

    @IBAction func backButtonPressed(_ sender: Any) {
        greenOrRed = []
        for i in tableOfSubGroup.visibleCells {
            if( i.backgroundColor == UIColor.green ) {
                greenOrRed.append(true)
                for allGroupPeople in allGroups[gotGroupIndex!].people {
                    if ( allGroupPeople.name == i.textLabel?.text ) {
                        nonFullGroup.append(allGroupPeople)
                        
                    }
                }
            }
            else {
                greenOrRed.append(false)
            }
        }
        if ( !(nonFullGroup.count == allGroups[gotGroupIndex!].people.count) ) {
            groupHasChanged = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        
        // Do any additional setup after loading the view.
    }
    
}
