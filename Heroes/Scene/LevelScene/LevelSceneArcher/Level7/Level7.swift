//
//  Level7.swift
//  Elon's Adventure
//
//  Created by mac on 20.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level7: GameScene {
    
    var position600x: Bool = false
    var position1600x: Bool = false
    var position1150x: Bool = false
    var position2150x: Bool = false
    var position1800x: Bool = false
    var position2800x: Bool = false
    var position3020x: Bool = false
    var position4020x: Bool = false
    var position3380x: Bool = false
    var position4380x: Bool = false
    var position4150x: Bool = false
    var position5150x: Bool = false
    var position4580x: Bool = false
    var position5580x: Bool = false
    var position5140x: Bool = false
    var position6140x: Bool = false
    var position5280x: Bool = false
    var position6280x: Bool = false
    var position5540x: Bool = false
    var position6540x: Bool = false
    var position5740x: Bool = false
    var position6740x: Bool = false
    var position6660x: Bool = false
    var position7660x: Bool = false
    var position6750x: Bool = false
    var position7750x: Bool = false
    var position8560x: Bool = false
    
    let rain = SKEmitterNode(fileNamed: "RainLevel7.sks")!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnRainEmitter()
    }
//MARK: - SpawnEmitterRain
    func spawnRainEmitter() {
        rain.zPosition = 1
        addChild(rain)
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
        
        rain.position = CGPoint(x: 4800, y: cameraNode!.position.y + 150)
        
        //Skeleton1
        if (player?.position.x)! >= 600 {
            if !position600x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position600x = true
        }
        
        if (player?.position.x)! >= 1600 {
            if !position1600x {
                enemy1?.removeFromParent()
            }
            position1600x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1150 {
            if !position1150x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1150x = true
        }
        
        if (player?.position.x)! >= 2150 {
            if !position2150x {
                enemy2?.removeFromParent()
            }
            position2150x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 1800 {
            if !position1800x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position1800x = true
        }
        
        if (player?.position.x)! >= 2800 {
            if !position2800x {
                enemy3?.removeFromParent()
            }
            position2800x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 3020 {
            if !position3020x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position3020x = true
        }
        
        if (player?.position.x)! >= 4020 {
            if !position4020x {
                enemy4?.removeFromParent()
            }
            position4020x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 3380 {
            if !position3380x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position3380x = true
        }
        
        if (player?.position.x)! >= 4380 {
            if !position4380x {
                enemy5?.removeFromParent()
            }
            position4380x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 4150 {
            if !position4150x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position4150x = true
        }
        
        if (player?.position.x)! >= 5150 {
            if !position5150x {
                enemy6?.removeFromParent()
            }
            position5150x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 4580 {
            if !position4580x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position4580x = true
        }
        
        if (player?.position.x)! >= 5580 {
            if !position5580x {
                enemy7?.removeFromParent()
            }
            position5580x = true
        }
        
        //Skeleton8
        if (player?.position.x)! >= 5140 {
            if !position5140x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position5140x = true
        }
        if (player?.position.x)! >= 6140 {
            if !position6140x {
                enemy8?.removeFromParent()
            }
            position6140x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 5280 {
            if !position5280x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position5280x = true
        }
        if (player?.position.x)! >= 6280 {
            if !position6280x {
                enemy9?.removeFromParent()
            }
            position6280x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 5540 {
            if !position5540x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position5540x = true
        }
        if (player?.position.x)! >= 6540 {
            if !position6540x {
                enemy10?.removeFromParent()
            }
            position6540x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 5740 {
            if !position5740x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position5740x = true
        }
        
        if (player?.position.x)! >= 6740 {
            if !position6740x {
                enemy11?.removeFromParent()
            }
            position6740x = true
        }
        //Skeleton12
        if (player?.position.x)! >= 6660 {
            if !position6660x {
                spawnSkeleton12()
                stateMachineSkeleton12()
                physicsBodyEnemy12()
            }
            position6660x = true
        }
        
        if (player?.position.x)! >= 7660 {
            if !position7660x {
                enemy12?.removeFromParent()
            }
            position7660x = true
        }
        //Skeleton13
        if (player?.position.x)! >= 6750 {
            if !position6750x {
                spawnSkeleton13()
                stateMachineSkeleton13()
                physicsBodyEnemy13()
            }
            position6750x = true
        }
        
        if (player?.position.x)! >= 7750 {
            if !position7750x {
                enemy13?.removeFromParent()
            }
            position7750x = true
        }
        //Portal
        if (player?.position.x)! >= 8560 {
            if !position8560x {
                spawnPortalEmitter()
            }
            position8560x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel7")
            
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

