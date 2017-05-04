//
//  viewControllerThree.swift LOL at Joe's naming
//  groupPay
//
//  Created by STROBEL, JOSEPH on 1/9/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class GroupPageController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    var gotGroupIndex: Int?
    
    
    @IBOutlet weak var makePaymentButton: UIButton!
    
    @IBOutlet var peopleTable: UITableView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var groupTotalLabel: UILabel!
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allGroups[gotGroupIndex!].people.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var personName  = allGroups[gotGroupIndex!].people[indexPath.row].name
        cell.textLabel?.text = personName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        let currentPersonName = currentCell.textLabel?.text
        
        for i in (allGroups[gotGroupIndex!].people) {
            if ( i.name == currentPersonName )
            {
                var tempPerson = i
                indexOfPerson = allGroups[gotGroupIndex!].people.index(of: tempPerson)
            }
        }
        defaultPayer = allGroups[gotGroupIndex!].people[0]
        performSegue(withIdentifier: "groupPageToPersonPage" , sender: self )
    }
    
    @IBAction func exportButtonPressed(_ sender: Any) {
        var groupCSV: CSV
        var groupSum: [[String]] = [[]]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        for i in allGroups[gotGroupIndex!].transactions {
            var subGroupSummary = ""
            if i.group.people.count == allGroups[gotGroupIndex!].people.count {
                subGroupSummary = "All Members Included"
            }
            else {
                for people in i.group.people {
                    subGroupSummary += (people.name + " ")
                }
            }
            let dateString = formatter.string(from: i.date as Date)
            groupSum.append([ dateString, i.person.name, (String)(i.amount), i.tag, i.comment, subGroupSummary])
            
        }
        groupSum.remove(at: 0)
        groupCSV.dataArray = groupSum
        groupCSV.getDataString()
        
        
        let data = groupCSV.fileData.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if let content = data {
            print("NSData: \(content)")
        }
        
        // Generating the email controller.
        func configuredMailComposeViewController() -> MFMailComposeViewController {
            let emailController = MFMailComposeViewController()
            emailController.mailComposeDelegate = self
            emailController.setSubject(allGroups[gotGroupIndex!].name + " Report")
            emailController.setMessageBody("Attatched is the data for " + allGroups[gotGroupIndex!].name) , isHTML: false)
            emailController.setToRecipients(["758743@apps.district196.org"])
            
            // Attaching the .CSV file to the email.
            emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "Round.csv")
            
            return emailController
        }
        
        // If the view controller can send the email.
        // This will show an email-style popup that allows you to enter
        // Who to send the email to, the subject, the cc's and the message.
        // As the .CSV is already attached, you can simply add an email
        // and press send.
        let emailViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(emailViewController, animated: true, completion: nil)
            Swift.print(MFMailComposeViewController.canSendMail())
            /*func mailComposeController(controller: MFMailComposeViewController,
             didFinishWithResult result: MFMailComposeResult, error: NSError?) {
             // Check the result or perform other tasks.
             
             // Dismiss the mail compose view controller.
             controller.dismiss(animated: true, completion: nil)
             }*/
            
        }
    }
    //EXPORTING!!!!
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func makePaymentButtonPressed(_ sender: Any) {
        indexOfPerson = 0
        performSegue(withIdentifier: "makePaymentButtonToNew" , sender: self )
    }
    
    override func viewDidLoad() {
        gotGroupIndex = indexOfGroup
        groupNameLabel.text = allGroups[gotGroupIndex!].name
        var groupTotal = 0.0
        for i in allGroups[gotGroupIndex!].transactions {
            groupTotal += i.amount
        }
        groupTotalLabel.text = "$" + (String)(groupTotal)
        greenOrRed = []
    }
 
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            allGroups[gotGroupIndex!].people.remove(at: indexPath.row)
            allGroups[indexOfGroup].people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],  with: UITableViewRowAnimation.automatic)
            saveGroups()
        
            }*/

        }
    

    

