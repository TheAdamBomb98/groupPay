//
//  receiptClass.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/13/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Receipt: NSObject, NSCoding {
   
    //MARK: Properties
    
    var amount: Double
    var tag: String //Tag will eventually be changed to utilize dictionary
    var person: Person
    var group: Group
    var date: NSDate
    var comment: String
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("receipts")
    
    //MARK: Types
    
    struct PropertyKey {
        static let amount = "amount"
        static let tag = "tag"
        static let person = "person"
        static let group = "group"
        static let date = "date"
        static let comment = "comment"
        }
    
    //MARK: Initialization
    init( amount: Double , tag: String , person: Person , group: Group , date: NSDate , comment: String ){
       
        // Initialize stored properties.
        self.amount = amount
        self.tag = tag
        self.person = person
        self.group = group
        self.date = date
        self.comment = comment
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(amount, forKey: PropertyKey.amount)
        aCoder.encode(tag, forKey: PropertyKey.tag)
        aCoder.encode(person, forKey: PropertyKey.person)
        aCoder.encode(group, forKey: PropertyKey.group)
        aCoder.encode(date, forKey: PropertyKey.date)
        aCoder.encode(comment, forKey: PropertyKey.comment)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        
        
        let amount = aDecoder.decodeDouble(forKey: PropertyKey.amount)
        let tag = aDecoder.decodeObject(forKey: PropertyKey.tag) as! String
        let person = aDecoder.decodeObject(forKey: PropertyKey.person) as! Person
        let group = aDecoder.decodeObject(forKey: PropertyKey.group) as! Group
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! NSDate
        let comment = aDecoder.decodeObject(forKey: PropertyKey.comment) as! String
        
        
        // Must call designated initializer.
        self.init(amount: amount, tag: tag, person: person, group: group, date: date, comment: comment)
    }
}

