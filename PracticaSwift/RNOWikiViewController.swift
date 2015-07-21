//
//  RNOWikiViewController.swift
//  PracticaSwift
//
//  Created by Rafael Navarro on 20/7/15.
//  Copyright (c) 2015 Rafa. All rights reserved.
//

import UIKit

let CHARACTER_DID_CHANGE_NOTIFICATION_NAME = "characterDidChangeNotification"
let CHARACTER_KEY = "characterKey"

class RNOWikiViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var browser: UIWebView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    var model = RNOStarWarsCharacter()
    var canLoad = true
    
    convenience init(model : RNOStarWarsCharacter){
        self.init(nibName: "RNOWikiViewController", bundle: NSBundle.mainBundle())
        self.model = model
        self.title = "Wikipedia"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "notifyThatCharacterDidChange:", name: CHARACTER_DID_CHANGE_NOTIFICATION_NAME, object:nil)
        self.edgesForExtendedLayout = UIRectEdge.None
        self.syncWithModel()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.browser?.delegate=self
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicator?.stopAnimating()
        self.activityIndicator?.hidden = true
        
        self.canLoad = false
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return self.canLoad
    }
    
    
    func notifyThatCharacterDidChange(notification : NSNotification){
        
        if let character = notification.userInfo?[CHARACTER_KEY] as? RNOStarWarsCharacter{
            self.model = character
            self.syncWithModel()
        }
        
    }

    func syncWithModel(){
        self.canLoad = true
        self.activityIndicator?.hidden = false
        self.activityIndicator?.startAnimating()
        if let url = self.model.wikiURL{
            
            self.browser?.loadRequest(NSURLRequest(URL: url))
        }
        
    }
    
}
