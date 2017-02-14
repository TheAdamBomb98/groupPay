//
//  transactionController.swift
//  groupPay
//
//  Created by STROBEL, JOSEPH on 2/14/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class transactionController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var tranName  = "one"
        cell.textLabel?.text = tranName
        return cell
    }
    
    override func viewDidLoad() {
        
    }

    
    
}
