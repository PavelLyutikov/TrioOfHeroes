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
class Level30: GameScene {
    
    var position0x: Bool = false
    var position2230x: Bool = false
    var position4230x: Bool = false
    var position4330x: Bool = false
    var position6330x: Bool = false
    var position7500x: Bool = false
    var position9500x: Bool = false
    var position9040x: Bool = false
    var position11040x: Bool = false
    var position10670x: Bool = false
    var position12670x: Bool = false
    var position4080x: Bool = false
    var position5080x: Bool = false
    var position4280x: Bool = false
    var position5280x: Bool = false
    var position6850x: Bool = false
    var position7850x: Bool = false
    var position7020x: Bool = false
    var position8020x: Bool = false
    var position7170x: Bool = false
    var position8170x: Bool = false
    var position12040x: Bool = false
    var position13040x: Bool = false
    var position12270x: Bool = false
    var position13270x: Bool = false
    var position12440x: Bool = false
    var position13440x: Bool = false
    var position14040x: Bool = false
    var position4160x: Bool = false
    var position5960x: Bool = false
    var position2960x: Bool = false
    var position7200x: Bool = false
    var position8450x: Bool = false
    var position10360x: Bool = false
    var position11720x: Bool = false
    var position14000x: Bool = false
    
    var groundAction_1: SKNode?
    var groundAction_2: SKNode?
    var groundAction_3: SKNode?
    var groundAction_4: SKNode?
    var groundAction_5: SKNode?
    var groundAction_6: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        groundAction_1 = childNode(withName: "groundAction_1")
        groundAction_2 = childNode(withName: "groundAction_2")
        groundAction_3 = childNode(withName: "groundAction_3")
        groundAction_4 = childNode(withName: "groundAction_4")
        groundAction_5 = childNode(withName: "groundAction_5")
        groundAction_6 = childNode(withName: "groundAction_6")
    }
