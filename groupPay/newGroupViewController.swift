//
//  newGroupViewController.swift
//  groupPay
//
//  Created by FORD, ADAM on 12/16/16.
//  Copyright © 2016 FORD, ADAM. All rights reserved.
//
import Foundation
import UIKit

class newGroupViewController: UIViewController {
    //var tempPeople: [Person]
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var addPersonButton: UIButton!

    @IBOutlet weak var noNameError: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        noNameError.isHidden = true
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
