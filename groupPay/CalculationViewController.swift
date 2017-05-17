//
//  CalculationViewController.swift
//  groupPay
//
//  Created by WEST, CARTER on 3/16/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//
import MessageUI
import Foundation
import UIKit
internal class CalculationViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate  {
    
    @IBOutlet weak var labelOfGroup: UILabel!
   
    @IBOutlet weak var tableOfCalculations: UITableView!
    
    var gotPersonIndex: Int?
    var gotGroupIndex: Int?
    var calculatedList: [Person] = []
    var fullSummary: String = ""
    var newPhoneNums: [String] = []
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendText(_ sender: UIButton) {
        newPhoneNums = []
        bodyOfText = ""
        for i in 0...allGroups[gotGroupIndex!].people.count - 1{
            phoneNums.append(allGroups[gotGroupIndex!].people[i].phoneNumber)
        }
        for i in 0...calculationsSummary.count - 1{
            bodyOfText += (calculationsSummary[i] + "\n")
        }
        for i in 0...phoneNums.count - 1{
            newPhoneNums.append(removeAllButNumbersFromString(text: phoneNums[i]))
        }
        if MFMessageComposeViewController.canSendText(){
            let controller = MFMessageComposeViewController()
            controller.body = bodyOfText
            controller.recipients = newPhoneNums
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
        else{
            print("idk")
        }
    }
    
    var data: Data!
    @IBAction func exportGroupButtonPressed(_ sender: Any) {
            var groupSum: [[String]] = [[]]
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            groupSum.append(["Date", "Payer", "Amount", "Tag", "Comment", "Sub-Group Summary"])
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
            var groupCSV = CSV(input: groupSum)
            groupCSV.arrayToData()
            
            
            data = groupCSV.fileData.data(using: String.Encoding.utf8, allowLossyConversion: false)!
    }
            //if let content = data {
                //print("NSData: \(content)")
            //}
            // Generating the email controller.
            func configuredMailComposeViewController() -> MFMailComposeViewController {
                let emailController = MFMailComposeViewController()
                emailController.mailComposeDelegate = self
                emailController.setSubject(allGroups[gotGroupIndex!].name + " Report")
                emailController.setMessageBody(("Attatched is the data for " + allGroups[gotGroupIndex!].name), isHTML: false)
                var emailArray: [String] = []
                for i in allGroups[gotGroupIndex!].people {
                    if (i.email != "") {
                        emailArray.append(i.email)
                    }
                }
                emailController.setToRecipients(emailArray)
                
                // Attaching the .CSV file to the email.
                emailController.addAttachmentData(data, mimeType: "text/csv", fileName: ( allGroups[gotGroupIndex!].name + "Data.csv" ) )
                
                return emailController
            }
    
        /*
            func showSendMailErrorAlert() {
                let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
                sendMailErrorAlert.show()
            }
            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
                controller.dismiss(animated: true, completion: nil)
            }
    */
        // MARK: MFMailComposeViewControllerDelegate Method
        
            // If the view controller can send the email.
            // This will show an email-style popup that allows you to enter
            // Who to send the email to, the subject, the cc's and the message.
            // As the .CSV is already attached, you can simply add an email
            // and press send.
        /*
            let emailViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(emailViewController, animated: true, completion: nil)
                Swift.print(MFMailComposeViewController.canSendMail())
            }
            func mailComposeController(controller: MFMailComposeViewController,
                                       didFinishWithResult result: MFMailComposeResult, error: NSError?) {
                
                switch result {
                    
                case MFMailComposeResult.cancelled:
                    controller.dismiss(animated: true, completion: nil)
                    break
                    
                case MFMailComposeResult.sent:
                    controller.dismiss(animated: true, completion: nil)
                    break
                    
                case MFMailComposeResult.failed:
                    controller.dismiss(animated: true, completion: nil)
                    break
                    
                default:
                    break
                }
                
                controller.dismiss(animated: true, completion: nil)
            }
    */
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return calculationsSummary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text =   calculationsSummary[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gotGroupIndex = indexOfGroup
        gotPersonIndex = indexOfPerson
        labelOfGroup.text = ((allGroups[gotGroupIndex!].name) + " Calculations")
        var tempList = allGroups[gotGroupIndex!].people
        calculationsSummary = []
        calculatedList = calculate(groupOfPeople: tempList)
        
    }
 
}
