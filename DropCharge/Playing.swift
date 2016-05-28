//
//  Playing.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class Playing: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        if previousState is WaitingForBomb {
            scene.playBackgroundMusic("bgMusic.mp3")
            scene.player.physicsBody!.dynamic = true
            scene.superBoostPlayer()
        }
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        scene.updateCamera()
        scene.updateLevel()
        scene.updatePlayer()
        scene.updateLava(seconds)
        scene.updateCollisionLava()
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is GameOver.Type
    }
    

}
