//
//  Fall.swift
//  DropCharge
//
//  Created by Urisito on 5/25/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class Fall: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        scene.runAnim(scene.animFall)
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is Jump.Type || stateClass is Lava.Type
    }

}
