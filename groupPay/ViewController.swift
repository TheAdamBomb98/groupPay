//
//  ViewController.swift
//  groupPay
//
//  Created by FORD ADAM, WEST CARTER, STROBEL JOSEPH, BLANCHARD JENNIFER on 12/8/16.
//  Copyright © 2016 FORD ADAM, WEST CARTER, STROBEL JOSEPH,JENNIFER BLANCHARD. All rights reserved.
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
        self.performSegue(withIdentifier: "show", sender: nil)
        
    }
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        _ = segue.destination as! GroupPageController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

