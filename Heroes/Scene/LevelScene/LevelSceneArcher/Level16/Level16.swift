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
class Level16: GameScene {
    
    var position1610x: Bool = false
    var position330x: Bool = false
    var position2330x: Bool = false
    var position2570x: Bool = false
    var position4570x: Bool = false
    var position4110x: Bool = false
    var position6110x: Bool = false
    var position1380x: Bool = false
    var position2380x: Bool = false
    var position1880x: Bool = false
    var position2880x: Bool = false
    var position2400x: Bool = false
    var position3400x: Bool = false
    var position2780x: Bool = false
    var position3780x: Bool = false
    var position4800x: Bool = false
    var position5800x: Bool = false
    var position5040x: Bool = false
    var position6040x: Bool = false
    var position6360x: Bool = false
    var position7360x: Bool = false
    var position6520x: Bool = false
    var position7520x: Bool = false
    var position7100x: Bool = false
    var position8100x: Bool = false
    var position7350x: Bool = false
    var position8350x: Bool = false
    var position8410x: Bool = false
    var position2910x: Bool = false
    var position3910x: Bool = false
    var position3280x: Bool = false
    var position4280x: Bool = false
    var position5330x: Bool = false
    var position6330x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnPuddlePractileEmitter()
    }
    
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 3490, y: 165)
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
        let appear = SKAction.scale(to: 0.6, duration: 0.3)
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
            portal.position = CGPoint(x: 3490, y: 170)
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
            stone.position = CGPoint(x: 3780, y: 205)
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
        let appear = SKAction.scale(to: 0.6, duration: 0.3)
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
            portal.position = CGPoint(x: 3780, y: 210)
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
    func spawnTrapBall3() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 5830, y: 265)
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
    func spawnPortal3() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 5830, y: 270)
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
        if (player?.position.x)! >= 2910 {
            if !position2910x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3910x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                position2910x = true
            }
        }
        if (player?.position.x)! >= 3910 {
            if !position3910x {
                position3910x = true
            }
        }
        //TrapBool_2
        if (player?.position.x)! >= 3280 {
            if !position3280x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4280x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 10.0)])))
                position3280x = true
            }
        }
        if (player?.position.x)! >= 4280 {
            if !position4280x {
                position4280x = true
            }
        }
        //TrapBool_3
        if (player?.position.x)! >= 5330 {
            if !position5330x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6330x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                position5330x = true
            }
        }
        if (player?.position.x)! >= 6330 {
            if !position6330x {
                position6330x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 1610 {
            if !position1610x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position1610x = true
        }
        //Puddle2
        if (player?.position.x)! >= 330 {
            if !position330x {
                spawnPuddlePractileEmitter2()
            }
            position330x = true
        }
        
        if (player?.position.x)! >= 2330 {
            if !position2330x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position2330x = true
        }
        //Puddle3
        if (player?.position.x)! >= 2570 {
            if !position2570x {
                spawnPuddlePractileEmitter3()
            }
            position2570x = true
        }
        
        if (player?.position.x)! >= 4570 {
            if !position4570x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position4570x = true
        }
        //Puddle4
        if (player?.position.x)! >= 4110 {
            if !position4110x {
                spawnPuddlePractileEmitter4()
            }
            position4110x = true
        }
        
        if (player?.position.x)! >= 6110 {
            if !position6110x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position6110x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 1380 {
            if !position1380x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position1380x = true
        }
        
        if (player?.position.x)! >= 2380 {
            if !position2380x {
                enemy1?.removeFromParent()
            }
            position2380x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1880 {
            if !position1880x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1880x = true
        }
        
        if (player?.position.x)! >= 2880 {
            if !position2880x {
                enemy2?.removeFromParent()
            }
            position2880x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 2400 {
            if !position2400x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position2400x = true
        }
        
        if (player?.position.x)! >= 3400 {
            if !position3400x {
                enemy3?.removeFromParent()
            }
            position3400x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 2780 {
            if !position2780x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position2780x = true
        }
        
        if (player?.position.x)! >= 3780 {
            if !position3780x {
                enemy4?.removeFromParent()
            }
            position3780x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 4800 {
            if !position4800x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position4800x = true
        }
        
        if (player?.position.x)! >= 5800 {
            if !position5800x {
                enemy5?.removeFromParent()
            }
            position5800x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 5040 {
            if !position5040x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position5040x = true
        }
        if (player?.position.x)! >= 6040 {
            if !position6040x {
                enemy6?.removeFromParent()
            }
            position6040x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 6360 {
            if !position6360x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position6360x = true
        }
        if (player?.position.x)! >= 7360 {
            if !position7360x {
                enemy7?.removeFromParent()
            }
            position7360x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 6520 {
            if !position6520x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position6520x = true
        }
        if (player?.position.x)! >= 7520 {
            if !position7520x {
                enemy8?.removeFromParent()
            }
            position7520x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 7100 {
            if !position7100x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position7100x = true
        }
        if (player?.position.x)! >= 8100 {
            if !position8100x {
                enemy9?.removeFromParent()
            }
            position8100x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 7350 {
            if !position7350x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position7350x = true
        }
        if (player?.position.x)! >= 8350 {
            if !position8350x {
                enemy10?.removeFromParent()
            }
            position8350x = true
        }
        //Portal
        if (player?.position.x)! >= 8410 {
            if !position8410x {
                spawnPortalEmitter()
            }
            position8410x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel16")
            
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

