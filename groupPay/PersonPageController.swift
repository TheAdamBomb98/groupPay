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
    
    @IBOutlet weak var personNameTag: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewTag: UITableView!
   
    @IBOutlet weak var tableViewPrice: UITableView!
    
    @IBOutlet weak var makePaymentButton: UIButton!
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        count = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.count
        
    return count!
    }
        
    
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tag = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions[indexPath.row].tag
        cell.textLabel?.text = tag
        let price = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions[indexPath.row].amount
        let label1 = UILabel(frame: CGRect(x: cell.frame.width/2, y: 0, width: (cell.frame.width/2 + 40), height: cell.frame.height))
        let priceD = "$" + String(price)
        label1.text = priceD
        label1.textAlignment = .right
        cell.addSubview(label1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],  with: UITableViewRowAnimation.automatic)
            saveGroups()
        }
    }
    
    @IBAction func makePaymentButtonPressed(_ sender: AnyObject) {
        indexOfPerson = gotPersonIndex
        indexOfGroup = gotGroupIndex
        performSegue(withIdentifier: "personToPayment" , sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        personNameTag.text = allGroups[gotGroupIndex!].people[gotPersonIndex!].name
        
        //allGroups = loadGroups()!
        // Do any additional setup after loading the view, typically from a nib.

        ///*label in tableview*/ = gotPerson?.name

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
