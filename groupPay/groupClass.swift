//
//  groupClass.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/8/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class Group {
    var name: String
    var people: [Person]
    var transactions: [Receipt]
    init( name: String , people: [Person] , transactions: [Receipt] ) {
        self.name = name
        self.people = people
        self.transactions = transactions
    }
}
