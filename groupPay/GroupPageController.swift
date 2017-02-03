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
    
    
    @IBOutlet var peopleTable: UITableView!
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allGroups.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var personName  = allGroups[indexPath.row].name
        cell.textLabel?.text = personName
        return cell
    }

 
    
}
