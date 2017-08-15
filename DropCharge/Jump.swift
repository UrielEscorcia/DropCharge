//
//  Jump.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class Jump: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        if previousState is Lava {
            return
        }
        if scene.playerTrail.particleBirthRate == 0 {
           scene.playerTrail.particleBirthRate = 200
        }
        scene.player.run(scene.squishAndStretch)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if abs(scene.player.physicsBody!.velocity.dx) > 100.0 {
            if scene.player.physicsBody!.velocity.dx > 0 {
                scene.runAnim(scene.animSteerRight)
            }else{
                scene.runAnim(scene.animSteerLeft)
            }
        }else{
            scene.runAnim(scene.animJump)
        }
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is Fall.Type
    }

}
