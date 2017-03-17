//
//  CalculationViewController.swift
//  groupPay
//
//  Created by WEST, CARTER on 3/16/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
internal class CalculationViewController : UIViewController{
    
    @IBOutlet weak var labelOfGroup: UILabel!
   
    @IBOutlet weak var textOfCalculations: UITextView!
    var gotPersonIndex: Int?
    var gotGroupIndex: Int?
    var calculatedList: [Person] = []
    var fullSummary: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        labelOfGroup.text = ((allGroups[gotGroupIndex!].name) + " Calculations")
        var tempList = allGroups[gotGroupIndex!].people
        calculatedList = calculate(groupOfPeople: tempList)
        for i in calculatedList{
           fullSummary = fullSummary + " " + i.toPaySummary
        }
        textOfCalculations.insertText( fullSummary )
    }
}
