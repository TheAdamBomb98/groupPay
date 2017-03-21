//
//  CalculationViewController.swift
//  groupPay
//
//  Created by WEST, CARTER on 3/16/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
internal class CalculationViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var labelOfGroup: UILabel!
   
    @IBOutlet weak var tableOfCalculations: UITableView!
    
    var gotPersonIndex: Int?
    var gotGroupIndex: Int?
    var calculatedList: [Person] = []
    var fullSummary: String = ""
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return calculationsSummary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text =   calculationsSummary[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        labelOfGroup.text = ((allGroups[gotGroupIndex!].name) + " Calculations")
        var tempList = allGroups[gotGroupIndex!].people
        calculationsSummary = []
        calculatedList = calculate(groupOfPeople: tempList)
    }
}
