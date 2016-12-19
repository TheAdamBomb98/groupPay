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
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("receipts")
    
    //MARK: Types
    
    struct PropertyKey {
        static let amount = "amount"
        static let tag = "tag"
        static let person = "person"
        static let group = "group"
        }
    
    //MARK: Initialization
    init( amount: Double , tag: String , person: Person , group: Group ){
       
        // Initialize stored properties.
        self.amount = amount
        self.tag = tag
        self.person = person
        self.group = group
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(amount, forKey: PropertyKey.amount)
        aCoder.encode(tag, forKey: PropertyKey.tag)
        aCoder.encode(person, forKey: PropertyKey.person)
        aCoder.encode(group, forKey: PropertyKey.group)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        
        
        let amount = aDecoder.decodeObject(forKey: PropertyKey.amount)
        let tag = aDecoder.decodeObject(forKey: PropertyKey.tag)
        let person = aDecoder.decodeObject(forKey: PropertyKey.person)
        let group = aDecoder.decodeObject(forKey: PropertyKey.group)
        
        
        // Must call designated initializer.
        self.init(amount: amount as! Double, tag: tag as! String, person: person as! Person, group: group as! Group)
        
    }
}

