//
//  viewControllerThree.swift LOL at Joe's naming
//  groupPay
//
//  Created by STROBEL, JOSEPH on 1/9/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation
import UIKit

class GroupPageController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var recievedGroup: Group?
    
    @IBOutlet var peopleTable: UITableView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.white
        //cell.label?.text = recievedGroup?.name
        return cell
    }
   /* func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 100, left: 5, bottom: 100, right: 5)
    }
   */
    //how many sections are in the view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recievedGroup!.people.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var personName  = recievedGroup?.people[indexPath.row].name
        cell.textLabel?.text = personName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        let currentPersonName = currentCell.textLabel?.text
        
        for i in (recievedGroup?.people)! {
            if ( i.name == currentPersonName )
            {
                personToPass = i
            }
        }
        performSegue(withIdentifier: "groupPageToPersonPage" , sender: self )
    }
    
    

    override func viewDidLoad() {
        //var flowLayout = UICollectionViewFlowLayout()
        
       // let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.black
        
        self.view.addSubview(collectionView)
    
        recievedGroup = groupToPass
        groupNameLabel.text = recievedGroup?.name
    }
 
    
}
