//
//  settings.swift
//  groupPay
//
//  Created by STROBEL, JOSEPH on 4/11/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class Settings: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tagTable: UITableView!
    @IBOutlet weak var tagField: UITextField!
    
    //tags = ["Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        
        return cell
    }
    
    
    @IBAction func addTag(_ sender: UIButton) {
        
    }
    
    


}
