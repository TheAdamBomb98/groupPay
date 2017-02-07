//
//  ViewController.swift
//  groupPay
//
//  Created by FORD ADAM, WEST CARTER, STROBEL JOSEPH, BLANCHARD JENNIFER on 12/8/16.
//  Copyright © 2016 FORD ADAM, WEST CARTER, STROBEL JOSEPH, BLANCHARD All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
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
        var groupName  = allGroups[indexPath.row].name
        cell.textLabel?.text = groupName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        currentGroupName = currentCell.textLabel?.text
        performSegue(withIdentifier: "yourSegueIdentifier", sender: self)
    }

    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if( segue.identifier == "yourSegueIdentifier" ) {
            for i in allGroups {
                if (i.name == currentGroupName)
                {
                groupToPass = i
                }
        
        var secondVC = segue.destination as! GroupPageController
        secondVC.recievedGroup = groupToPass
            }
        }
    
    //func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        // Get Cell Label
        //let indexPath = tableView.indexPathForSelectedRow!
        //let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
       // currentGroupName = currentCell.textLabel?.text
        //performSegue(withIdentifier: "yourSegueIdentifier", sender: self)
   // }
    
    }

        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        allGroups = loadGroups()!
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





