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
        let cell = UITableViewCell()
        
        let groupName  = allGroups[indexPath.row].name
        var groupDate = allGroups[indexPath.row].date.description
        let endVal = groupDate.index(groupDate.startIndex, offsetBy: 10)
        let dateSub = groupDate.substring(to: endVal)
        groupDate = dateSub
        //let label1 = UILabel(frame: CGRect(x: 15, y: 0, width: cell.frame.width/2, height: cell.frame.height))
        cell.textLabel?.text = groupName
        let label2 = UILabel(frame: CGRect(x: cell.frame.width/2, y: 0, width: (cell.frame.width/2 + 40), height: cell.frame.height))
        //label1.text = groupName
        label2.text = groupDate
        label2.textAlignment = .right
        //cell.addSubview(label1)
        cell.addSubview(label2)
        
        
        //cell.textLabel?.text = groupName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        let currentGroupName = currentCell.textLabel?.text
        
        for i in allGroups {
            if ( i.name == currentGroupName )
            {
                var tempGroup = i
                indexOfGroup = allGroups.index(of: tempGroup)
            }
        }
        var secondVC = GroupPageController()
        performSegue(withIdentifier: "homepageToGroupPage" , sender: self )
    }


    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            let alertController = UIAlertController(title: "Delete Group", message: "Are you sure you want to delete this group?", preferredStyle: UIAlertControllerStyle.alert)
            
            
                let yesAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
                UIAlertAction in
                //remove from data source
                allGroups.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath],  with: UITableViewRowAnimation.automatic)
                saveGroups()
                }
            
                alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        //NEVER set this up like this: allGroups = loadGroups()!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





