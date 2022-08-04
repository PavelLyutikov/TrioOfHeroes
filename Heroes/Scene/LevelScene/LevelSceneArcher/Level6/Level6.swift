//
//  Level6.swift
//  Elon's Adventure
//
//  Created by mac on 20.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level6: GameScene {
    
    var position1120x: Bool = false
    var position3400x: Bool = false
    var position40x: Bool = false
    var position1040x: Bool = false
    var position260x: Bool = false
    var position1260x: Bool = false
    var position3620x: Bool = false
    var position4620x: Bool = false
    var position4220x: Bool = false
    var position5220x: Bool = false
    var position4520x: Bool = false
    var position5520x: Bool = false
    var position5280x: Bool = false
    var position6280x: Bool = false
    var position5540x: Bool = false
    var position6540x: Bool = false
    var position5740x: Bool = false
    var position6740x: Bool = false
    var position6750x: Bool = false
    var position7740x: Bool = false
    var position7280x: Bool = false
    var position7750x: Bool = false
    var position8070x: Bool = false
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
    func position1120xRun() {
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnStone()
        }, SKAction.wait(forDuration: 7.0)])))
    }
    
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 3200, y: 320)
            stone.zPosition = 30
            addChild(stone)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 100)
            stone.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask
            
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true
        
//            Timer.scheduledTimer(withTimeInterval: 15.0, repeats: false) { (timer) in
//                let remove = SKAction.removeFromParent()
//                self.stone.run(SKAction.sequence([remove]))
//            }
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
        
        //Stone
        if (player?.position.x)! >= 1120 {
            if !position1120x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3400x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 7.0)])))
                position1120x = true
            }
        }
                
        if (player?.position.x)! >= 3400 {
            if !position3400x {
                position3400x = true
            }
        }
        //Skeleton1
        if (player?.position.x)! >= 40 {
            if !position40x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position40x = true
        }
        
        if (player?.position.x)! >= 1040 {
            if !position1040x {
                enemy1?.removeFromParent()
            }
            position1040x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 260 {
            if !position260x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position260x = true
        }
        
        if (player?.position.x)! >= 1260 {
            if !position1260x {
                enemy2?.removeFromParent()
            }
            position1260x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 3620 {
            if !position3620x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position3620x = true
        }
        
        if (player?.position.x)! >= 4620 {
            if !position4620x {
                enemy3?.removeFromParent()
            }
            position4620x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 4220 {
            if !position4220x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position4220x = true
        }
        
        if (player?.position.x)! >= 5220 {
            if !position5220x {
                enemy4?.removeFromParent()
            }
            position5220x = true
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
        if (player?.position.x)! >= 5280 {
            if !position5280x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position5280x = true
        }
        
        if (player?.position.x)! >= 6280 {
            if !position6280x {
                enemy6?.removeFromParent()
            }
            position6280x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 5540 {
            if !position5540x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position5540x = true
        }
        
        if (player?.position.x)! >= 6540 {
            if !position6540x {
                enemy7?.removeFromParent()
            }
            position6540x = true
        }
        
        //Skeleton8
        if (player?.position.x)! >= 5740 {
            if !position5740x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position5740x = true
        }
        if (player?.position.x)! >= 6740 {
            if !position6740x {
                enemy8?.removeFromParent()
            }
            position6740x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 6750 {
            if !position6750x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position6750x = true
        }
        if (player?.position.x)! >= 7740 {
            if !position7740x {
                enemy9?.removeFromParent()
            }
            position7740x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 7280 {
            if !position7280x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position7280x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 7750 {
            if !position7750x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position7750x = true
        }
        //Portal
        if (player?.position.x)! >= 8070 {
            if !position8070x {
                spawnPortalEmitter()
            }
            position8070x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel6")
            
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

