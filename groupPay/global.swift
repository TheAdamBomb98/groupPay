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
var indexOfGroup: Int!
var indexOfPerson: Int!
var calculationsSummary: [String] = []
var nonFullGroup: [Person] = []
var phoneNums = [String]()
var enterMoneyAmount: Double!
//var tags = [String]()
//SAVING FUNCTIONS AND DECLARATION

internal var allGroups: [groupPay.Group] = []

func removeAllButNumbersFromString(text: String) -> String {
    let okayChars : Set<Character> =
        Set("0123456789".characters)
    return String(text.characters.filter {okayChars.contains($0) })
}
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
    //Users/758743/Desktop/MAD/groupPay/groupPay
}

func absoluteValue(number: Double)-> Double {
    var number1 = number
    if( number1 < 0 ) {
        number1 = number1 * -1.0
    }
    return number1
}


func calculate( groupOfPeople: [Person] ) -> [Person] {
    var peopleList = groupOfPeople
    var peopleThatAreDone: [Person] = []
    //REMOVED to allow tesing on calculating plus minus without it
    /*
    var groupTotal = 0.0
    for i in peopleList {
        groupTotal += i.totalPaid
    }
    let groupTotalAvg = groupTotal / (Double)(peopleList.count)
    for i in peopleList {
        i.totalPlusMinus = i.totalPaid - groupTotalAvg
    }
    */
    for i in peopleList {
        i.totalPlusMinus = i.currentPlusMinus
    }
    while( peopleList.count > 1 ) {
        //DOUBLE CHECK THIS
        //I think it might be sorting the wrong direction
        //peopleList.sorted(by: { $1.totalPlusMinus > $0.totalPlusMinus})
        peopleList = peopleList.sorted(by: { $0.totalPlusMinus < $1.totalPlusMinus })
        //More efficient to check all immediately???
        if (peopleList[0].totalPlusMinus < 0.01 && peopleList[0].totalPlusMinus > -0.01){
            break
        }
        let realPayFromLowest = peopleList[0].totalPlusMinus
        let displayPayFromLowest = (String) (absoluteValue( number: (round(peopleList[0].totalPlusMinus * 100) / 100) ))
        let payerName = peopleList[0].name
        let toBePaidName = peopleList[(peopleList.count - 1)].name
        peopleList[0].toPaySummary = "You will pay $" + String(displayPayFromLowest) + " to " + toBePaidName + "."
        
        if ( peopleList[(peopleList.count - 1)].toBePaidSummary.characters.count == 0 ){
            peopleList[(peopleList.count - 1)].toBePaidSummary = "You will be paid $" + String(displayPayFromLowest) + " by " + payerName + "."
        }
        else {
            peopleList[(peopleList.count - 1)].toBePaidSummary += " You will also be paid $" + String(displayPayFromLowest) + " by " + payerName + "."
        }
        
        
        calculationsSummary.append( payerName + " pays " + displayPayFromLowest + " to " + toBePaidName + "." )
        
        peopleList[0].totalPlusMinus = 0
        peopleList[(peopleList.count - 1)].totalPlusMinus = peopleList[(peopleList.count - 1)].totalPlusMinus + realPayFromLowest
        for i in 0...(peopleList.count - 1)  {
            if( peopleList[i].totalPlusMinus < 0.01 ){
                peopleThatAreDone.append(peopleList[i])
                peopleList.remove(at: i)
                break
            }
        }
    }
    return peopleThatAreDone
}
