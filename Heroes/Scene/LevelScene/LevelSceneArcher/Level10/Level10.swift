//
//  Level10.swift
//  Elon's Adventure
//
//  Created by mac on 20.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level10: GameScene {
    
    var position500x: Bool = false
    var position1500x: Bool = false
    var position960x: Bool = false
    var position1960x: Bool = false
    var position1340x: Bool = false
    var position2340x: Bool = false
    var position1850x: Bool = false
    var position2850x: Bool = false
    var position4180x: Bool = false
    var position5180x: Bool = false
    var position4580x: Bool = false
    var position5580x: Bool = false
    var position5100x: Bool = false
    var position6100x: Bool = false
    var position5190x: Bool = false
    var position6190x: Bool = false
    var position5300x: Bool = false
    var position6300x: Bool = false
    var position5840x: Bool = false
    var position6840x: Bool = false
    var position6240x: Bool = false
    var position7240x: Bool = false
    var position7040x: Bool = false
    var position8040x: Bool = false
    var position8560x: Bool = false
    var position8860x: Bool = false
    var position8740x: Bool = false
    
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
        
        if (player?.position.x)! >= 1500 {
            if !position1500x {
                enemy1?.removeFromParent()
            }
            position1500x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 960 {
            if !position960x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position960x = true
        }
        
        if (player?.position.x)! >= 1960 {
            if !position1960x {
                enemy2?.removeFromParent()
            }
            position1960x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 1340 {
            if !position1340x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position1340x = true
        }
        
        if (player?.position.x)! >= 2340 {
            if !position2340x {
                enemy3?.removeFromParent()
            }
            position2340x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 1850 {
            if !position1850x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position1850x = true
        }
        
        if (player?.position.x)! >= 2850 {
            if !position2850x {
                enemy4?.removeFromParent()
            }
            position2850x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 4180 {
            if !position4180x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position4180x = true
        }
        
        if (player?.position.x)! >= 5180 {
            if !position5180x {
                enemy5?.removeFromParent()
            }
            position5180x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 4580 {
            if !position4580x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position4580x = true
        }
        
        if (player?.position.x)! >= 5580 {
            if !position5580x {
                enemy6?.removeFromParent()
            }
            position5580x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 5100 {
            if !position5100x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position5100x = true
        }
        
        if (player?.position.x)! >= 6100 {
            if !position6100x {
                enemy7?.removeFromParent()
            }
            position6100x = true
        }
        
        //Skeleton8
        if (player?.position.x)! >= 5190 {
            if !position5190x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position5190x = true
        }
        if (player?.position.x)! >= 6190 {
            if !position6190x {
                enemy8?.removeFromParent()
            }
            position6190x = true
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
        if (player?.position.x)! >= 6300 {
            if !position6300x {
                enemy9?.removeFromParent()
            }
            position6300x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 5840 {
            if !position5840x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position5840x = true
        }
        if (player?.position.x)! >= 6840 {
            if !position6840x {
                enemy10?.removeFromParent()
            }
            position6840x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 6240 {
            if !position6240x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position6240x = true
        }
        if (player?.position.x)! >= 7240 {
            if !position7240x {
                enemy11?.removeFromParent()
            }
            position7240x = true
        }
        //Skeleton12
        if (player?.position.x)! >= 7040 {
            if !position7040x {
                spawnSkeleton12()
                stateMachineSkeleton12()
                physicsBodyEnemy12()
            }
            position7040x = true
        }
        if (player?.position.x)! >= 8040 {
            if !position8040x {
                enemy12?.removeFromParent()
            }
            position8040x = true
        }
        //Skeleton13
        if (player?.position.x)! >= 8560 {
            if !position8560x {
                spawnSkeleton13()
                stateMachineSkeleton13()
                physicsBodyEnemy13()
            }
            position8560x = true
        }
        //Skeleton14
        if (player?.position.x)! >= 8860 {
            if !position8860x {
                spawnSkeleton14()
                stateMachineSkeleton14()
                physicsBodyEnemy14()
            }
            position8860x = true
        }
        //Portal
        if (player?.position.x)! >= 8740 {
            if !position8740x {
                spawnPortalEmitter()
            }
            position8740x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel10")
            
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

