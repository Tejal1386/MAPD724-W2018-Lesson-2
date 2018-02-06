//
//  Ocean.swift
//  MAPD724-W2018-Lesson-2
//
//  Created by Tejal Patel on 2018-01-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit

class Ocean: GameObject {

    // Constructor
    init()
    {
        //Initialize the object with an image
        super.init(imageString: "ocean", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 0
        self.anchorPoint = CGPoint.zero
        self.dy = 5.0
    }
    
    override func Reset() {
        self.position = CGPoint.zero
        
    }
    override func CheckBounds() {
        if(self.position.y <  -780)
        {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}
