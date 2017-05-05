//
//  viewControllerThree.swift LOL at Joe's naming
//  groupPay
//
//  Created by STROBEL, JOSEPH on 1/9/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class GroupPageController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    var gotGroupIndex: Int?
    
    
    @IBOutlet weak var makePaymentButton: UIButton!
    
    @IBOutlet var peopleTable: UITableView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var groupTotalLabel: UILabel!
    
    //how many sections are in the view
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
                var tempPerson = i
                indexOfPerson = allGroups[gotGroupIndex!].people.index(of: tempPerson)
            }
        }
        defaultPayer = allGroups[gotGroupIndex!].people[0]
        performSegue(withIdentifier: "groupPageToPersonPage" , sender: self )
    }
        

    //EXPORTING!!!!
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func makePaymentButtonPressed(_ sender: Any) {
        indexOfPerson = 0
        performSegue(withIdentifier: "makePaymentButtonToNew" , sender: self )
    }
    
    override func viewDidLoad() {
        gotGroupIndex = indexOfGroup
        groupNameLabel.text = allGroups[gotGroupIndex!].name
        var groupTotal = 0.0
        for i in allGroups[gotGroupIndex!].transactions {
            groupTotal += i.amount
        }
        groupTotalLabel.text = "$" + (String)(groupTotal)
        greenOrRed = []
    }
 
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            allGroups[gotGroupIndex!].people.remove(at: indexPath.row)
            allGroups[indexOfGroup].people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],  with: UITableViewRowAnimation.automatic)
            saveGroups()
        
            }*/

        }
    

    

