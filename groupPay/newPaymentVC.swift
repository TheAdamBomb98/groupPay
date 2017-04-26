
//
//  newPaymentVC.swift
//  groupPay
//
//  Created by ADAM, FORD and CARTER, WEST, and kinda JOE, STROBEL on 2/13/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
import os.log
var groupHasChanged = false
var tag = "Gas"

class newPaymentVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    var gotGroupIndex: Int?
    var gotPersonIndex: Int?
    
    
    
    @IBOutlet weak var enterPerson: UIPickerView!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var enterMoney: UITextField!
    @IBOutlet weak var enterTag: UIPickerView!
    let enterTagPickerData = ["Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    var enterPersonPickerData: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        allGroups = loadGroups()!
        enterTag.tag = 0
        self.enterMoney.keyboardType = UIKeyboardType.decimalPad
        enterTag.dataSource = self
        enterTag.delegate = self
        if enterMoneyAmount != nil{
            enterMoney.text = String(enterMoneyAmount)
            enterMoneyAmount = nil
        }
        var indexofTag = 0
        for i in 0...(enterTagPickerData.count - 1) {
            if enterTagPickerData[i] == tag {
                indexofTag = i
            }
        }
        enterTag.selectRow(indexofTag, inComponent: 0, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    @IBAction func subgroupButton(_ sender: UIButton) {
        enterMoneyAmount = Double(enterMoney.text!)
    }
   
    @IBAction func addPayment(_ sender: AnyObject) {
        var amount = 0.0
        print(enterMoney.text)
        if(enterMoney.text! == ""){
            
        let alertController = UIAlertController(title: "Please Enter an Amount", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            
            amount = ((Double)(enterMoney.text!)!)
            var paymentGroup: [Person] = []
            for x in allGroups[gotGroupIndex!].people {
                paymentGroup.append(x)
            }
            //var paymentGroup = allGroups[gotGroupIndex!].people.map { $0.copy() } as! [Person]
            
            
            /*
            var paymentGroup: [Person] = []//allGroups[gotGroupIndex!]
            for x in allGroups[gotGroupIndex!].people
            {
                paymentGroup.append(x)
            }
 */
            
        let payer = allGroups[gotGroupIndex!].people[gotPersonIndex!]
        
        if( groupHasChanged ) {
            paymentGroup = nonFullGroup
        }
        
        groupHasChanged = false
            
        nonFullGroup = []
        
        let groupAvg = amount / (Double)(paymentGroup.count)
            
        for i in paymentGroup {
            if (i.name == payer.name ) {
                i.currentPlusMinus += ( amount - groupAvg)
            }
            else {
                i.currentPlusMinus -= groupAvg
            }
        }
            
        for paymentGroupPeople in paymentGroup {
            for allGroupPeople in allGroups[gotGroupIndex!].people {
                if paymentGroupPeople.name == allGroupPeople.name {
                    allGroupPeople.currentPlusMinus = paymentGroupPeople.currentPlusMinus
                }
            }
        }
            
        /*
        if ( groupHasNotChanged ){
            let groupAvg = amount / (Double)(group.people.count)
            for i in allGroups[gotGroupIndex!].people {
                if ( i.name == payer.name ) {
                    i.currentPlusMinus += (amount - groupAvg)
                }
                else{
                i.currentPlusMinus += 0.0 - groupAvg
                }
            }
            }
        else {
            let amountOfPeople = (Double)(paymentGroup.count - 1)
            let groupAvg = amount / amountOfPeople
            for nonFull in paymentGroup{
                for full in 0...( allGroups[gotGroupIndex!].people.count - 1 ) {
                    if( nonFull.name == allGroups[gotGroupIndex!].people[full].name ){
                        if( allGroups[gotGroupIndex!].people[full].name == payer.name ){
                            allGroups[gotGroupIndex!].people[full].currentPlusMinus += ( amount - groupAvg )
                        }
                        else {
                            allGroups[gotGroupIndex!].people[full].currentPlusMinus += ( 0.0 - groupAvg )
                        }
                    }
                }
            }
        }
        */
            
            let groupWithNameAndCorrectListOfPeople = Group( date: NSDate() , name: allGroups[gotGroupIndex!].name , people: paymentGroup , transactions: allGroups[gotGroupIndex!].transactions )
        
            let newPay = Receipt( amount: amount, tag: tag , person: payer, group: groupWithNameAndCorrectListOfPeople, date: NSDate(), comment: commentField.text! )
        allGroups[gotGroupIndex!].people[gotPersonIndex!].transactions.append(newPay)
        allGroups[gotGroupIndex!].transactions.append(newPay)
        
        allGroups[gotGroupIndex!].people[gotPersonIndex!].totalPaid += amount
        
        saveGroups()
   
        indexOfPerson = gotPersonIndex
        indexOfGroup = gotGroupIndex
        performSegue(withIdentifier: "paymentToPerson" , sender: self)
        }
    }
    
    

        

    

    //PickerView Functions
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0) {
            return enterTagPickerData.count
        }
        return allGroups[indexOfGroup!].people.count
    }
    
    //MARK: Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( pickerView.tag == 0 ){
            return enterTagPickerData[row]
        }
        return allGroups[indexOfGroup!].people[row].name
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 0) {
            tag = enterTagPickerData[row]
        }
        else {
            tag = enterPersonPickerData[row]
    }
    
}
}
