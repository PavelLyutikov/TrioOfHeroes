//
//  Level4.swift
//  Elon's Adventure
//
//  Created by mac on 16.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level4: GameScene {
    
    var position960x: Bool = false
    var position1960x: Bool = false
    var position1440x: Bool = false
    var position2440x: Bool = false
    var position1850x: Bool = false
    var position2850x: Bool = false
    var position2520x: Bool = false
    var position3520x: Bool = false
    var position2900x: Bool = false
    var position3900x: Bool = false
    var position3680x: Bool = false
    var position4680x: Bool = false
    var position4100x: Bool = false
    var position5100x: Bool = false
    var position5060x: Bool = false
    var position5300x: Bool = false
    var position5560x: Bool = false
    var position4750x: Bool = false
    
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
        if (player?.position.x)! >= 960 {
            if !position960x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position960x = true
        }
        
        if (player?.position.x)! >= 1960 {
            if !position1960x {
                enemy1?.removeFromParent()
            }
            position1960x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1440 {
            if !position1440x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1440x = true
        }
        
        if (player?.position.x)! >= 2440 {
            if !position2440x {
                enemy2?.removeFromParent()
            }
            position2440x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 1850 {
            if !position1850x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position1850x = true
        }
        
        if (player?.position.x)! >= 2850 {
            if !position2850x {
                enemy3?.removeFromParent()
            }
            position2850x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 2520 {
            if !position2520x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position2520x = true
        }
        
        if (player?.position.x)! >= 3520 {
            if !position3520x {
                enemy4?.removeFromParent()
            }
            position3520x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 2900 {
            if !position2900x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position2900x = true
        }
        
        if (player?.position.x)! >= 3900 {
            if !position3900x {
                enemy5?.removeFromParent()
            }
            position3900x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 3680 {
            if !position3680x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position3680x = true
        }
        
        if (player?.position.x)! >= 4680 {
            if !position4680x {
                enemy6?.removeFromParent()
            }
            position4680x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 4100 {
            if !position4100x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position4100x = true
        }
        
        if (player?.position.x)! >= 5100 {
            if !position5100x {
                enemy7?.removeFromParent()
            }
            position5100x = true
        }
        
        //Skeleton8
        if (player?.position.x)! >= 5060 {
            if !position5060x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position5060x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 5300 {
            if !position5300x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position5300x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 5560 {
            if !position5560x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position5560x = true
        }
        //Portal
        if (player?.position.x)! >= 4750 {
            if !position4750x {
                spawnPortalEmitter()
            }
            position4750x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel4")
            
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
