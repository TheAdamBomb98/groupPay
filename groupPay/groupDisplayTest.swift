//
//  groupDisplayTest.swift
//  groupPay
//
//  Created by FORD, ADAM on 1/18/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//


//Test Page

import Foundation
import UIKit
import os.log
class groupDisplayTest: UIViewController {
    
    var count = 0
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var personPhoneLabel: UILabel!
    
    @IBOutlet weak var personEmailLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedGroups = loadGroups(){
            allGroups = savedGroups
        }
        
        groupNameLabel.text = allGroups[0].name
        personNameLabel.text = allGroups[0].person[0].name
        personPhoneLabel.text = allGroups[0].person[0].phoneNumber
        personEmailLabel.text = allGroups[0].person[0].email
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


