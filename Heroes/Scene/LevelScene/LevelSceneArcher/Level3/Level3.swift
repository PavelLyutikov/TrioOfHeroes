//
//  Level3.swift
//  Elon's Adventure
//
//  Created by mac on 16.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level3: GameScene {
    
    var position560x: Bool = false
    var position1540x: Bool = false
    var position1240x: Bool = false
    var position2220x: Bool = false
    var position1420x: Bool = false
    var position2420x: Bool = false
    var position1840x: Bool = false
    var position2840x: Bool = false
    var position3010x: Bool = false
    var position4010x: Bool = false
    var position3420x: Bool = false
    var position4420x: Bool = false
    var position4430x: Bool = false
    var position4940x: Bool = false
    var position4800x: Bool = false
    
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
        if (player?.position.x)! >= 560 {
            if !position560x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position560x = true
        }
        
        if (player?.position.x)! >= 1540 {
            if !position1540x {
                enemy1?.removeFromParent()
            }
            position1540x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1240 {
            if !position1240x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1240x = true
        }
        
        if (player?.position.x)! >= 2220 {
            if !position2220x {
                enemy2?.removeFromParent()
            }
            position2220x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 1420 {
            if !position1420x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position1420x = true
        }
        
        if (player?.position.x)! >= 2420 {
            if !position2420x {
                enemy3?.removeFromParent()
            }
            position2420x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 1840 {
            if !position1840x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position1840x = true
        }
        
        if (player?.position.x)! >= 2840 {
            if !position2840x {
                enemy4?.removeFromParent()
            }
            position2840x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 3010 {
            if !position3010x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position3010x = true
        }
        
        if (player?.position.x)! >= 4010 {
            if !position4010x {
                enemy5?.removeFromParent()
            }
            position4010x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 3420 {
            if !position3420x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position3420x = true
        }
        
        if (player?.position.x)! >= 4420 {
            if !position4420x {
                enemy6?.removeFromParent()
            }
            position4420x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 4430 {
            if !position4430x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position4430x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 4940 {
            if !position4940x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position4940x = true
        }
        //Portal
        if (player?.position.x)! >= 4800 {
            if !position4800x {
                spawnPortalEmitter()
            }
            position4800x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel3")
            
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
