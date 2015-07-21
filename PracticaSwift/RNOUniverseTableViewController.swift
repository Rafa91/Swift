//
//  RNOUniverseTableViewController.swift
//  PracticaSwift
//
//  Created by Rafael Navarro on 20/7/15.
//  Copyright (c) 2015 Rafa. All rights reserved.
//

import UIKit

let IMPERIAL_SECTION = 0
let REBEL_SECTION = 1
let LAST_CHARACTER_SELECTED_SECTION = "lastCharacterSection"
let LAST_CHARACTER_SELECTED_ROW = "lastCharacterRow"
let CELL_ID = "cellId"

protocol RNOUniverseTableViewControllerDelegate{
    
    func universeTableViewController(tvc: UITableViewController, selectedCharacter: RNOStarWarsCharacter)
    
}

class RNOUniverseTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, RNOUniverseTableViewControllerDelegate {

    var model = RNOStarWarsUniverse()
    var delegate : RNOUniverseTableViewControllerDelegate?
    
    convenience init(model: RNOStarWarsUniverse, style: UITableViewStyle){
        self.init(style: style)
        self.model = model
        self.title = "Star Wars Universe"
        
    }
    
    func universeTableViewController(tvc: UITableViewController, selectedCharacter: RNOStarWarsCharacter) {
        
        var charVC = RNOCharacterViewController(model: selectedCharacter)
        self.navigationController?.pushViewController(charVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == IMPERIAL_SECTION){
            return self.model.imperialCount
        }else{
            return self.model.rebelCount
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell? = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CELL_ID)
        
//        if let c = cell{
//            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: CELL_ID)
//        }
        
        var character : RNOStarWarsCharacter?
        
        if (indexPath.section == IMPERIAL_SECTION){
            character = self.model.imperialAtIndex(indexPath.row)
        }else{
            character = self.model.rebelAtIndex(indexPath.row)
        }
        
        cell?.imageView?.image = character?.photo
        cell?.textLabel?.text = character?.alias
        cell?.detailTextLabel?.text = character?.name
        
        
        return cell!
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == IMPERIAL_SECTION){
            return "Imperials"
        }else{
            return "Rebels"
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var character : RNOStarWarsCharacter?
        
        if (indexPath.section == IMPERIAL_SECTION){
            character = self.model.imperialAtIndex(indexPath.row)
        }else{
            character = self.model.rebelAtIndex(indexPath.row)
        }
        
        if let delegate = self.delegate, let charac = character{
            delegate.universeTableViewController(self, selectedCharacter: charac)
        }
        
        var nc = NSNotificationCenter.defaultCenter()
        var dic : NSDictionary
        var n : NSNotification
        if let charac = character{
            dic = [CHARACTER_KEY: charac]
            n = NSNotification(name: CHARACTER_DID_CHANGE_NOTIFICATION_NAME, object: self, userInfo: dic as [NSObject : AnyObject] )
            nc.postNotification(n)
        }
        
        var def = NSUserDefaults.standardUserDefaults()
        def.setInteger(indexPath.section, forKey: LAST_CHARACTER_SELECTED_SECTION)
        def.setInteger(indexPath.row, forKey: LAST_CHARACTER_SELECTED_ROW)
        def.synchronize()
        
    }

}
