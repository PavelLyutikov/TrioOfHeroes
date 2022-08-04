//
//  Level36.swift
//  Elon's Adventure
//
//  Created by mac on 08.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level54: GameScene {
    
    var position510x: Bool = false
    var position1610x: Bool = false
    var position4560x: Bool = false
    var position5660x: Bool = false
    var position6410x: Bool = false
    var position7510x: Bool = false
    var position9010x: Bool = false
    var position10110x: Bool = false
    var position11250x: Bool = false
    var position12350x: Bool = false
    var position12440x: Bool = false
    var position13540x: Bool = false
    var position13640x: Bool = false
    var position14740x: Bool = false
    var position14420x: Bool = false
    var position15520x: Bool = false
    var position16280x: Bool = false
    var position17380x: Bool = false
    var position17300x: Bool = false
    var position17370x: Bool = false
    var position14760x: Bool = false
    var position17230x: Bool = false
    var position960x: Bool = false
    var position1800x: Bool = false
    var position10080x: Bool = false
    var position10700x: Bool = false
    var position10400x: Bool = false
    var position10940x: Bool = false
    var position10640x: Bool = false
    var position11200x: Bool = false
    var position13720x: Bool = false
    var position14600x: Bool = false
    var position3120x: Bool = false
    var position4480x: Bool = false
    var position9360x: Bool = false
    var position10440x: Bool = false
    var position1680x: Bool = false
    var position3760x: Bool = false
    var position1340x: Bool = false
    var position2580x: Bool = false
    var position2960x: Bool = false
    var position4720x: Bool = false
    var position5240x: Bool = false
    var position6400x: Bool = false
    var position6320x: Bool = false
    var position9080x: Bool = false
    
    var trapAction1: SKNode?
    var trapAction2: SKNode?
    var trapAction3: SKNode?
    var trapAction4: SKNode?

    var groundFakeAction1: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        trapAction1 = childNode(withName: "trapAction1")
        trapAction2 = childNode(withName: "trapAction2")
        trapAction3 = childNode(withName: "trapAction3")
        trapAction4 = childNode(withName: "trapAction4")
        
        groundFakeAction1 = childNode(withName: "groundFakeAction1")
        
        spawnTorch1()
        spawnTorch2()
        spawnTorch3()
        spawnTorch4()
        spawnTorch5()
        spawnTorch6()
        spawnTorch7()
        spawnTorch8()
        spawnTorch9()
        spawnTorch10()
        spawnTorch11()
        spawnTorch12()
        spawnTorch13()
        spawnTorch14()
        spawnTorch15()
    }
