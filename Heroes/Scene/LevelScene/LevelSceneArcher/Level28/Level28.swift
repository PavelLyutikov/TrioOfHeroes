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
class Level28: GameScene {
    
    var position10x: Bool = false
    var position1010x: Bool = false
    var position1230x: Bool = false
    var position2230x: Bool = false
    var position1590x: Bool = false
    var position2590x: Bool = false
    var position2540x: Bool = false
    var position3540x: Bool = false
    var position2740x: Bool = false
    var position3740x: Bool = false
    var position5680x: Bool = false
    var position6680x: Bool = false
    var position5820x: Bool = false
    var position6820x: Bool = false
    var position8400x: Bool = false
    var position9400x: Bool = false
    var position8720x: Bool = false
    var position9720x: Bool = false
    var position9000x: Bool = false
    var position10000x: Bool = false
    var position12220x: Bool = false
    var position12440x: Bool = false
    var position1220x: Bool = false
    var position3220x: Bool = false
    var position6630x: Bool = false
    var position8630x: Bool = false
    var position12920x: Bool = false
    var position11680x: Bool = false
    var position13320x: Bool = false
    var position9360x: Bool = false
    var position12240x: Bool = false
    var position2800x: Bool = false
    var position5000x: Bool = false
    var position4520x: Bool = false
    var position5240x: Bool = false
    var position7840x: Bool = false
    var position8500x: Bool = false

    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
//MARK: - SpawnStone
    func spawnStone() {
        
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 11920, y: 320)
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
        
            Timer.scheduledTimer(withTimeInterval: 13.0, repeats: false) { (timer) in
                let remove = SKAction.removeFromParent()
                stone.run(SKAction.sequence([remove]))
            }
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 12080, y: -20)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 55, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.0)
            let groupArrow = SKAction.group([actionArrow, impulse])
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([groupArrow, remove]))
        
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask
        
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.4)
            portal.position = CGPoint(x: 12065, y: -20)
            portal.zPosition = 2
            portal.zRotation = 1.5
            addChild(portal)
            
            var textures: [SKTexture] = []
                    for i in 1...13 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.06)

            let appearZoom = SKAction.scale(to: 1.1, duration: 0.4)
            let disappear = SKAction.scale(to: 0.2, duration: 0.2)
            let group = SKAction.group([actionPortal, appearZoom])
            let removeArrow = SKAction.removeFromParent()

            portal.run(SKAction.sequence([group, removeArrow]))
        
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            portal.run(SKAction.sequence([disappear]))
            }
    }
//MARK: - PortalEndBall
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 4620, y: 235)
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
        
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 4620, y: 240)
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
            stone.position = CGPoint(x: 5100, y: 235)
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
            portal.position = CGPoint(x: 5100, y: 240)
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
            stone.position = CGPoint(x: 8330, y: 185)
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
            portal.position = CGPoint(x: 8330, y: 190)
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
        if (player?.position.x)! >= 2800 {
            if !position2800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5000x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 3.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5000x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position2800x = true
            }
        }
        if (player?.position.x)! >= 5000 {
            if !position5000x {
                position5000x = true
            }
        }
        //TrapBool_2
        if (player?.position.x)! >= 4520 {
            if !position4520x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5240x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5240x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                }
                }, SKAction.wait(forDuration: 3.2)])))
                position4520x = true
            }
        }
        if (player?.position.x)! >= 5240 {
            if !position5240x {
                position5240x = true
            }
        }
        //TrapBool_3
        if (player?.position.x)! >= 7840 {
            if !position7840x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8500x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 4.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8500x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 5.1)])))
                position7840x = true
            }
        }
        if (player?.position.x)! >= 8500 {
            if !position8500x {
                position8500x = true
            }
        }
        //Stone
        if (player?.position.x)! >= 9360 {
            if !position9360x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12240x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 6.2)])))
                position9360x = true
            }
        }
        if (player?.position.x)! >= 12240 {
            if !position12240x {
                position12240x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 11680 {
            if !position11680x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13320x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.9)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13320x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 6.7)])))
                position11680x = true
            }
        }
        if (player?.position.x)! >= 13320 {
            if !position13320x {
                position13320x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 1220 {
            if !position1220x {
                spawnPuddlePractileEmitter()
            }
            position1220x = true
        }
        if (player?.position.x)! >= 3220 {
            if !position3220x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position3220x = true
        }
        //Puddle2
        if (player?.position.x)! >= 6630 {
            if !position6630x {
                spawnPuddlePractileEmitter2()
            }
            position6630x = true
        }
        if (player?.position.x)! >= 8630 {
            if !position8630x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position8630x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 10 {
            if !position10x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position10x = true
        }
        if (player?.position.x)! >= 1010 {
            if !position1010x {
                enemy1?.removeFromParent()
            }
            position1010x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1230 {
            if !position1230x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1230x = true
        }
        
        if (player?.position.x)! >= 2230 {
            if !position2230x {
                enemy2?.removeFromParent()
            }
            position2230x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 1590 {
            if !position1590x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position1590x = true
        }
        
        if (player?.position.x)! >= 2590 {
            if !position2590x {
                enemy3?.removeFromParent()
            }
            position2590x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 2540 {
            if !position2540x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position2540x = true
        }
        
        if (player?.position.x)! >= 3540 {
            if !position3540x {
                enemy4?.removeFromParent()
            }
            position3540x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 2740 {
            if !position2740x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position2740x = true
        }
        if (player?.position.x)! >= 3740 {
            if !position3740x {
                enemy5?.removeFromParent()
            }
            position3740x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 5680 {
            if !position5680x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position5680x = true
        }
        if (player?.position.x)! >= 6680 {
            if !position6680x {
                enemy6?.removeFromParent()
            }
            position6680x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 5820 {
            if !position5820x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position5820x = true
        }
        if (player?.position.x)! >= 6820 {
            if !position6820x {
                enemy7?.removeFromParent()
            }
            position6820x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 8400 {
            if !position8400x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position8400x = true
        }
        if (player?.position.x)! >= 9400 {
            if !position9400x {
                enemy8?.removeFromParent()
            }
            position9400x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 8720 {
            if !position8720x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position8720x = true
        }
        if (player?.position.x)! >= 9720 {
            if !position9720x {
                enemy9?.removeFromParent()
            }
            position9720x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 9000 {
            if !position9000x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position9000x = true
        }
        if (player?.position.x)! >= 10000 {
            if !position10000x {
                enemy10?.removeFromParent()
            }
            position10000x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 12220 {
            if !position12220x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position12220x = true
        }
        //Skeleton12
        if (player?.position.x)! >= 12440 {
            if !position12440x {
                spawnSkeleton12()
                stateMachineSkeleton12()
                physicsBodyEnemy12()
            }
            position12440x = true
        }
        //Portal
        if (player?.position.x)! >= 12920 {
            if !position12920x {
                spawnPortalEmitter()
            }
            position12920x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel28")
            
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

