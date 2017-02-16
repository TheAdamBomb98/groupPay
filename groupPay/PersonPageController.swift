//
//  PersonPageController.swift
//  groupPay
//
//  Created by STROBEL, JOSEPH on 2/7/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class PersonPageController: UIViewController {
    
    var receivedPerson: Person?
    
    @IBOutlet weak var personLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.reloadData()
        //allGroups = loadGroups()!
        // Do any additional setup after loading the view, typically from a nib.
        receivedPerson = personToPass
        personLabel.text = receivedPerson?.name
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