//MARK: - SpawnStone
func spawnStone() {
        let stone = SKSpriteNode(imageNamed: "stone")
        stone.name = "Stone"
        stone.setScale(0.6)
        stone.position = CGPoint(x: 8800, y: 320)
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

        Timer.scheduledTimer(withTimeInterval: 12.0, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
}
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {
        let actionMove = SKAction.moveTo(y: 80, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 3.0)
        
        let actionMoveX = SKAction.moveTo(x: 2600, duration: 4.0)
        let actionMoveBackX = SKAction.moveTo(x: 3320, duration: 4.0)
        
        let sequence = SKAction.sequence([actionMove, actionMoveBack, actionMoveX, actionMoveBackX])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -160, duration: 2.9)
        let actionMoveBack = SKAction.moveTo(y: -80, duration: 0.9)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.7)
        let actionMoveBack = SKAction.moveTo(y: -90, duration: 1.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -90, duration: 3.3)
        let actionMoveBack = SKAction.moveTo(y: -160, duration: 0.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap4() {
        let actionMove = SKAction.moveTo(y: -40, duration: 1.5)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 2.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction4!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 3600, y: -60)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 25, dy: 0)
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
            portal.position = CGPoint(x: 3585, y: -60)
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
    func spawnArrowEnemy2() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 9750, y: -90)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 25, dy: 0)
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
            portal.position = CGPoint(x: 9735, y: -90)
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
    func spawnTrapBall1() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 1580, y: 165)
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
    func spawnPortal1() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 1580, y: 170)
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
            stone.position = CGPoint(x: 10570, y: 165)
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
            portal.position = CGPoint(x: 10570, y: 170)
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
            stone.position = CGPoint(x: 10830, y: 165)
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
            portal.position = CGPoint(x: 10830, y: 170)
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
            stone.position = CGPoint(x: 11080, y: 165)
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
    func spawnPortal4() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 11080, y: 170)
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
            stone.position = CGPoint(x: 14350, y: 175)
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
    func spawnPortal5() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 14350, y: 180)
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
 //MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        //Stone
        if (player?.position.x)! >= 5320 {
            if !position6320x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9080x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 17)])))
                position6320x = true
            }
        }
        if (player?.position.x)! >= 9080 {
            if !position9080x {
                position9080x = true
            }
        }
        //TrapBall_1
        if (player?.position.x)! >= 860 {
            if !position960x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1800x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1800x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position960x = true
            }
        }
        if (player?.position.x)! >= 1800 {
            if !position1800x {
                position1800x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 10080 {
            if !position10080x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10700x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10700x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                position10080x = true
            }
        }
        if (player?.position.x)! >= 10700 {
            if !position10700x {
                position10700x = true
            }
        }
        //TrapBall_3
        if (player?.position.x)! >= 10400 {
            if !position10400x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10940x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10940x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 6.1)])))
                position10400x = true
            }
        }
        if (player?.position.x)! >= 10940 {
            if !position10940x {
                position10940x = true
            }
        }
        //TrapBall_4
        if (player?.position.x)! >= 10640 {
            if !position10640x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11200x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11200x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 8.3)])))
                position10640x = true
            }
        }
        if (player?.position.x)! >= 11200 {
            if !position11200x {
                position11200x = true
            }
        }
        //TrapBall_5
        if (player?.position.x)! >= 13720 {
            if !position13720x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position14600x == false {
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position14600x == false {
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position14600x == false {
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                    }
                }, SKAction.wait(forDuration: 15.3)])))
                position13720x = true
            }
        }
        if (player?.position.x)! >= 14600 {
            if !position14600x {
                position14600x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 3120 {
            if !position3120x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4480x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.9)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4480x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4480x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 8.8)])))
                position3120x = true
            }
        }
        if (player?.position.x)! >= 4480 {
            if !position4480x {
                position4480x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 9360 {
            if !position9360x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10440x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 2.9)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10440x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10440x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 11.1)])))
                position9360x = true
            }
        }
        if (player?.position.x)! >= 10440 {
            if !position10440x {
                position10440x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 1680 {
            if !position1680x {
                actionGround1()
            }
            position1680x = true
        }
        if (player?.position.x)! >= 3760 {
            if !position3760x {
                groundFakeAction1?.removeFromParent()
            }
            position3760x = true
        }
        //TrapAction_1
        if (player?.position.x)! >= 1340 {
            if !position1340x {
                actionTrap1()
            }
            position1340x = true
        }
        if (player?.position.x)! >= 2580 {
            if !position2580x {
                trapAction1?.removeFromParent()
            }
            position2580x = true
        }
        //TrapAction_2_3
        if (player?.position.x)! >= 2960 {
            if !position2960x {
                actionTrap2()
                actionTrap3()
            }
            position2960x = true
        }
        if (player?.position.x)! >= 4720 {
            if !position4720x {
                trapAction2?.removeFromParent()
                trapAction3?.removeFromParent()
            }
            position4720x = true
        }
        //TrapAction_4
        if (player?.position.x)! >= 5240 {
            if !position5240x {
                actionTrap4()
            }
            position5240x = true
        }
        if (player?.position.x)! >= 6400 {
            if !position6400x {
                trapAction4?.removeFromParent()
            }
            position6400x = true
        }
        //Puddle1_2_3
        if (player?.position.x)! >= 14760 {
            if !position14760x {
                spawnPuddlePractileEmitter()
                spawnPuddlePractileEmitter2()
                spawnPuddlePractileEmitter3()
            }
            position14760x = true
        }
        if (player?.position.x)! >= 17230 {
            if !position17230x {
                puddle?.removeFromParent()
                puddle2?.removeFromParent()
                puddle3?.removeFromParent()
                puddleAnimation.removeFromParent()
                puddleAnimation2.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position17230x = true
        }
        //Goblin1
        if (player?.position.x)! >= 510 {
            if !position510x {
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
            position510x = true
        }
        if (player?.position.x)! >= 1610 {
            if !position1610x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1610x = true
        }
        //Goblin2
        if (player?.position.x)! >= 4560 {
            if !position4560x {
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
            position4560x = true
        }
        if (player?.position.x)! >= 5660 {
            if !position5660x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position5660x = true
        }
        //Goblin3
        if (player?.position.x)! >= 6410 {
            if !position6410x {
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
            position6410x = true
        }
        if (player?.position.x)! >= 7510 {
            if !position7510x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position7510x = true
        }
        //Goblin4
        if (player?.position.x)! >= 9010 {
            if !position9010x {
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
            position9010x = true
        }
        if (player?.position.x)! >= 10110 {
            if !position10110x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position10110x = true
        }
        //Goblin5
        if (player?.position.x)! >= 11250 {
            if !position11250x {
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
            position11250x = true
        }
        if (player?.position.x)! >= 12350 {
            if !position12350x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position12350x = true
        }
        //Goblin6
        if (player?.position.x)! >= 12440 {
            if !position12440x {
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
            position12440x = true
        }
        if (player?.position.x)! >= 13540 {
            if !position13540x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position13540x = true
        }
        //Goblin7
        if (player?.position.x)! >= 13640 {
            if !position13640x {
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
            position13640x = true
        }
        if (player?.position.x)! >= 14740 {
            if !position14740x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position14740x = true
        }
        //Goblin8
        if (player?.position.x)! >= 14420 {
            if !position14420x {
                spawnGoblin8()
                stateMachineGoblin8()
                physicsBodyEnemy8()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer8 == true {
                            self!.spawnAxe8()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position14420x = true
        }
        if (player?.position.x)! >= 15520 {
            if !position15520x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position15520x = true
        }
        //Goblin9
        if (player?.position.x)! >= 16280 {
            if !position16280x {
                spawnGoblin9()
                stateMachineGoblin9()
                physicsBodyEnemy9()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer9 == true {
                            self!.spawnAxe9()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position16280x = true
        }
        if (player?.position.x)! >= 17380 {
            if !position17380x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position17380x = true
        }
        //Goblin10
        if (player?.position.x)! >= 17300 {
            if !position17300x {
                spawnGoblin10()
                stateMachineGoblin10()
                physicsBodyEnemy10()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer10 == true {
                            self!.spawnAxe10()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position17300x = true
        }
        
        //Portal
        if (player?.position.x)! >= 17370 {
            if !position17370x {
                spawnPortalRedEmitter()
            }
            position17370x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel54")
            
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
