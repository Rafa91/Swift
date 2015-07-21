//
//  RNOStarWarsUniverse.swift
//  PracticaSwift
//
//  Created by Rafael Navarro on 13/5/15.
//  Copyright (c) 2015 Rafa. All rights reserved.
//

import Foundation
import UIKit

class RNOStarWarsUniverse {
    
    var rebelCount : Int {
        //a computed getter
        get{
            return self.rebels.count
        }
    }
    var imperialCount : Int{
        //a computed getter
        get{
            return self.imperials.count
        }
    }
    var rebels = [RNOStarWarsCharacter]()
    var imperials = [RNOStarWarsCharacter] ()
    
    init(){
        //Creamos los personajes
        //Vader
        var vaderURL : NSURL? = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")
        var b : NSBundle? = NSBundle.mainBundle()
        var vaderSoundURL : NSURL? = b?.URLForResource("vader", withExtension: "caf")
        var vaderSound : NSData? = NSData(contentsOfURL: vaderSoundURL!)
        var vaderImage : UIImage? = UIImage(named: "darthVader.jpg")
        var vader = RNOStarWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", url: vaderURL, soundData: vaderSound, photo: vaderImage)
        
        //Tarkin
        var tarkinURL : NSURL? = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin")
        var tarkinSoundURL : NSURL? = b?.URLForResource("tarkin", withExtension: "caf")
        var tarkinSound : NSData? = NSData(contentsOfURL: tarkinSoundURL!)
        var tarkinImage : UIImage? = UIImage(named: "tarkin.jpg")
        var tarkin = RNOStarWarsCharacter(name: "Wilhuf Tarkin", alias: "Grand Moff Tarkin", url: tarkinURL, soundData: tarkinSound, photo: tarkinImage)
        
        //Palpatine
        var palpatineURL : NSURL? = NSURL(string: "http://en.wikipedia.org/wiki/Palpatine")
        var palpatineSoundURL : NSURL? = b?.URLForResource("palpatine", withExtension: "caf")
        var palpatineSound : NSData? = NSData(contentsOfURL: palpatineSoundURL!)
        var palpatineImage : UIImage? = UIImage(named: "palpatine.jpg")
        var palpatine = RNOStarWarsCharacter(name: "Palpatine", alias: "Darth Sidious", url: palpatineURL, soundData: palpatineSound, photo: palpatineImage)
        
        //Chewbacca
        var chewbaccaURL : NSURL? = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca")
        var chewbaccaSoundURL : NSURL? = b?.URLForResource("chewbacca", withExtension: "caf")
        var chewbaccaSound : NSData? = NSData(contentsOfURL: chewbaccaSoundURL!)
        var chewbaccaImage : UIImage? = UIImage(named: "chewbacca.jpg")
        var chewbacca = RNOStarWarsCharacter(alias: "Chewbacca", url: chewbaccaURL, soundData: chewbaccaSound, photo: chewbaccaImage)
        
        //C-3PO
        var c3poURL : NSURL? = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO")
        var c3poSoundURL : NSURL? = b?.URLForResource("c3po", withExtension: "caf")
        var c3poSound : NSData? = NSData(contentsOfURL: c3poSoundURL!)
        var c3poImage : UIImage? = UIImage(named: "c3po.jpg")
        var c3po = RNOStarWarsCharacter(alias: "C-3PO", url: c3poURL, soundData: c3poSound, photo: c3poImage)
        
        //Yoda
        var yodaURL : NSURL? = NSURL(string: "http://en.wikipedia.org/wiki/Yoda")
        var yodaSoundURL : NSURL? = b?.URLForResource("yoda", withExtension: "caf")
        var yodaSound : NSData? = NSData(contentsOfURL: yodaSoundURL!)
        var yodaImage : UIImage? = UIImage(named: "yoda.jpg")
        var yoda = RNOStarWarsCharacter(name: "Minch Yoda", alias: "Master Yoda", url: yodaURL, soundData: yodaSound, photo: yodaImage)
        
        //R2-D2
        var r2d2URL : NSURL? = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO")
        var r2d2SoundURL : NSURL? = b?.URLForResource("r2-d2", withExtension: "caf")
        var r2d2Sound : NSData? = NSData(contentsOfURL: r2d2SoundURL!)
        var r2d2Image : UIImage? = UIImage(named: "R2-D2.jpg")
        var r2d2 = RNOStarWarsCharacter(alias: "R2-D2", url: r2d2URL, soundData: r2d2Sound, photo: r2d2Image)
        
        self.imperials = [vader, palpatine, tarkin]
        self.rebels = [chewbacca, c3po, r2d2, yoda]
        
    }
    
    func rebelAtIndex(index : Int) -> RNOStarWarsCharacter{
        return self.rebels[index]
    }
    
    func imperialAtIndex(index : Int) -> RNOStarWarsCharacter{
        return self.imperials[index]
    }
    
}