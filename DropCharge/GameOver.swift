//
//  GameOver.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOver: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        if previousState is Playing {
            scene.playBackgroundMusic("SpaceGame.caf")
            let gameOver = SKSpriteNode(imageNamed: "GameOver")
            gameOver.position = scene.getCameraPosition()
            gameOver.zPosition = 10
            scene.addChild(gameOver)
        }
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is WaitingForTap.Type
    }

}
