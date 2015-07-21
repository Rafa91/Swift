//
//  RNOCharacterViewController.swift
//  PracticaSwift
//
//  Created by Rafael Navarro on 20/7/15.
//  Copyright (c) 2015 Rafa. All rights reserved.
//

import UIKit
import AVFoundation

class RNOCharacterViewController: UIViewController, UISplitViewControllerDelegate, RNOUniverseTableViewControllerDelegate {

    @IBOutlet weak var photoView: UIImageView!
    
    var player : AVAudioPlayer?
    var model : RNOStarWarsCharacter = RNOStarWarsCharacter()
    
    @IBAction func playSound(sender: AnyObject) {
        
                self.player = AVAudioPlayer(data: self.model.soundData!, error: nil)
                self.player?.prepareToPlay()
                self.player?.play()
    }
    @IBAction func wiki(sender: AnyObject) {
        
        var wVC = RNOWikiViewController(model: self.model)
        self.navigationController?.pushViewController(wVC, animated: true)
    }
    

    
    convenience init(model : RNOStarWarsCharacter){
        self.init(nibName: "RNOCharacterViewController", bundle: nil)
        self.model = model
        self.title = model.alias
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.edgesForExtendedLayout = UIRectEdge.None
        self.syncViewWithModel()
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        
    }
    
    
    
    
    
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        if(displayMode == UISplitViewControllerDisplayMode.PrimaryHidden){
            self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
        }else{
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    func universeTableViewController(tvc: UITableViewController, selectedCharacter: RNOStarWarsCharacter) {
        self.model = selectedCharacter
        self.syncViewWithModel()
        
    }
    
    func  syncViewWithModel(){
        self.title = self.model.alias
        self.photoView?.image = self.model.photo
    }
    


}
