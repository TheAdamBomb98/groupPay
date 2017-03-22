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
        return cell
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
