//
//  groupTransactions.swift
//  groupPay
//
//  Created by WEST, CARTER on 5/1/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class groupTransactions: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var pickCategory: UIPickerView!
    @IBOutlet weak var tableOfPayments: UITableView!
    
    
    override func viewDidLoad() {
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
    
}
