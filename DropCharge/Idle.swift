//
//  Idle.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class Idle: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        scene.player.physicsBody = SKPhysicsBody(circleOfRadius: scene.player.size.width * 0.3)
        scene.player.physicsBody!.dynamic = false
        scene.player.physicsBody!.allowsRotation = false
        scene.player.physicsBody!.categoryBitMask = PhysicsCategory.Player
        scene.player.physicsBody!.collisionBitMask = 0
        
        scene.playerTrail = scene.addTrail("PlayerTrail")
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is Jump.Type
    }


}
