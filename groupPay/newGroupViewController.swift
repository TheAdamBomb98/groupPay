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

class newGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        
        
        
        let x = Person(name: nameField.text!, totalPlusMinus : zero, transactions: [], currentPay: 0.0, currentPlusMinus: 0.0, phoneNumber: phoneField.text!, email: emailField.text!)
        
        tempPeople.append(x)
        
        currentIndex += 1
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
        TableOfPeople.reloadData()
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
        self.emailField.keyboardType = UIKeyboardType.emailAddress
        self.phoneField.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! groupDisplayTest
    }
    
    
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

