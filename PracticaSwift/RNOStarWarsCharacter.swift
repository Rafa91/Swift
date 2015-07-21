//
//  RNOStarWarsCharacter.swift
//  PracticaSwift
//
//  Created by Rafael Navarro on 13/5/15.
//  Copyright (c) 2015 Rafa. All rights reserved.
//

import Foundation
import UIKit

class RNOStarWarsCharacter {
    var name : String = ""
    var alias : String =  ""
    var wikiURL : NSURL?
    var soundData : NSData?
    var photo : UIImage?
    
    
    init(){}
    
    convenience init(name : String, alias : String, url : NSURL?, soundData : NSData?, photo : UIImage?){
        self.init()
        self.name = name
        self.alias = alias
        self.wikiURL = url
        self.soundData = soundData
        self.photo = photo
    }
    
    convenience init(alias : String, url : NSURL?, soundData : NSData?, photo : UIImage?){
        self.init()
        self.alias = alias
        self.wikiURL = url
        self.soundData = soundData
        self.photo = photo     
    }
    
    
}
