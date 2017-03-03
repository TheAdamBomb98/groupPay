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
    
    var gotPerson: Person?
    var gotPersonIndex: Int?
    var gotGroup: Group?
    var gotGroupIndex: Int?
    
    
    
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var makePaymentButton: UIButton!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label?.text = gotPerson?.name
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    
    @IBAction func makePaymentButtonPressed(_ sender: AnyObject) {
        personToPass = gotPerson
        indexOfPerson = gotPersonIndex
        groupToPass = gotGroup
        indexOfGroup = gotGroupIndex
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
        gotGroup = groupToPass
        gotGroupIndex = indexOfGroup
        gotPerson = personToPass
        gotPersonIndex = indexOfPerson
        personLabel.text = gotPerson?.name

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