//MARK: - MoveGround
    func moveGround() {
        let actionMove1 = SKAction.moveTo(y: groundAction_1!.position.y + 120, duration: 2.0)
        let actionMove2 = SKAction.moveTo(y: groundAction_2!.position.y + 120, duration: 2.0)
        let actionMove3 = SKAction.moveTo(y: groundAction_3!.position.y + 120, duration: 2.0)
        let actionMove4 = SKAction.moveTo(y: groundAction_4!.position.y + 120, duration: 2.0)
        let actionMove5 = SKAction.moveTo(y: groundAction_5!.position.y + 120, duration: 2.0)
        let actionMove6 = SKAction.moveTo(y: groundAction_6!.position.y + 120, duration: 2.0)
        
        groundAction_1!.run(SKAction.sequence([actionMove1]))
        groundAction_2!.run(SKAction.sequence([actionMove2]))
        groundAction_3!.run(SKAction.sequence([actionMove3]))
        groundAction_4!.run(SKAction.sequence([actionMove4]))
        groundAction_5!.run(SKAction.sequence([actionMove5]))
        groundAction_6!.run(SKAction.sequence([actionMove6]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 5780, y: -80)
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
            portal.position = CGPoint(x: 5795, y: -80)
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
//MARK: - PortalEndBall
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 320, y: 205)
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
            portal.position = CGPoint(x: 320, y: 210)
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
            stone.position = CGPoint(x: 960, y: 165)
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
    func spawnPortal2() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 960, y: 170)
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
            stone.position = CGPoint(x: 1600, y: 135)
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
    func spawnPortal3() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 1600, y: 140)
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
    func spawnTrapBall4() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 2240, y: 95)
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
    func spawnPortal4() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 2240, y: 100)
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
    func spawnTrapBall5() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 8270, y: 215)
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
    func spawnPortal5() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 8270, y: 220)
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
    func spawnTrapBall6() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 11120, y: 185)
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
    func spawnPortal6() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 11120, y: 190)
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
        
        //TrapBool_1_2_3_4
        if (player?.position.x)! >= 0 {
            if !position0x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2960x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 3.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2960x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2960x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2960x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 3.2)])))
                position0x = true
            }
        }
        if (player?.position.x)! >= 2960 {
            if !position2960x {
                position2960x = true
            }
        }
        //TrapBool_5
        if (player?.position.x)! >= 7200 {
            if !position7200x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8450x == false {
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                    }
                }, SKAction.wait(forDuration: 4.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8450x == false {
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                    }
                }, SKAction.wait(forDuration: 5.1)])))
                position7200x = true
            }
        }
        if (player?.position.x)! >= 8450 {
            if !position8450x {
                position8450x = true
            }
        }
        //TrapBool_6
        if (player?.position.x)! >= 10360 {
            if !position10360x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11720x == false {
                    self!.spawnTrapBall6()
                    self!.spawnPortal6()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11720x == false {
                    self!.spawnTrapBall6()
                    self!.spawnPortal6()
                    }
                }, SKAction.wait(forDuration: 6.1)])))
                position10360x = true
            }
        }
        if (player?.position.x)! >= 11720 {
            if !position11720x {
                position11720x = true
            }
        }
        //BigSkeleton
        if (player?.position.x)! >= 14040 {
            if !position14040x {
                spawnBigSkeleton()
                position14040x = true
            }
        }
        //MoveGround
        if (player?.position.x)! >= 14000 {
            if !position14000x {
                moveGround()
                if backgroundMusic == true {
                    playBossSound(fileName: "backgroundMusicBoss.mp3")
                    backgroungGameArcherMusicPlayer.stop()
                }
                position14000x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 4160 {
            if !position4160x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5960x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5960x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 6.7)])))
                position4160x = true
            }
        }
        if (player?.position.x)! >= 5960 {
            if !position5960x {
                position5960x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 2230 {
            if !position2230x {
                spawnPuddlePractileEmitter()
            }
            position2230x = true
        }
        if (player?.position.x)! >= 4230 {
            if !position4230x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position4230x = true
        }
        //Puddle2
        if (player?.position.x)! >= 4330 {
            if !position4330x {
                spawnPuddlePractileEmitter2()
            }
            position4330x = true
        }
        if (player?.position.x)! >= 6330 {
            if !position6330x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position6330x = true
        }
        //Puddle3
        if (player?.position.x)! >= 7500 {
            if !position7500x {
                spawnPuddlePractileEmitter3()
            }
            position7500x = true
        }
        if (player?.position.x)! >= 9500 {
            if !position9500x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position9500x = true
        }
        //Puddle4
        if (player?.position.x)! >= 9040 {
            if !position9040x {
                spawnPuddlePractileEmitter4()
            }
            position9040x = true
        }
        if (player?.position.x)! >= 11040 {
            if !position11040x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position11040x = true
        }
        //Puddle5
        if (player?.position.x)! >= 10670 {
            if !position10670x {
                spawnPuddlePractileEmitter5()
            }
            position10670x = true
        }
        if (player?.position.x)! >= 12670 {
            if !position12670x {
                puddle5?.removeFromParent()
                puddleAnimation5.removeFromParent()
            }
            position12670x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 4080 {
            if !position4080x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position4080x = true
        }
        if (player?.position.x)! >= 5080 {
            if !position5080x {
                enemy1?.removeFromParent()
            }
            position5080x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 4280 {
            if !position4280x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position4280x = true
        }
        
        if (player?.position.x)! >= 5280 {
            if !position5280x {
                enemy2?.removeFromParent()
            }
            position5280x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 6850 {
            if !position6850x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position6850x = true
        }
        
        if (player?.position.x)! >= 7850 {
            if !position7850x {
                enemy3?.removeFromParent()
            }
            position7850x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 7020 {
            if !position7020x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position7020x = true
        }
        if (player?.position.x)! >= 8020 {
            if !position8020x {
                enemy4?.removeFromParent()
            }
            position8020x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 7170 {
            if !position7170x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position7170x = true
        }
        if (player?.position.x)! >= 8170 {
            if !position8170x {
                enemy5?.removeFromParent()
            }
            position8170x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 12040 {
            if !position12040x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position12040x = true
        }
        if (player?.position.x)! >= 13040 {
            if !position13040x {
                enemy6?.removeFromParent()
            }
            position13040x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 12270 {
            if !position12270x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position12270x = true
        }
        if (player?.position.x)! >= 13270 {
            if !position13270x {
                enemy7?.removeFromParent()
            }
            position13270x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 12440 {
            if !position12440x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position12440x = true
        }
        if (player?.position.x)! >= 13440 {
            if !position13440x {
                enemy8?.removeFromParent()
            }
            position13440x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel30")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = Level30GameOver(fileNamed: "Level30GameOver")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        }
    }
}

