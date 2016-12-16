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
    var totalPlusMinus: Double
    var transactions: [Receipt]
    var currentPay: Double
    var currentPlusMinus: Double
    //phoneNumber and email will need to be changed to accomodate for actually sending notifications
    //Also may need to be optional...
    var phoneNumber: String
    var email: String
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("persons")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let totalPlusMinus = "totalPlusMinus"
        static let transactions = "transactions"
        static let currentPay = "currentPay"
        static let currentPlusMinus = "currentPlusMinus"
        static let phoneNumber = "phoneNumber"
        static let email = "email"
    }
    
    //MARK: Initialization
    
    init( name: String , totalPlusMinus: Double , transactions: [Receipt] , currentPay: Double , currentPlusMinus: Double , phoneNumber: String , email: String){
        
        //initalize stored properties
        
        self.name = name
        self.totalPlusMinus = totalPlusMinus
        self.transactions = transactions
        self.currentPay = currentPay
        self.currentPlusMinus = currentPlusMinus
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(totalPlusMinus, forKey: PropertyKey.totalPlusMinus)
        aCoder.encode(transactions, forKey: PropertyKey.transactions)
        aCoder.encode(currentPay, forKey: PropertyKey.currentPay)
        aCoder.encode(currentPlusMinus, forKey: PropertyKey.currentPlusMinus)
        aCoder.encode(phoneNumber, forKey: PropertyKey.phoneNumber)
        aCoder.encode(email, forKey: PropertyKey.email)
    }
    
    //...
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        let name = aDecoder.decodeObject(forKey: PropertyKey.name)
        let totalPlusMinus = aDecoder.decodeObject(forKey: PropertyKey.totalPlusMinus)
        let transactions = aDecoder.decodeObject(forKey: PropertyKey.transactions)
        let currentPay = aDecoder.decodeObject(forKey: PropertyKey.currentPay)
        let currentPlusMinus = aDecoder.decodeObject(forKey: PropertyKey.currentPlusMinus)
        let phoneNumber = aDecoder.decodeObject(forKey: PropertyKey.phoneNumber)
        let email = aDecoder.decodeObject(forKey: PropertyKey.email)
        
        
        // Must call designated initializer.
        self.init(name: name as! String, totalPlusMinus: totalPlusMinus as! Double, transactions: transactions as! [Receipt], currentPay: currentPay as! Double, currentPlusMinus: currentPlusMinus as! Double, phoneNumber: phoneNumber as! String, email: email as! String)
        
    }
  }
