//
//  receiptClass.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/13/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//

import Foundation

class Receipt{
    var amount: Double
    //Tag will eventually be changed to utilize dictionary
    var tag: String
    var person: Person
    var group: Group
    init( amount: Double , tag: String , person: Person , group: Group ){
        self.amount = amount
        self.tag = tag
        self.person = person
        self.group = group
    }
}
