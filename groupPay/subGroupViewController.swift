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
        cell.backgroundColor = UIColor.green
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        if (){
        }
        
        tableOfSubGroup.cellForRow(at: indexPath)?.backgroundColor = UIColor.red
        
    }
   
var gotGroupIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        // Do any additional setup after loading the view.
    }
    
}
