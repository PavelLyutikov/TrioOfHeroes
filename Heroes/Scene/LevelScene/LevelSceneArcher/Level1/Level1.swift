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

class Level1: GameScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        spawnSkeleton1()
        spawnSkeleton2()
        stateMachineSkeleton1()
        stateMachineSkeleton2()
        physicsBodyEnemy1()
        physicsBodyEnemy2()

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
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel1")
            
            UserDefaults.standard.set(0, forKey: "levelNumber")
            
            UserDefaults.standard.set(false, forKey: "menuMusicOn")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        }
    }
}
