//
//  newGroupViewController.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/16/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//
import Foundation
import UIKit
var allGroups = [Group]()
class newGroupViewController: UIViewController {
    //var tempPeople: [Person]
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var addPersonButton: UIButton!

    @IBOutlet weak var noNameError: UIView!

    @IBOutlet weak var finalizeGroupButton: UIButton!
    
    @IBOutlet weak var groupNameField: UITextField!
    
    @IBOutlet weak var TableofPeople: UITableView!
    //@IBAction func closeOnPopUp(_ sender: AnyObject) {
    //noNameError.isHidden = true
    //}
    
    
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tempPeople.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var personName = tempPeople[indexPath.row]
        cell.textLabel?.text = personName.name
        return cell
    }
    
    var tempPeople = [Person]()
    var currentIndex = 0
    @IBAction func addPersonButtonPressed(_ sender: AnyObject) {


            
            let x = Person(name: nameField.text!, totalPlusMinus: 0.0, transactions: [], currentPay: 0, currentPlusMinus: 0, phoneNumber: phoneField.text!, email: emailField.text!)
        
        tempPeople.append(x)
        
        currentIndex += 1
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
        
    }
    func refresh(_ refreshControl: UIRefreshControl) {
        // Do your job, when done:
        refreshControl.endRefreshing()
    }
    
    @IBAction func finalizeGroupButtonPressed(_ sender: AnyObject) {
        let tempReceipts = [Receipt]()
        let x = Group(name: groupNameField.text!, person: tempPeople, transactions: tempReceipts)
        allGroups.append(x)
        groupNameField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noNameError.isHidden = true
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for:.valueChanged)
        if #available(iOS 10.0, *) {
            TableofPeople.refreshControl = refreshControl
        } else {
            TableofPeople.backgroundView = refreshControl
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

