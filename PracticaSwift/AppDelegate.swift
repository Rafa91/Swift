//
//  AppDelegate.swift
//  PracticaSwift
//
//  Created by Rafael Navarro on 13/5/15.
//  Copyright (c) 2015 Rafa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var def = NSUserDefaults.standardUserDefaults()
        var object : Int? = def.integerForKey(LAST_CHARACTER_SELECTED_SECTION)
        if let objc = object{
            
        }else{
            def.setInteger(0, forKey: LAST_CHARACTER_SELECTED_SECTION)
            def.setInteger(0, forKey: LAST_CHARACTER_SELECTED_ROW)
            def.synchronize()
        }
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let universe = RNOStarWarsUniverse()
        
        if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad){
            self.configureForPad(universe)
        }else{
            self.configureForPhone(universe)
        }
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func configureForPad(model: RNOStarWarsUniverse){
        var uVC = RNOUniverseTableViewController(model: model, style: UITableViewStyle.Plain)
        var charVC = RNOCharacterViewController(model: self.lastSelectedCharacterInModel(model))
        var uNav = UINavigationController(rootViewController: uVC)
        var cNav = UINavigationController(rootViewController: charVC)
        var splitVC = UISplitViewController()
        splitVC.viewControllers=[uNav, cNav]
        splitVC.delegate = charVC
        uVC.delegate = charVC
        self.window?.rootViewController = splitVC
    }
    
    func configureForPhone(model: RNOStarWarsUniverse){
        
        var uVC = RNOUniverseTableViewController(model: model, style: UITableViewStyle.Plain)
        var navVC = UINavigationController(rootViewController: uVC)
        uVC.delegate=uVC
        self.window?.rootViewController = navVC
        
    }
    
    func lastSelectedCharacterInModel(universe: RNOStarWarsUniverse) -> RNOStarWarsCharacter{
        
        var def  = NSUserDefaults.standardUserDefaults()
        var section: Int = def.integerForKey(LAST_CHARACTER_SELECTED_SECTION)
        var pos: Int = def.integerForKey(LAST_CHARACTER_SELECTED_ROW)
        var character : RNOStarWarsCharacter
        if (section  == IMPERIAL_SECTION){
            character = universe.imperialAtIndex(pos)
        }else{
            character = universe.rebelAtIndex(pos)
        }
        
        return character
        
    }


}

