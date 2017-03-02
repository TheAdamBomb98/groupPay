//
//  global.swift
//  groupPay
//
//  Created by FORD, ADAM on 1/31/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
import os.log
var groupToPass: Group!
var indexOfGroup: Int!
var personToPass: Person!
var indexOfPerson: Int!
//SAVING FUNCTIONS AND DECLARATION

internal var allGroups: [groupPay.Group] = []

func saveGroups() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(allGroups, toFile: Group.ArchiveURL.path)
    if isSuccessfulSave {
        os_log("Groups successfully saved.", log: OSLog.default, type: .debug)
    } else {
        os_log("Failed to save groups...", log: OSLog.default, type: .error)
    }
}

func loadGroups() -> [Group]? {
    return NSKeyedUnarchiver.unarchiveObject(withFile: Group.ArchiveURL.path) as? [Group]
    
}

func calculate( groupOfPeople: [Person] ) -> [Person] {
    var peopleList = groupOfPeople
    var peopleThatAreDone: [Person] = []
    while( peopleList.count > 1 ) {
        //DOUBLE CHECK THIS
        //I think it might be sorting the wrong direction
        peopleList.sorted(by: { $0.totalPlusMinus > $1.totalPlusMinus})
        let payFromLowest = peopleList[0].totalPlusMinus
        peopleList[0].toPaySummary = "You will pay $" + String(payFromLowest) + " to " + peopleList[(peopleList.count - 1)].name + "."
        if ( peopleList[(peopleList.count - 1)].name.characters.count == 0 ){
            peopleList[(peopleList.count - 1)].toBePaidSummary = "You will be paid $" + String(payFromLowest) + " by " + peopleList[0].name + "."
        }
        else {
            peopleList[(peopleList.count - 1)].toBePaidSummary += " You will also be paid $" + String(payFromLowest) + " by " + peopleList[0].name + "."
        }
        peopleList[0].totalPlusMinus = 0
        peopleList[(peopleList.count - 1)].totalPlusMinus = peopleList[(peopleList.count - 1)].totalPlusMinus + payFromLowest
        for i in 0...(peopleList.count - 1) {
            if( peopleList[i].totalPlusMinus == 0 ){
                peopleThatAreDone.append(peopleList[i])
                peopleList.remove(at: i)
            }
        }
    }
    return peopleThatAreDone
}
