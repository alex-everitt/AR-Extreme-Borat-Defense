//
//  Bullet.swift
//  ARViewer
//
//  Created by Faris Sbahi on 6/6/17.
//  Copyright © 2017 Faris Sbahi. All rights reserved.
//

import UIKit
import SceneKit

// Spheres that are shot at the "ships"
class Bullet: SCNNode {
    override init () {
        super.init()
        let sphere = SCNSphere(radius: 0.025)
        self.geometry = sphere
        let shape = SCNPhysicsShape(geometry: sphere, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        
        // see http://texnotes.me/post/5/ for details on collisions and bit masks
        self.physicsBody?.categoryBitMask = CollisionCategory.bullets.rawValue
        //self.physicsBody?.contactBitMask = [CollisionCategory.ship, CollisionCategory.iceWall].rawValue
        self.physicsBody?.contactTestBitMask = CollisionCategory.ship.rawValue
        self.physicsBody?.collisionBitMask = CollisionCategory.ship.rawValue
        
        // add texture
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "bullet_texture")
        self.geometry?.materials  = [material]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/*
// The physics body-category is a bullet
self.physicsBody?.categoryBitMask = CollisionCategory.moltenBuller.rawValue
// This contacts with both other bullets and ice walls!
self.physicsBody?.contactBitMask = [CollsionCategory.moltenBullet, CollisionCategory.iceWall].rawValue
self.physicsBody?.collisionBitMask = self.physicsBody!.contactBitMask
*/
