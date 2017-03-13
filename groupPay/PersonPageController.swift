//
//  PersonPageController.swift
//  groupPay
//
//  Created by STROBEL, JOSEPH on 2/7/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class PersonPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gotPersonIndex: Int?
    var gotGroupIndex: Int?
    
    @IBOutlet weak var tableViewTag: UITableView!
   
    @IBOutlet weak var tableViewPrice: UITableView!
    
    @IBOutlet weak var makePaymentButton: UIButton!
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tableViewTag {
            return 1
        }
        else {
            return 1
        }
        
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.tableViewTag {
            count = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.count
        }
        if tableView == self.tableViewTag {
            count = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.count
        }
        
    return count!
    }
        
    
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.tableViewTag {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let tag = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions[indexPath.row].tag
            cell?.textLabel?.text = tag
            
        }
        
        if tableView == self.tableViewPrice {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let price = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions[indexPath.row].amount
            cell?.textLabel?.text = (String)(describing: price)
            
        }
        return cell!
    }
    
    
    
    @IBAction func makePaymentButtonPressed(_ sender: AnyObject) {
        indexOfPerson = gotPersonIndex
        indexOfGroup = gotGroupIndex
        performSegue(withIdentifier: "personToPayment" , sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.reloadData()
        //allGroups = loadGroups()!
        // Do any additional setup after loading the view, typically from a nib.
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        ///*label in tableview*/ = gotPerson?.name

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
