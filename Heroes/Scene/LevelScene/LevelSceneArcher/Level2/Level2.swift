//
//  Level2.swift
//  Elon's Adventure
//
//  Created by Mirko Justiniano on 9/24/19.
//  Copyright © 2019 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level2: GameScene {
    
    var position500x: Bool = false
    var position1600x: Bool = false
    var position1280x: Bool = false
    var position2500x: Bool = false
    var position2900x: Bool = false
    var position4000x: Bool = false
    var position3500x: Bool = false
    var position4800x: Bool = false
    var position4790x: Bool = false
    
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
        
        //Skeleton1
        if (player?.position.x)! >= 500 {
            if !position500x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position500x = true
        }
        
        if (player?.position.x)! >= 1600 {
            if !position1600x {
                enemy1?.removeFromParent()
            }
            position1600x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1280 {
            if !position1280x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1280x = true
        }
        
        if (player?.position.x)! >= 2500 {
            if !position2500x {
                enemy2?.removeFromParent()
            }
            position2500x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 2900 {
            if !position2900x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position2900x = true
        }
        
        if (player?.position.x)! >= 4000 {
            if !position4000x {
                enemy3?.removeFromParent()
            }
            position4000x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 3500 {
            if !position3500x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position3500x = true
        }
        
        if (player?.position.x)! >= 4800 {
            if !position4800x {
                enemy4?.removeFromParent()
            }
            position4800x = true
        }
        //Portal
        if (player?.position.x)! >= 4790 {
            if !position4790x {
                spawnPortalEmitter()
            }
            position4790x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel2")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            let transition = SKTransition.fade(withDuration: 1)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
//            run(Sound.levelUp.action)
        }
    }
}
