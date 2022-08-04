//
//  Level11.swift
//  Elon's Adventure
//
//  Created by mac on 22.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level11: GameScene {
    
    var position1350x: Bool = false
    var position2350x: Bool = false
    var position1640x: Bool = false
    var position2640x: Bool = false
    var position1850x: Bool = false
    var position2850x: Bool = false
    var position3180x: Bool = false
    var position4180x: Bool = false
    var position5170x: Bool = false
    var position6170x: Bool = false
    var position7500x: Bool = false
    var position8500x: Bool = false
    var position8600x: Bool = false
    var position8820x: Bool = false
    var position8780x: Bool = false
    var position1160x: Bool = false
    var position5420x: Bool = false
    var position6420x: Bool = false
    var position5790x: Bool = false
    var position6790x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        spawnPuddlePractileEmitter()
    }
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 6290, y: 165)
            stone.zPosition = 3
            addChild(stone)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 5)
            stone.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask
            
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true
        
        var textures: [SKTexture] = []
                for i in 1...7 {
                    textures.append(SKTexture(imageNamed: "trapBallAnimation/\(i)"))
                }

        let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.015)
        let appear = SKAction.scale(to: 0.6, duration: 0.2)
        let group = SKAction.group([actionPortal, appear])
            
            stone.run(SKAction.sequence([group]))
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 6290, y: 170)
            portal.zPosition = 2
            addChild(portal)
            
            var textures: [SKTexture] = []
                    for i in 1...13 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.06)

            let appearZoom = SKAction.scale(to: 1.3, duration: 0.4)
            let disappear = SKAction.scale(to: 0.4, duration: 0.2)
            let group = SKAction.group([actionPortal, appearZoom])
            let remove = SKAction.removeFromParent()

            portal.run(SKAction.sequence([group, remove]))
        
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            portal.run(SKAction.sequence([disappear]))
            }
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
        
        //TrapPortal_1
        if (player?.position.x)! >= 5790 {
            if !position5790x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6790x == false{
                    self!.spawnPortal()
                    self!.spawnTrapBall()
                    }
                }, SKAction.wait(forDuration: 4.0)])))
                position5790x = true
            }
        }
                
        if (player?.position.x)! >= 6790 {
            if !position6790x {
                position6790x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 1160 {
            if !position1160x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position1160x = true
        }
        //Puddle2
        if (player?.position.x)! >= 4520 {
            if !position5420x {
                spawnPuddlePractileEmitter2()
            }
            position5420x = true
        }
        
        if (player?.position.x)! >= 6420 {
            if !position6420x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position6420x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 1350 {
            if !position1350x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position1350x = true
        }
        
        if (player?.position.x)! >= 2350 {
            if !position2350x {
                enemy1?.removeFromParent()
            }
            position2350x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1640 {
            if !position1640x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1640x = true
        }
        
        if (player?.position.x)! >= 2640 {
            if !position2640x {
                enemy2?.removeFromParent()
            }
            position2640x = true
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
        if (player?.position.x)! >= 3180 {
            if !position3180x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position3180x = true
        }
        
        if (player?.position.x)! >= 4180 {
            if !position4180x {
                enemy4?.removeFromParent()
            }
            position4180x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 5170 {
            if !position5170x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position5170x = true
        }
        
        if (player?.position.x)! >= 6170 {
            if !position6170x {
                enemy5?.removeFromParent()
            }
            position6170x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 7500 {
            if !position7500x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position7500x = true
        }
        
        if (player?.position.x)! >= 8500 {
            if !position8500x {
                enemy6?.removeFromParent()
            }
            position8500x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 8600 {
            if !position8600x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position8600x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 8820 {
            if !position8820x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position8820x = true
        }
        //Portal
        if (player?.position.x)! >= 8780 {
            if !position8780x {
                spawnPortalEmitter()
            }
            position8780x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel11")
            
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

