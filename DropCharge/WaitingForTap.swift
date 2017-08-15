//
//  WaitingForTap.swift
//  DropCharge
//
//  Created by Urisito on 5/24/16.
//  Copyright © 2016 Urisito. All rights reserved.
//

import SpriteKit
import GameplayKit

class WaitingForTap: GKState {

    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        let scale = SKAction.scale(to: 1.0, duration: 0.5)
        scene.fgNode.childNode(withName: "Ready")!.run(scale)
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is WaitingForBomb.Type
    }
}
