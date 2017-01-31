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
