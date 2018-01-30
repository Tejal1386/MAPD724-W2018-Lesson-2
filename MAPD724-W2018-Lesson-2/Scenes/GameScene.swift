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
    var PlaneSprite: Plane?
    
    override func didMove(to view: SKView) {
        
       screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //add plane
        self.PlaneSprite = Plane()
        self.PlaneSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50)
        self.addChild(self.PlaneSprite!)
        
        print(self.PlaneSprite?.halfwidth)
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
        
        self.PlaneSprite?.Update()
    }
}
