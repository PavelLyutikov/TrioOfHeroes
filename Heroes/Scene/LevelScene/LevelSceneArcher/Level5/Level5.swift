//
//  Level5.swift
//  Elon's Adventure
//
//  Created by mac on 17.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level5: GameScene {
    
    var position1500x: Bool = false
    var position2500x: Bool = false
    var position1920x: Bool = false
    var position2920x: Bool = false
    var position3680x: Bool = false
    var position4680x: Bool = false
    var position4460x: Bool = false
    var position5460x: Bool = false
    var position4520x: Bool = false
    var position5520x: Bool = false
    var position5260x: Bool = false
    var position6260x: Bool = false
    var position5420x: Bool = false
    var position6420x: Bool = false
    var position5560x: Bool = false
    var position6560x: Bool = false
    var position6220x: Bool = false
    var position6140x: Bool = false
    
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
        if (player?.position.x)! >= 1500 {
            if !position1500x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position1500x = true
        }
        
        if (player?.position.x)! >= 2500 {
            if !position2500x {
                enemy1?.removeFromParent()
            }
            position2500x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1920 {
            if !position1920x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1920x = true
        }
        
        if (player?.position.x)! >= 2920 {
            if !position2920x {
                enemy2?.removeFromParent()
            }
            position2920x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 3680 {
            if !position3680x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position3680x = true
        }
        
        if (player?.position.x)! >= 4680 {
            if !position4680x {
                enemy3?.removeFromParent()
            }
            position4680x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 4460 {
            if !position4460x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position4460x = true
        }
        
        if (player?.position.x)! >= 5460 {
            if !position5460x {
                enemy4?.removeFromParent()
            }
            position5460x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 4520 {
            if !position4520x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position4520x = true
        }
        
        if (player?.position.x)! >= 5520 {
            if !position5520x {
                enemy5?.removeFromParent()
            }
            position5520x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 5260 {
            if !position5260x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position5260x = true
        }
        
        if (player?.position.x)! >= 6260 {
            if !position6260x {
                enemy6?.removeFromParent()
            }
            position6260x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 5420 {
            if !position5420x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position5420x = true
        }
        
        if (player?.position.x)! >= 6420 {
            if !position6420x {
                enemy7?.removeFromParent()
            }
            position6420x = true
        }
        
        //Skeleton8
        if (player?.position.x)! >= 5560 {
            if !position5560x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position5560x = true
        }
        
        if (player?.position.x)! >= 6560 {
            if !position6560x {
                enemy8?.removeFromParent()
            }
            position6560x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 6220 {
            if !position6220x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position6220x = true
        }
        //Portal
        if (player?.position.x)! >= 6140 {
            if !position6140x {
                spawnPortalEmitter()
            }
            position6140x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel5")
            
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
