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

//goal
var allGroups = [Group]()
let zero = 0.0

class newGroupViewController: UIViewController {
    //var tempPeople: [Person]
    
    var addMe: Group?
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var addPersonButton: UIButton!
    
    @IBOutlet weak var noNameError: UIView!
    
    @IBOutlet weak var finalizeGroupButton: UIButton!
    
    @IBOutlet weak var groupNameField: UITextField!
    
    //@IBAction func closeOnPopUp(_ sender: AnyObject) {
    //noNameError.isHidden = true
    //}
    
    var tempPeople = [Person]()
    var currentIndex = 0
    @IBAction func addPersonButtonPressed(_ sender: AnyObject) {
        
        
        
        let x = Person(name: nameField.text!, totalPlusMinus : zero, transactions: [], currentPay: 0.0, currentPlusMinus: 0.0, phoneNumber: phoneField.text!, email: emailField.text!)
        
        tempPeople.append(x)
        
        currentIndex += 1
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
        
    }
    
    @IBAction func finalizeGroupButtonPressed(_ sender: AnyObject) {
        let tempReceipts = [Receipt]()
        let addMe = Group(name: groupNameField.text!, person: tempPeople, transactions: tempReceipts)
        allGroups.append(addMe)
        groupNameField.text = ""
        
        saveGroups()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noNameError.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! groupDisplayTest
        if segue.identifier == "addedGroup" {
            if let destinationVC = segue.destination as? groupDisplayTest{
                destinationVC.addMe = addMe
            }
            
        }
    }
    
    
    //private functions
    
    private func saveGroups() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(allGroups, toFile: Group.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Groups successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save groups...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadGroups() -> [Group]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Group.ArchiveURL.path) as? [Group]
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

