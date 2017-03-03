
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
    
    var gotGroup: Group?
    var gotGroupIndex: Int?
    var gotPerson: Person?
    var gotPersonIndex: Int?
    
    
    
    @IBOutlet weak var enterName: UILabel!
    @IBOutlet weak var enterMoney: UITextField!
    @IBOutlet weak var enterTag: UIPickerView!
    let pickerData = ["Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    
    var tag = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroups = loadGroups()!
        enterName.text = allGroups[0].people[0].name
        self.enterMoney.keyboardType = UIKeyboardType.numbersAndPunctuation
        
        enterTag.dataSource = self
        enterTag.delegate = self
        
        gotGroup = groupToPass
        gotGroupIndex = indexOfGroup
        gotPerson = personToPass
        gotPersonIndex = indexOfPerson
    }
    
    
    
   
    @IBAction func addPayment(_ sender: AnyObject) {
        var amount = 0.0
        amount = (Double)(enterMoney.text!)!
        let person = allGroups[gotGroupIndex!].people[gotPersonIndex!]
        let group = allGroups[gotGroupIndex!]
        let newPay = Receipt( amount: amount, tag: tag , person: person, group: group )
        allGroups[0].people[0].transactions.append(newPay)
        saveGroups()
        allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.append(newPay)
        personToPass = gotPerson
        indexOfPerson = gotPersonIndex
        groupToPass = gotGroup
        indexOfGroup = gotGroupIndex
        performSegue(withIdentifier: "paymentToPerson" , sender: self)
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
