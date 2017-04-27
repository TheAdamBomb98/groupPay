//
//  newGroupViewController.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/16/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//


//add a group page

import Foundation
import UIKit
import os.log

internal let zero = 0.0

class newGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var addPersonButton: UIButton!
    
    @IBOutlet weak var finalizeGroupButton: UIButton!
    
    @IBOutlet weak var groupNameField: UITextField!
    
    @IBOutlet weak var TableOfPeople: UITableView!
    //@IBAction func closeOnPopUp(_ sender: AnyObject) {
    //noNameError.isHidden = true
    //}
    /*
    func didChangeText(textField:UITextField)
    {
        let range = Range(uncheckedBounds: (0, textField.text!.characters.count))
        let newString = (phoneField.text! as NSString).replacingCharacters(in: range, with: textField.text)
        let components = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        
        let decimalString = components.joined(separator: "") as NSString
        let length = decimalString.length
        let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
        
        if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
        {
            let newLength = (phoneField.text! as NSString).length + (string as NSString).length - range.length as Int
            
            return (newLength > 10) ? false : true
        }
        var index = 0 as Int
        let formattedString = NSMutableString()
        
        if hasLeadingOne
        {
            formattedString.append("1 ")
            index += 1
        }
        if (length - index) > 3
        {
            let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
            formattedString.appendFormat("(%@)", areaCode)
            index += 3
        }
        if length - index > 3
        {
            let prefix = decimalString.substring(with: NSMakeRange(index, 3))
            formattedString.appendFormat("%@-", prefix)
            index += 3
        }
        
        let remainder = decimalString.substring(from: index)
        formattedString.append(remainder)
        phoneField.text = formattedString as String
    }
 */
    var totalString = 13
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
         if (textField == phoneField)
        {
            let newString = (phoneField.text! as NSString).replacingCharacters(in: range, with: string)
            let components = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.hasPrefix("1")
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
            {
                let newLength = (phoneField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne
            {
                formattedString.append("1")
                index += 1
            }
            if (length - index) > 3
            {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("(%@)", areaCode)
                index += 3
            }
            if length - index > 3
            {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            phoneField.text = formattedString as String
            if (formattedString.length == 13 && !hasLeadingOne){
             
                self.view.endEditing(true)
            }
            if(formattedString.length == 14){
                self.view.endEditing(true)
            }
            return false
        }
        else
        {
            return true
        }
    }
    
    
    //how many sections are in the view
    func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tempPeople.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var PersonName  = tempPeople[indexPath.row].name
        cell.textLabel?.text = PersonName
        return cell
    }
    var tempPeople = [Person]()
    var currentIndex = 0
    @IBAction func addPersonButtonPressed(_ sender: AnyObject) {
        if (nameField?.text == "" || nameField?.text?.characters.first! == " " )
        {
            let alertControllerP = UIAlertController(title: "Please Enter a Name", message: "Try removing a space from the first character", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
            alertControllerP.addAction(okAction)
            self.present(alertControllerP, animated: true, completion: nil)
        }
        if (nameField?.text == "Adam"){
            let imageName = "ben.jpg"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            view.addSubview(imageView)
        }
        else{
            for i in tempPeople{
                if(i.name == nameField?.text){
                    let alertControllerSame = UIAlertController(title: "Please Enter a Unique Name", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let okActionSame = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
                    alertControllerSame.addAction(okActionSame)
                    self.present(alertControllerSame, animated: true, completion: nil)
                    return
                }
                
            }
            let x = Person(name: nameField.text!, totalPlusMinus : zero, transactions: [], totalPaid: 0.0, currentPlusMinus: 0.0, phoneNumber: phoneField.text!, email: emailField.text!, toPaySummary: "", toBePaidSummary: "")
            
            tempPeople.append(x)
            
            currentIndex += 1
            nameField.text = ""
            phoneField.text = ""
            emailField.text = ""
            TableOfPeople.reloadData()

        }
    }
    
    @IBAction func finalizeGroupButtonPressed(_ sender: AnyObject) {
        if (tempPeople.count < 2 && groupNameField.text! == ""){
            let alertController = UIAlertController(title: "Please Enter a Group Name and Add People to Your Group", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
            
        else if(tempPeople.count < 2){
            let alertController1 = UIAlertController(title: "Please Enter People Into Your Group", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction1 = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
            alertController1.addAction(okAction1)
            self.present(alertController1, animated: true, completion: nil)
            
        }
        else if (groupNameField.text! == "")
        {
            let alertController2 = UIAlertController(title: "Please Enter a Group Name", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction2 = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
            alertController2.addAction(okAction2)
            self.present(alertController2, animated: true, completion: nil)
            
        }
        else{
            for i in allGroups{
                if(i.name == groupNameField?.text){
                    let alertControllerSame = UIAlertController(title: "Please Enter a Unique Group Name", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let okActionSame = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel)
                    alertControllerSame.addAction(okActionSame)
                    self.present(alertControllerSame, animated: true, completion: nil)
                    return
                }
            }
            
            let tempReceipts = [Receipt]()
            let newGroup = Group(date: NSDate(), name: groupNameField.text!, people: tempPeople, transactions: tempReceipts)
            allGroups.append(newGroup)
            groupNameField.text = ""
            
            saveGroups()
            
            indexOfGroup = allGroups.index(of: newGroup)
            performSegue(withIdentifier: "newGroupToGroupPage", sender: self)
            
        }
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //var secondVC: GroupPageController = segue.destination as! GroupPageController
        //secondVC.recievedGroup = allGroups[allGroups.count - 1]
        if allGroups.count != 0{
        groupToPass = allGroups[allGroups.count - 1]
    }
    */


    //private functions

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}


