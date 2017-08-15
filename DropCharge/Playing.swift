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
    
    override func didEnter(from previousState: GKState?) {
        if previousState is WaitingForBomb {
            scene.playBackgroundMusic("bgMusic.mp3")
            scene.player.physicsBody!.isDynamic = true
            scene.superBoostPlayer()
        }
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        scene.updateCamera()
        scene.updateLevel()
        scene.updatePlayer()
        scene.updateLava(seconds)
        scene.updateCollisionLava()
        scene.updateExplosions(seconds)
        scene.updateRedAlert(seconds)
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameOver.Type
    }
    

}
