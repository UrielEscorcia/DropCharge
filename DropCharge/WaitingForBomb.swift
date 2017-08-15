//
//  WaitingForBomb.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class WaitingForBomb: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        if previousState is WaitingForTap {
            // Scale out title & ready label
            let scale = SKAction.scale(to: 0, duration: 0.4)
            scene.fgNode.childNode(withName: "Title")!.run(scale)
            scene.fgNode.childNode(withName: "Ready")!.run(SKAction.sequence([SKAction.wait(forDuration: 0.2), scale]))
            
            // Bounce bomb
            let scaleUp = SKAction.scale(to: 1.25, duration: 0.25)
            let scaleDown = SKAction.scale(to: 1, duration: 0.25)
            let sequence = SKAction.sequence([scaleUp, scaleDown])
            let repeatSeq = SKAction.repeatForever(sequence)
            scene.fgNode.childNode(withName: "Bomb")!.run(SKAction.unhide())
            scene.fgNode.childNode(withName: "Bomb")!.run(repeatSeq)
            
            scene.run(scene.soundBombDrop)
            scene.run(SKAction.repeat(scene.soundTickTock, count: 2))
            
        }
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is Playing.Type
    }
    
    override func willExit(to nextState: GKState) {
        if nextState is Playing {
            scene.setupCoreMotion()
            let bomb = scene.fgNode.childNode(withName: "Bomb")!
            scene.run(scene.soundExplosions[3])
            let explosion = scene.explosion(2.0)
            explosion.position = bomb.position
            scene.fgNode.addChild(explosion)
            bomb.removeFromParent()
            
            scene.screenShakeByAmt(100)
        }
    }

}
