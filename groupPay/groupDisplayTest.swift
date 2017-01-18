//
//  groupDisplayTest.swift
//  groupPay
//
//  Created by FORD, ADAM on 1/18/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
class groupDisplayTest: UIViewController {
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var personPhoneLabel: UILabel!
    
    @IBOutlet weak var personEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
