//
//  newGroupViewController.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/16/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//
import Foundation
import UIKit
var allGroups = [Group]()
class newGroupViewController: UIViewController {
    //var tempPeople: [Person]
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
    @IBAction func addPersonButtonPressed(_ sender: AnyObject) {

        var currentIndex = 0
            
            let x = Person(name: nameField.text!, totalPlusMinus: 0.0, transactions: [], currentPay: 0, currentPlusMinus: 0, phoneNumber: phoneField.text!, email: emailField.text!)
        
        tempPeople.append(x)
        
        currentIndex += 1
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
    }

    @IBAction func finalizeGroupButtonPressed(_ sender: AnyObject) {
        let tempReceipts = [Receipt]()
        let x = Group(name: groupNameField.text!, person: tempPeople, transactions: tempReceipts)
        allGroups.append(x)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

