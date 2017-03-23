
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
var groupHasNotChanged = true
class newPaymentVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    var gotGroupIndex: Int?
    var gotPersonIndex: Int?
    
    
    
    @IBOutlet weak var enterName: UILabel!
    @IBOutlet weak var enterMoney: UITextField!
    @IBOutlet weak var enterTag: UIPickerView!
    let pickerData = ["Gas","Breakfast","Lunch","Dinner","Food","Snacks","Hotel","Tickets","Other"]
    
    var tag = "Gas"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        allGroups = loadGroups()!
        enterName.text = allGroups[gotGroupIndex!].people[gotPersonIndex!].name
        self.enterMoney.keyboardType = UIKeyboardType.decimalPad
        
        enterTag.dataSource = self
        enterTag.delegate = self
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        else{
            
        
        amount = ((Double)(enterMoney.text!)!)
        let group = allGroups[gotGroupIndex!]
        let person = allGroups[gotGroupIndex!].people[gotPersonIndex!]
            
        if ( nonFullGroup.count == group.people.count){
            let groupAvg = amount / 4.0
            for i in allGroups[gotGroupIndex!].people {
                if ( i.name == person.name ) {
                    i.currentPlusMinus += (amount - groupAvg)
                }
                else{
                i.currentPlusMinus = 0.0 - groupAvg
                }
            }
            }
        else {
            let amountOfPeople = (Double)(nonFullGroup.count)
            let groupAvg = amount / amountOfPeople
            for nonFull in nonFullGroup{
                for full in 0...( allGroups[gotGroupIndex!].people.count - 1 ) {
                    if( nonFull.name == allGroups[gotGroupIndex!].people[full].name ){
                        if( allGroups[gotGroupIndex!].people[full].name == person.name ){
                            allGroups[gotGroupIndex!].people[full].currentPlusMinus += ( amount - groupAvg )
                        }
                        else {
                            allGroups[gotGroupIndex!].people[full].currentPlusMinus += ( 0.0 - groupAvg )
                        }
                    }
                }
            }
        }
            
        
        let newPay = Receipt( amount: amount, tag: tag , person: person, group: group )
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
