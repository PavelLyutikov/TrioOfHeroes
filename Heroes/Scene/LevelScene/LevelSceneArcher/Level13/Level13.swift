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
class Level13: GameScene {
    
    var position610x: Bool = false
    var position1610x: Bool = false
    var position840x: Bool = false
    var position1840x: Bool = false
    var position3100x: Bool = false
    var position4100x: Bool = false
    var position3320x: Bool = false
    var position4320x: Bool = false
    var position4620x: Bool = false
    var position5620x: Bool = false
    var position7350x: Bool = false
    var position8350x: Bool = false
    var position8060x: Bool = false
    var position9060x: Bool = false
    var position8800x: Bool = false
    var position8700x: Bool = false
    var position8650x: Bool = false
    var position2040x: Bool = false
    var position2940x: Bool = false
    var position4940x: Bool = false
    var position6500x: Bool = false
    var position8500x: Bool = false
    var position2500x: Bool = false
    var position3500x: Bool = false
    var position8180x: Bool = false
    var position9180x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnPuddlePractileEmitter()
    }
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 3000, y: 125)
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
            portal.position = CGPoint(x: 3000, y: 130)
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
    func spawnTrapBall2() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 8670, y: 205)
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
    func spawnPortal2() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 8670, y: 210)
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
        
        //TrapBool_1
        if (player?.position.x)! >= 2500 {
            if !position2500x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3500x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 5.0)])))
                position2500x = true
            }
        }
        if (player?.position.x)! >= 3500 {
            if !position3500x {
                position3500x = true
            }
        }
        //TrapBool_2
        if (player?.position.x)! >= 8180 {
            if !position8180x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9180x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.0)])))
                position8180x = true
            }
        }
        if (player?.position.x)! >= 9180 {
            if !position9180x {
                position9180x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 2040 {
            if !position2040x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position2040x = true
        }
        //Puddle2
        if (player?.position.x)! >= 2940 {
            if !position2940x {
                spawnPuddlePractileEmitter2()
            }
            position2940x = true
        }
        
        if (player?.position.x)! >= 4940 {
            if !position4940x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position4940x = true
        }
        //Puddle3
        if (player?.position.x)! >= 6500 {
            if !position6500x {
                spawnPuddlePractileEmitter3()
            }
            position6500x = true
        }
        
        if (player?.position.x)! >= 8500 {
            if !position8500x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position8500x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 610 {
            if !position610x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position610x = true
        }
        
        if (player?.position.x)! >= 1610 {
            if !position1610x {
                enemy1?.removeFromParent()
            }
            position1610x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 840 {
            if !position840x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position840x = true
        }
        
        if (player?.position.x)! >= 1840 {
            if !position1840x {
                enemy2?.removeFromParent()
            }
            position1840x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 3100 {
            if !position3100x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position3100x = true
        }
        
        if (player?.position.x)! >= 4100 {
            if !position4100x {
                enemy3?.removeFromParent()
            }
            position4100x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 3320 {
            if !position3320x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position3320x = true
        }
        
        if (player?.position.x)! >= 4320 {
            if !position4320x {
                enemy4?.removeFromParent()
            }
            position4320x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 4620 {
            if !position4620x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position4620x = true
        }
        
        if (player?.position.x)! >= 5620 {
            if !position5620x {
                enemy5?.removeFromParent()
            }
            position5620x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 7350 {
            if !position7350x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position7350x = true
        }
        
        if (player?.position.x)! >= 8350 {
            if !position8350x {
                enemy6?.removeFromParent()
            }
            position8350x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 8060 {
            if !position8060x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position8060x = true
        }
        if (player?.position.x)! >= 9060 {
            if !position9060x {
                enemy7?.removeFromParent()
            }
            position9060x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 8800 {
            if !position8800x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position8800x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 8700 {
            if !position8700x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position8700x = true
        }
        //Portal
        if (player?.position.x)! >= 8650 {
            if !position8650x {
                spawnPortalEmitter()
            }
            position8650x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel13")
            
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

