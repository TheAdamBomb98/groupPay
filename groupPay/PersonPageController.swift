//
//  PersonPageController.swift
//  groupPay
//
//  Created by STROBEL, JOSEPH on 2/7/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class PersonPageController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var receivedPerson: Person?
    
    var receivedPersonIndex: Int?
    
    var receivedGroup: Group?
    
    var receivedGroupIndex: Int?
    
    
    
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var makePaymentButton: UIButton!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label?.text = receivedPerson?.name
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    
    @IBAction func makePaymentButtonPressed(_ sender: AnyObject) {
        personToPass = receivedPerson
        indexOfPerson = receivedPersonIndex
        groupToPass = receivedGroup
        indexOfGroup = receivedGroupIndex
        performSegue(withIdentifier: "personToPayment" , sender: self)
        
    }
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "pastTripCollectionToSavedLocationSegue" {
                let newViewController = segue.destinationViewController as! /* controller for editing */
                let indexPath = sender as! NSIndexPath
                let selectedRow: NSManagedObject = locationsList[indexPath.row] as! NSManagedObject
                newViewController./*variable to pass */ = selectedRow as! /*Group*/
            }
        }
    }
 */
    //collection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.reloadData()
        //allGroups = loadGroups()!
        // Do any additional setup after loading the view, typically from a nib.
        receivedPerson = personToPass
        personLabel.text = receivedPerson?.name
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
