
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
    
    var gotGroupIndex: Int?
    var gotPersonIndex: Int?
    
    
    
    @IBOutlet weak var enterName: UILabel!
    @IBOutlet weak var enterMoney: UITextField!
    @IBOutlet weak var enterTag: UIPickerView!
    let pickerData = ["Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    
    var tag = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        allGroups = loadGroups()!
        enterName.text = allGroups[gotGroupIndex!].people[gotPersonIndex!].name
        self.enterMoney.keyboardType = UIKeyboardType.numbersAndPunctuation
        
        enterTag.dataSource = self
        enterTag.delegate = self
        

    }
    
    
    
   
    @IBAction func addPayment(_ sender: AnyObject) {
        var amount = 0.0
        amount = (Double)(enterMoney.text!)!
        //tag = enterTag.description
        //Swift.print(tag)
        let person = allGroups[gotGroupIndex!].people[gotPersonIndex!]
        let group = allGroups[gotGroupIndex!]
        let newPay = Receipt( amount: amount, tag: tag , person: person, group: group )
        allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.append(newPay)
        saveGroups()
        allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.append(newPay)
        
        //allGroups[gotGroupIndex!].people[gotPersonIndex!].totalPaid += amount
        
        allGroups[gotGroupIndex!].transactions.append(newPay)
        
        indexOfPerson = gotPersonIndex
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
        tag = pickerData[row]
    }
    
}
