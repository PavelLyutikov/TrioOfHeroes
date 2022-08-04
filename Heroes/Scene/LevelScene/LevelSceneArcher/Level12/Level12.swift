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
class Level12: GameScene {
    
    var position380x: Bool = false
    var position1380x: Bool = false
    var position1340x: Bool = false
    var position2340x: Bool = false
    var position1600x: Bool = false
    var position2600x: Bool = false
    var position1860x: Bool = false
    var position2860x: Bool = false
    var position2820x: Bool = false
    var position3820x: Bool = false
    var position4200x: Bool = false
    var position5200x: Bool = false
    var position4580x: Bool = false
    var position5580x: Bool = false
    var position5180x: Bool = false
    var position6180x: Bool = false
    var position5320x: Bool = false
    var position6320x: Bool = false
    var position5540x: Bool = false
    var position6540x: Bool = false
    var position5820x: Bool = false
    var position6820x: Bool = false
    var position6240x: Bool = false
    var position7240x: Bool = false
    var position6970x: Bool = false
    var position7970x: Bool = false
    var position7050x: Bool = false
    var position8050x: Bool = false
    var position8640x: Bool = false
    var position7860x: Bool = false
    var position900x: Bool = false
    var position2060x: Bool = false
    var position3060x: Bool = false
    var position3000x: Bool = false
    var position4000x: Bool = false
    var position5560x: Bool = false
    var position6560x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnPuddlePractileEmitter()
    }
    
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 9600, y: 380)
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
        if (player?.position.x)! >= 7860 {
            if !position7860x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    self!.spawnStone()
                }, SKAction.wait(forDuration: 13.0)])))
                position7860x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 900 {
            if !position900x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position900x = true
        }
        //Puddle2
        if (player?.position.x)! >= 1060 {
            if !position2060x {
                spawnPuddlePractileEmitter2()
            }
            position2060x = true
        }
        
        if (player?.position.x)! >= 3060 {
            if !position3060x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position3060x = true
        }
        //Puddle3
        if (player?.position.x)! >= 2000 {
            if !position3000x {
                spawnPuddlePractileEmitter3()
            }
            position3000x = true
        }
        
        if (player?.position.x)! >= 4000 {
            if !position4000x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position4000x = true
        }
        //Puddle4
        if (player?.position.x)! >= 4560 {
            if !position5560x {
                spawnPuddlePractileEmitter4()
            }
            position5560x = true
        }
        
        if (player?.position.x)! >= 6560 {
            if !position6560x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position6560x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 380 {
            if !position380x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position380x = true
        }
        
        if (player?.position.x)! >= 1380 {
            if !position1380x {
                enemy1?.removeFromParent()
            }
            position1380x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1340 {
            if !position1340x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1340x = true
        }
        
        if (player?.position.x)! >= 2340 {
            if !position2340x {
                enemy2?.removeFromParent()
            }
            position2340x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 1600 {
            if !position1600x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position1600x = true
        }
        
        if (player?.position.x)! >= 2600 {
            if !position2600x {
                enemy3?.removeFromParent()
            }
            position2600x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 1860 {
            if !position1860x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position1860x = true
        }
        
        if (player?.position.x)! >= 2860 {
            if !position2860x {
                enemy4?.removeFromParent()
            }
            position2860x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 2820 {
            if !position2820x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position2820x = true
        }
        
        if (player?.position.x)! >= 3820 {
            if !position3820x {
                enemy5?.removeFromParent()
            }
            position3820x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 4200 {
            if !position4200x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position4200x = true
        }
        
        if (player?.position.x)! >= 5200 {
            if !position5200x {
                enemy6?.removeFromParent()
            }
            position5200x = true
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
        if (player?.position.x)! >= 5180 {
            if !position5180x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position5180x = true
        }
        if (player?.position.x)! >= 6180 {
            if !position6180x {
                enemy8?.removeFromParent()
            }
            position6180x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 5320 {
            if !position5320x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position5320x = true
        }
        if (player?.position.x)! >= 6320 {
            if !position6320x {
                enemy9?.removeFromParent()
            }
            position6320x = true
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
        if (player?.position.x)! >= 5820 {
            if !position5820x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position5820x = true
        }
        
        if (player?.position.x)! >= 6820 {
            if !position6820x {
                enemy11?.removeFromParent()
            }
            position6820x = true
        }
        //Skeleton12
        if (player?.position.x)! >= 6240 {
            if !position6240x {
                spawnSkeleton12()
                stateMachineSkeleton12()
                physicsBodyEnemy12()
            }
            position6240x = true
        }
        
        if (player?.position.x)! >= 7240 {
            if !position7240x {
                enemy12?.removeFromParent()
            }
            position7240x = true
        }
        //Skeleton13
        if (player?.position.x)! >= 6970 {
            if !position6970x {
                spawnSkeleton13()
                stateMachineSkeleton13()
                physicsBodyEnemy13()
            }
            position6970x = true
        }
        
        if (player?.position.x)! >= 7970 {
            if !position7970x {
                enemy13?.removeFromParent()
            }
            position7970x = true
        }
        //Skeleton14
        if (player?.position.x)! >= 7050 {
            if !position7050x {
                spawnSkeleton14()
                stateMachineSkeleton14()
                physicsBodyEnemy14()
            }
            position7050x = true
        }
        
        if (player?.position.x)! >= 8050 {
            if !position8050x {
                enemy14?.removeFromParent()
            }
            position8050x = true
        }
        //Portal
        if (player?.position.x)! >= 8640 {
            if !position8640x {
                spawnPortalEmitter()
            }
            position8640x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel12")
            
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

