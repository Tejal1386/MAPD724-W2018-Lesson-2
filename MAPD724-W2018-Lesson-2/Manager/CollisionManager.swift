//
//  CollisionManager.swift
//  MAPD724-W2018-Lesson-2
//
//  Created by Tejal Patel on 2018-02-05.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import CoreGraphics
import SpriteKit

class CollisionManager {

    init() {
        
    }
    
    public static func CheckCllision(scene: SKScene, object1: GameObject, object2: GameObject){
        if (CGPoint.Distance(P1: object1.position, P2: object2.position) < (object1.halfheight! + object2.halfheight!) ) {
            
            if(!object2.isColliding!){
                if (object2.name == "island"){
                  scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    ScoreManager.Score += 100
                }
                if (object2.name == "cloud"){
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    ScoreManager.Lives -= 1
                    
                }
                object2.isColliding = true
            }
        }
        else{
            object2.isColliding = false
        }
        
    }

}
