  //
  //  personClass.swift
  //  groupPay
  //
  //  Created by FORD, ADAM on 12/13/16.
  //  Copyright © 2016 FORD, ADAM. All rights reserved.
  //
  
  import Foundation
  import UIKit
  import os.log
  
  class Person: NSObject, NSCoding {
    
    
    //MARK: Properties
    
    var name: String
    var totalPlusMinus = 0.0
    var transactions: [Receipt]
    var totalPaid = 0.0
    var currentPlusMinus = 0.0
    //phoneNumber and email will need to be changed to accomodate for actually sending notifications
    //Also may need to be optional...
    var phoneNumber: String
    var email: String
    //Adding these to allow for calculating strings
    var toPaySummary: String
    var toBePaidSummary: String
    //var totalPaid = 0.0
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("persons")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let totalPlusMinus = "totalPlusMinus"
        static let transactions = "transactions"
        static let totalPaid = "totalPaid"
        static let currentPlusMinus = "currentPlusMinus"
        static let phoneNumber = "phoneNumber"
        static let email = "email"
        static let toPaySummary = "toPaySummary"
        static let toBePaidSummary = "toBePaidSummary"
        //static let totalPaid = "totalPaid"
    }
    
    //MARK: Initialization
    
    init( name: String , totalPlusMinus: Double , transactions: [Receipt] , totalPaid: Double , currentPlusMinus: Double , phoneNumber: String , email: String, toPaySummary: String, toBePaidSummary: String){
        
        //initalize stored properties
        
        self.name = name
        self.totalPlusMinus = totalPlusMinus
        self.transactions = transactions
        self.totalPaid = totalPaid
        self.currentPlusMinus = currentPlusMinus
        self.phoneNumber = phoneNumber
        self.email = email
        self.toPaySummary = toPaySummary
        self.toBePaidSummary = toBePaidSummary
        //self.totalPaid = totalPaid
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(totalPlusMinus, forKey: PropertyKey.totalPlusMinus)
        aCoder.encode(transactions, forKey: PropertyKey.transactions)
        aCoder.encode(totalPaid, forKey: PropertyKey.totalPaid)
        aCoder.encode(currentPlusMinus, forKey: PropertyKey.currentPlusMinus)
        aCoder.encode(phoneNumber, forKey: PropertyKey.phoneNumber)
        aCoder.encode(email, forKey: PropertyKey.email)
        aCoder.encode(toPaySummary, forKey: PropertyKey.toPaySummary)
        aCoder.encode(toBePaidSummary, forKey: PropertyKey.toBePaidSummary)
        //aCoder.encode(totalPaid, forKey: PropertyKey.totalPaid)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let totalPlusMinus = aDecoder.decodeDouble(forKey: PropertyKey.totalPlusMinus)
        let transactions = aDecoder.decodeObject(forKey: PropertyKey.transactions) as! [Receipt]
        let totalPaid = aDecoder.decodeDouble(forKey: PropertyKey.totalPaid)
        let currentPlusMinus = aDecoder.decodeDouble(forKey: PropertyKey.currentPlusMinus)
        let phoneNumber = aDecoder.decodeObject(forKey: PropertyKey.phoneNumber) as! String
        let email = aDecoder.decodeObject(forKey: PropertyKey.email) as! String
        let toPaySummary = aDecoder.decodeObject(forKey: PropertyKey.toPaySummary) as! String
        let toBePaidSummary = aDecoder.decodeObject(forKey: PropertyKey.toPaySummary) as! String
        //let totalPaid = aDecoder.decodeObject(forKey: PropertyKey.totalPaid) as! Double
        
        
        // Must call designated initializer.
        self.init(name: name, totalPlusMinus: totalPlusMinus, transactions: transactions, totalPaid: totalPaid, currentPlusMinus: currentPlusMinus, phoneNumber: phoneNumber, email: email, toPaySummary: toPaySummary, toBePaidSummary: toBePaidSummary)
        
    }
    
  }
