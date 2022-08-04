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
class Level31: GameScene {
    
    var position0x: Bool = false
    var position2740x: Bool = false
    var position3740x: Bool = false
    var position3630x: Bool = false
    var position4630x: Bool = false
    var position5390x: Bool = false
    var position6390x: Bool = false
    var position6080x: Bool = false
    var position7080x: Bool = false
    var position6780x: Bool = false
    var position7780x: Bool = false
    var position7690x: Bool = false
    var position8690x: Bool = false
    var position11450x: Bool = false
    var position11540x: Bool = false
    var position890x: Bool = false
    var position540x: Bool = false
    var position2540x: Bool = false
    var position4010x: Bool = false
    var position6010x: Bool = false
    var position7180x: Bool = false
    var position9180x: Bool = false
    var position9360x: Bool = false
    var position11360x: Bool = false
    var position1520x: Bool = false
    var position3200x: Bool = false
    var position2400x: Bool = false
    var position4080x: Bool = false
    var position5760x: Bool = false
    var position7240x: Bool = false
    var position8610x: Bool = false
    var position10160x: Bool = false
    var position800x: Bool = false
    var position1560x: Bool = false
    var position5420x: Bool = false
    var position6400x: Bool = false
    var position10800x: Bool = false
    var position11600x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 2850, y: -80)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -43, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.3)
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
            portal.position = CGPoint(x: 2865, y: -80)
            portal.zPosition = 2
            portal.zRotation = 4.7
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
    func spawnArrowEnemy2() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 3730, y: 20)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -43, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.8)
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
            portal.position = CGPoint(x: 3745, y: 20)
            portal.zPosition = 2
            portal.zRotation = 4.7
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
    func spawnArrowEnemy3() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 6990, y: -50)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -40, dy: 0)
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
            portal.position = CGPoint(x: 7005, y: -50)
            portal.zPosition = 2
            portal.zRotation = 4.7
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
    func spawnArrowEnemy4() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 9060, y: -20)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 50, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.7)
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
            portal.position = CGPoint(x: 9045, y: -20)
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
            stone.position = CGPoint(x: 1320, y: 165)
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
            portal.position = CGPoint(x: 1320, y: 170)
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
            stone.position = CGPoint(x: 6050, y: 135)
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
            portal.position = CGPoint(x: 6050, y: 140)
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
            stone.position = CGPoint(x: 11360, y: 245)
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
            portal.position = CGPoint(x: 11360, y: 250)
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
        
        //TrapBall_1
        if (player?.position.x)! >= 800 {
            if !position800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1560x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 2.6)])))
                position800x = true
            }
        }
        if (player?.position.x)! >= 1560 {
            if !position1560x {
                position1560x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 5420 {
            if !position5420x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6400x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 6.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6400x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6400x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.2)])))
                position5420x = true
            }
        }
        if (player?.position.x)! >= 6400 {
            if !position6400x {
                position6400x = true
            }
        }
        //TrapBall_3
        if (player?.position.x)! >= 10800 {
            if !position10800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11600x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 5.2)])))
                position10800x = true
            }
        }
        if (player?.position.x)! >= 11600 {
            if !position11600x {
                position11600x = true
            }
        }
        //FireBall_1
        if (player?.position.x)! >= 1520 {
            if !position1520x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3200x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 3.3)])))
                position1520x = true
            }
        }
        if (player?.position.x)! >= 3200 {
            if !position3200x {
                position3200x = true
            }
        }
        //FireBall_2
        if (player?.position.x)! >= 2400 {
            if !position2400x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4080x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                position2400x = true
            }
        }
        if (player?.position.x)! >= 4080 {
            if !position4080x {
                position4080x = true
            }
        }
        //FireBall_3
        if (player?.position.x)! >= 5760 {
            if !position5760x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7240x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                position5760x = true
            }
        }
        if (player?.position.x)! >= 7240 {
            if !position7240x {
                position7240x = true
            }
        }
        //FireBall_4
        if (player?.position.x)! >= 8610 {
            if !position8610x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10160x == false {
                    self!.spawnArrowEnemy4()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                position8610x = true
            }
        }
        if (player?.position.x)! >= 10160 {
            if !position10160x {
                position10160x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 0 {
            if !position0x {
                spawnPuddlePractileEmitter()
            }
            position0x = true
        }
        if (player?.position.x)! >= 890 {
            if !position890x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position890x = true
        }
        //Puddle2
        if (player?.position.x)! >= 540 {
            if !position540x {
                spawnPuddlePractileEmitter2()
            }
            position540x = true
        }
        if (player?.position.x)! >= 2540 {
            if !position2540x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position2540x = true
        }
        //Puddle3
        if (player?.position.x)! >= 4010 {
            if !position4010x {
                spawnPuddlePractileEmitter3()
            }
            position4010x = true
        }
        if (player?.position.x)! >= 6010 {
            if !position6010x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position6010x = true
        }
        //Puddle4
        if (player?.position.x)! >= 7180 {
            if !position7180x {
                spawnPuddlePractileEmitter4()
            }
            position7180x = true
        }
        if (player?.position.x)! >= 9180 {
            if !position9180x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position9180x = true
        }
        //Puddle5
        if (player?.position.x)! >= 9360 {
            if !position9360x {
                spawnPuddlePractileEmitter5()
            }
            position9360x = true
        }
        if (player?.position.x)! >= 11360 {
            if !position11360x {
                puddle5?.removeFromParent()
                puddleAnimation5.removeFromParent()
            }
            position11360x = true
        }
        //Goblin1
        if (player?.position.x)! >= 2640 {
            if !position2740x {
                spawnGoblin1()
                stateMachineGoblin1()
                physicsBodyEnemy1()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer == true {
                            self!.spawnAxe()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position2740x = true
        }
        if (player?.position.x)! >= 3740 {
            if !position3740x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position3740x = true
        }
        //Goblin2
        if (player?.position.x)! >= 3530 {
            if !position3630x {
                spawnGoblin2()
                stateMachineGoblin2()
                physicsBodyEnemy2()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer2 == true {
                            self!.spawnAxe2()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position3630x = true
        }
        if (player?.position.x)! >= 4630 {
            if !position4630x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position4630x = true
        }
        //Goblin3
        if (player?.position.x)! >= 5290 {
            if !position5390x {
                spawnGoblin3()
                stateMachineGoblin3()
                physicsBodyEnemy3()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer3 == true {
                            self!.spawnAxe3()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position5390x = true
        }
        if (player?.position.x)! >= 6390 {
            if !position6390x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position6390x = true
        }
        //Goblin4
        if (player?.position.x)! >= 5980 {
            if !position6080x {
                spawnGoblin4()
                stateMachineGoblin4()
                physicsBodyEnemy4()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer4 == true {
                            self!.spawnAxe4()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position6080x = true
        }
        if (player?.position.x)! >= 7080 {
            if !position7080x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position7080x = true
        }
        //Goblin5
        if (player?.position.x)! >= 6680 {
            if !position6780x {
                spawnGoblin5()
                stateMachineGoblin5()
                physicsBodyEnemy5()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer5 == true {
                            self!.spawnAxe5()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position6780x = true
        }
        if (player?.position.x)! >= 7780 {
            if !position7780x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position7780x = true
        }
        //Goblin6
        if (player?.position.x)! >= 7590 {
            if !position7690x {
                spawnGoblin6()
                stateMachineGoblin6()
                physicsBodyEnemy6()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer6 == true {
                            self!.spawnAxe6()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position7690x = true
        }
        if (player?.position.x)! >= 8690 {
            if !position8690x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position8690x = true
        }
        //Goblin7
        if (player?.position.x)! >= 11350 {
            if !position11450x {
                spawnGoblin7()
                stateMachineGoblin7()
                physicsBodyEnemy7()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer7 == true {
                            self!.spawnAxe7()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position11450x = true
        }
        
        //Portal
        if (player?.position.x)! >= 11540 {
            if !position11540x {
                spawnPortalRedEmitter()
            }
            position11540x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel31")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        }
    }
}

