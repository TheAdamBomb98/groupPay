//
//  ViewController.swift
//  groupPay
//
//  Created by FORD ADAM, WEST CARTER, STROBEL JOSEPH, BLANCHARD JENNIFER on 12/8/16.
//  Copyright © 2016 FORD ADAM, WEST CARTER, STROBEL JOSEPH,JENNIFER BLANCHARD. All rights reserved.
//

import UIKit
var groupArray: [Group] = []
class ViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupArray.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var groupName  = groupArray[indexPath.row].name
        cell.textLabel?.text = groupName
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

