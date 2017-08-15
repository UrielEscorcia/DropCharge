//
//  Lava.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class Lava: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        scene.playerTrail.particleBirthRate = 0
        scene.run(scene.soundHitLava)
        let smokeTrail = scene.addTrail("SmokeTrail")
        scene.run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run(){
                self.scene.removeTrail(smokeTrail)
            }
        ]))
        scene.boostPlayer()
        scene.lives -= 1
        scene.screenShakeByAmt(50)
        scene.player.run(scene.squishAndStretch)
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is Fall.Type || stateClass is Jump.Type || stateClass is Dead.Type
    }
    
}
