//
//  GameScene.swift
//  MAPD724-W2018-Lesson-2
//
//  Created by Tejal Patel on 2018-01-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
   //Game Variable
    var oceanSprite: Ocean?
    var PlaneSprite: Plane?
    var islandSprite: Island?
    var cloudSprites: [Cloud] = []
    
    override func didMove(to view: SKView) {
        
       screenWidth = screenSize.width
        screenHeight = screenSize.height
        //add ocean
        self.oceanSprite = Ocean()
        self.addChild(self.oceanSprite!)
        
        
        //add plane
        self.PlaneSprite = Plane()
        self.PlaneSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50)
        self.addChild(self.PlaneSprite!)
        
        //add island
        self.islandSprite = Island()
        self.addChild(self.islandSprite!)
        
        //add clouds
        for index in 0...2{
            let cloud: Cloud = Cloud()
            cloudSprites.append(cloud)
            self.addChild(cloudSprites[index])
        }
        
       //background sound
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        //preload Sounds
        do{
            let Sounds: [String] = ["thunder", "yay"]
            for sound in Sounds {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch {
            
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        self.PlaneSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       self.PlaneSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchUp(atPoint pos : CGPoint) {
         self.PlaneSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        self.oceanSprite?.Update()
        self.PlaneSprite?.Update()
        self.islandSprite?.Update()
        
        CollisionManager.CheckCllision(scene: self, object1: PlaneSprite!, object2: islandSprite!)
        
        for cloud in cloudSprites{
            cloud.Update()
            CollisionManager.CheckCllision(scene: self, object1: PlaneSprite!, object2: cloud)
            
        }
    }
}
