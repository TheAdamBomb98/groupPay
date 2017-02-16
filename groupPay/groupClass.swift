//
//  groupClass.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/8/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Group: NSObject, NSCoding {
    
    
    //MARK: Properties
    
    var name: String
    var people: [Person]
    var transactions: [Receipt]
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("groups")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let person = "person"
        static let transactions = "transactions"
    }
    
    //MARK: Initialization
    
    init( name: String , person: [Person] , transactions: [Receipt] ) {
        
        // Initialize stored properties.
        self.name = name
        self.people = person
        self.transactions = transactions
        
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(people, forKey: PropertyKey.person)
        aCoder.encode(transactions, forKey: PropertyKey.transactions)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // This makes it fail if it can't decode the name. Keep?
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Group object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let person = aDecoder.decodeObject(forKey: PropertyKey.person)
        
        
        let transactions = aDecoder.decodeObject(forKey: PropertyKey.transactions)
        
        // Must call designated initializer.
        self.init(name: name, person: person as! [Person], transactions: transactions as! [Receipt])
        
    }
}
