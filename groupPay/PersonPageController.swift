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
    
    @IBOutlet weak var plusMinusLabel: UILabel!
    
    @IBOutlet weak var totalPaidLabel: UILabel!
    
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
        let comment = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions[indexPath.row].comment
        
        cell.textLabel?.text = tag
        
        let price = allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions[indexPath.row].amount
        let label1 = UILabel(frame: CGRect(x: cell.frame.width/2, y: 0, width: (cell.frame.width/2 + 40), height: cell.frame.height))
        let label2 = UILabel(frame: CGRect(x: cell.frame.width/3, y: 0, width: (cell.frame.width/2 + 40), height: cell.frame.height))
        
        let priceD = "$" + String(price)
        
        label1.text = priceD
        label1.textAlignment = .right
        
        label2.text = comment
        label2.textAlignment = .left
        
        cell.addSubview(label1)
        cell.addSubview(label2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            let currentTrans =  allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions[indexPath.row]
            let payer = currentTrans.person
            let tempPaymentGroup = currentTrans.group
            var paymentGroup: [Person] = []
            let amount = currentTrans.amount
            let transDate = currentTrans.date
            allGroups[gotGroupIndex!].people[gotPersonIndex!].totalPaid -= amount
            for i in tempPaymentGroup.people {
                paymentGroup.append(i)
            }
            
            
            let groupAvg = amount / (Double)(paymentGroup.count)
            
            for i in paymentGroup {
                if (i.name == payer.name ) {
                    i.currentPlusMinus -= ( amount - groupAvg)
                }
                else {
                    i.currentPlusMinus += groupAvg
                }
            }
            
            for paymentGroupPeople in paymentGroup {
                for allGroupPeople in allGroups[gotGroupIndex!].people {
                    if paymentGroupPeople.name == allGroupPeople.name {
                        allGroupPeople.currentPlusMinus = paymentGroupPeople.currentPlusMinus
                    }
                }
            }
            totalPaidLabel.text = "$" + (String)((Double)((Int)(allGroups[gotGroupIndex!].people[gotPersonIndex!].totalPaid * 100) ) / 100)
            if ( allGroups[gotGroupIndex!].people[gotPersonIndex!].currentPlusMinus > 0) {
                plusMinusLabel.text = "+" + (String)((Double)((Int)(allGroups[gotGroupIndex!].people[gotPersonIndex!].currentPlusMinus * 100)) / 100 )
            }
            else {
                plusMinusLabel.text = (String)((Double)((Int)(allGroups[gotGroupIndex!].people[gotPersonIndex!].currentPlusMinus * 100)) / 100)
            }
                allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.remove(at: indexPath.row)
            for i in 0...(allGroups[gotGroupIndex!].transactions.count - 1) {
                if ((allGroups[gotGroupIndex!].transactions[i].date).isEqual(to: transDate as Date)) {
                    allGroups[gotGroupIndex!].transactions.remove(at: i)
                    break
                }
            }
            //DELETE FROM THE GROUP ARRAY OF TRANSACTIONS TOO
            tableView.deleteRows(at: [indexPath],  with: UITableViewRowAnimation.automatic)
            saveGroups()
        }
    }
    
    @IBAction func makePaymentButtonPressed(_ sender: AnyObject) {
        indexOfPerson = gotPersonIndex
        indexOfGroup = gotGroupIndex
        defaultPayer = allGroups[gotGroupIndex!].people[gotPersonIndex!]
        performSegue(withIdentifier: "personToPayment" , sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        personNameTag.text = allGroups[gotGroupIndex!].people[gotPersonIndex!].name
        tag = "Gas"
        totalPaidLabel.text = "$" + (String)((Double)((Int)(allGroups[gotGroupIndex!].people[gotPersonIndex!].totalPaid * 100) ) / 100)
        if ( allGroups[gotGroupIndex!].people[gotPersonIndex!].currentPlusMinus > 0) {
            plusMinusLabel.text = "+" + (String)((Double)((Int)(allGroups[gotGroupIndex!].people[gotPersonIndex!].currentPlusMinus * 100)) / 100 )
        }
        else {
        plusMinusLabel.text = (String)((Double)((Int)(allGroups[gotGroupIndex!].people[gotPersonIndex!].currentPlusMinus * 100)) / 100)
        }
        greenOrRed = []
        //allGroups = loadGroups()!
        // Do any additional setup after loading the view, typically from a nib.

        ///*label in tableview*/ = gotPerson?.name

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
