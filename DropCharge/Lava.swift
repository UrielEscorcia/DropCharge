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
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        scene.boostPlayer()
        scene.lives -= 1
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is Fall.Type || stateClass is Jump.Type || stateClass is Dead.Type
    }
    
}
