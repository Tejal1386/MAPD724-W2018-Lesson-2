//
//  GameObject.swift
//  MAPD724-W2018-Lesson-2
//
//  Created by Tejal Patel on 2018-01-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameObject: SKSpriteNode {

    // Instance Variables
    var dx: CGFloat?
    var dy: CGFloat?
    var width: CGFloat?
    var halfwidth: CGFloat?
    var height: CGFloat?
    var halfheight: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDest: GKRandomDistribution?
    
    // Constructor
    init(imageString: String, initialScale: CGFloat){
        // Initialize the object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        self.scale = initialScale
        self.width = texture.size().width * self.scale!
        self.height = texture.size().height * self.scale!
        self.halfwidth = self.width! * 0.5
        self.halfheight = self.height! * 0.5
        self.isColliding = false
        self.name = imageString
        randomSource = GKARC4RandomSource()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func Reset(){
        
    }
    
    public func CheckBounds(){
        
    }
    
    public func Start(){
        
    }
    
    public func Update(){
        
    }
}
