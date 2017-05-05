//
//  groupTransactions.swift
//  groupPay
//
//  Created by WEST, CARTER on 5/1/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
class groupTransactions: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var pickCategory: UIPickerView!
    @IBOutlet weak var tableOfPayments: UITableView!
    let enterTagPickerData = ["All Tags", "Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    @IBOutlet weak var tagChooser: UIPickerView!
    var receipts: [Receipt] = []
    var gotGroupIndex: Int?
    var groupTransactionsTag = "All Tags"
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return enterTagPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return enterTagPickerData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        receipts.removeAll()
        groupTransactionsTag = enterTagPickerData[row]
        if (groupTransactionsTag == ("All Tags")){
            receipts = allGroups[gotGroupIndex!].transactions
        }
        else{
        for i in allGroups[gotGroupIndex!].transactions{
            var currentTag = i.tag
            if(groupTransactionsTag == currentTag){
                receipts.append(i)
            }
        }
        tableOfPayments.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return receipts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        
        let tag = receipts[indexPath.row].tag
        let comment = receipts[indexPath.row].comment
        
        cell.textLabel?.text = tag
        
        let price = receipts[indexPath.row].amount
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

    
    
    
    
    
    
   /* public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return enterTagPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return enterTagPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inCompononet component: Int) {
        groupTransactionsTag = enterTagPickerData[row]
    }
    */
    override func viewDidLoad() {
        gotGroupIndex = indexOfGroup
        receipts = allGroups[gotGroupIndex!].transactions
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
    
}
