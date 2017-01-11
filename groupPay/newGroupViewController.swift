//
//  newGroupViewController.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/16/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//
import Foundation
import UIKit

class newGroupViewController: UIViewController {
    //var tempPeople: [Person]
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var addPersonButton: UIButton!

    @IBOutlet weak var noNameError: UIView!

    //@IBAction func closeOnPopUp(_ sender: AnyObject) {
    //noNameError.isHidden = true
    //}
    
    
    @IBAction func addPersonButtonPressed(_ sender: AnyObject) {
        var tempPeople: [Person] = []
        var currentIndex = 0
        tempPeople[currentIndex] = Person(name: nameField.text!, totalPlusMinus: 0.0, transactions: [], currentPay: 0, currentPlusMinus: 0, phoneNumber: phoneField.text!, email: emailField.text!)
        currentIndex += 1
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
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

