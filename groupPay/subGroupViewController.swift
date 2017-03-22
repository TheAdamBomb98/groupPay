//
//  subGroupViewController.swift
//  groupPay
//
//  Created by WEST, CARTER on 3/22/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
class subGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var gotGroupIndex: Int?
    var gotPersonIndex: Int?
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allGroups[gotGroupIndex!].people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text =  allGroups[gotGroupIndex!].people[indexPath.row].name
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        }
}
