//
//  personClass.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/13/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var totalPlusMinus: Double
    var transactions: [Receipt]
    var currentPay: Double
    var currentPlusMinus: Double
    //phoneNumber and email will need to be changed to accomodate for actually sending notifications, Also may need to be optional...
    var phoneNumber: String
    var email: String
    init( name: String , totalPlusMinus: Double , transactions: [Receipt] , currentPay: Double , currentPlusMinus: Double , phoneNumber: String , email: String){
        self.name = name
        self.totalPlusMinus = totalPlusMinus
        self.transactions = transactions
        self.currentPay = currentPay
        self.currentPlusMinus = currentPlusMinus
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
