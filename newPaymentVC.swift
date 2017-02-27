
//
//  newPaymentVC.swift
//  groupPay
//
//  Created by BLANCHARD, JENNIFER on 2/13/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
import os.log

class newPaymentVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    var receivedPerson: Person?
    
    @IBOutlet weak var enterName: UILabel!
    @IBOutlet weak var enterMoney: UITextField!
    @IBOutlet weak var enterTag: UIPickerView!
    @IBOutlet weak var payersName: UILabel!
    let pickerData = ["Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    
    var tag = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroups = loadGroups()!
        enterName.text = receivedPerson?.name
        self.enterMoney.keyboardType = UIKeyboardType.numbersAndPunctuation
        
        enterTag.dataSource = self
        enterTag.delegate = self
        
        receivedPerson = personToPass
        payersName.text = receivedPerson?.name
    }
    
    
    
   
    @IBAction func addPayment(_ sender: AnyObject) {
        var amount = 0.0
        amount = (Double)(enterMoney.text!)!
        let person = allGroups[0].people[0]
        let group = allGroups[0]
        
        let newPay = Receipt( amount: amount, tag: tag , person: person, group: group )
        allGroups[0].people[0].transactions.append(newPay)
        saveGroups()
    }
    
    //PickerView Functions
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tag = pickerData[0]
    }
    
}
