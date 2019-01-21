//
//  totem.swift
//  ARViewer
//
//  Created by Jakob Palmer on 2/4/18.
//  Copyright © 2018 Faris Sbahi. All rights reserved.
//


import UIKit
import SceneKit

// Floating boxes that appear around you
class totem: SCNNode {
    override init() {
        super.init()
        let box = SCNBox(width: 0.5, height: 5.5, length: 0.5, chamferRadius: 0)
        self.geometry = box
        let shape = SCNPhysicsShape(geometry: box, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .static, shape: shape)//.dynamic
        self.physicsBody?.isAffectedByGravity = false
        
        // see http://texnotes.me/post/5/ for details on collisions and bit masks
        self.physicsBody?.categoryBitMask = CollisionCategory.totem.rawValue
        //--->? self.physicsBody?.contactTestBitMask = CollisionCategory.bullets.rawValue
        self.physicsBody?.contactTestBitMask = CollisionCategory.ship.rawValue
        
        // add texture
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "texture")
        self.geometry?.materials  = [material, material, material, material, material, material]
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

