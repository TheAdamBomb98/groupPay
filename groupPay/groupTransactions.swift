//
//  groupTransactions.swift
//  groupPay
//
//  Created by WEST, CARTER on 5/1/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
var groupTransactionsTag = "All Tags"
class groupTransactions: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickCategory: UIPickerView!
    @IBOutlet weak var tableOfPayments: UITableView!
    let enterTagPickerData = ["All Tags", "Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    @IBOutlet weak var tagChooser: UIPickerView!
    var receipts: [Receipt] = []
    
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
        groupTransactionsTag = enterTagPickerData[row]
        
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
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
    
}
