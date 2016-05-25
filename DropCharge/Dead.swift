//
//  Dead.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class Dead: GKState {

    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        if previousState is Lava {
            scene.physicsWorld.contactDelegate = nil
            scene.player.physicsBody?.dynamic = false
            
            let moveUpAction = SKAction.moveByX(0, y: scene.size.height / 2, duration: 0.5)
            moveUpAction.timingMode = .EaseOut
            let moveDownAction = SKAction.moveByX(0, y: -(scene.size.height * 1.5), duration: 1.0)
            moveDownAction.timingMode = .EaseIn
            let sequence = SKAction.sequence([moveUpAction, moveDownAction])
            scene.player.runAction(sequence)
        }
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is Idle.Type
    }
}
