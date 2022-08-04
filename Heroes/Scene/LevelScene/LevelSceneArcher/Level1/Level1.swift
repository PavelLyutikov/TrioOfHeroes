//
//  Level1.swift
//  Elon's Adventure
//
//  Created by Mirko Justiniano on 9/24/19.
//  Copyright © 2019 idevcode. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

@available(iOS 11.0, *)
class Level1: GameScene {
    
    var position1440x: Bool = false
    var position2640x: Bool = false
    var position3540x: Bool = false
    var position3660x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        
        if (player?.position.x)! >= 1440 {
            if !position1440x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position1440x = true
        }
        
        if (player?.position.x)! >= 2640 {
            if !position2640x {
                enemy1?.removeFromParent()
            }
            position2640x = true
        }
        
        if (player?.position.x)! >= 3540 {
            if !position3540x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position3540x = true
        }
        
        if (player?.position.x)! >= 3660 {
            if !position3660x {
                spawnPortalEmitter()
            }
            position3660x = true
        }
        
//PlayerWin
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel1")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            let transition = SKTransition.fade(withDuration: 1)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        }
    }
}
