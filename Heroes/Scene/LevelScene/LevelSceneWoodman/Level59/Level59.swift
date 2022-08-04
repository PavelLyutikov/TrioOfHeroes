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
class Level59: GameScene {
    
    var position240x: Bool = false
    var position1340x: Bool = false
    var position3160x: Bool = false
    var position4260x: Bool = false
    var position4090x: Bool = false
    var position5190x: Bool = false
    var position5200x: Bool = false
    var position6300x: Bool = false
    var position9030x: Bool = false
    var position10130x: Bool = false
    var position11030x: Bool = false
    var position12130x: Bool = false
    var position12090x: Bool = false
    var position13190x: Bool = false
    var position15040x: Bool = false
    var position16140x: Bool = false
    var position16740x: Bool = false
    var position17840x: Bool = false
    var position17900x: Bool = false
    var position18300x: Bool = false
    var position8800x: Bool = false
    var position11240x: Bool = false
    var position14840x: Bool = false
    var position17080x: Bool = false
    var position6020x: Bool = false
    var position7180x: Bool = false
    var position12560x: Bool = false
    var position14180x: Bool = false
    var position840x: Bool = false
    var position1480x: Bool = false
    var position760x: Bool = false
    var position2360x: Bool = false
    var position9440x: Bool = false
    var position11160x: Bool = false
    var position17720x: Bool = false
    var position18200x: Bool = false
    var position4280x: Bool = false
    var position5080x: Bool = false
    var position6360x: Bool = false
    var position8810x: Bool = false
    
    var trapAction1: SKNode?
    var trapAction2: SKNode?
    var trapAction3: SKNode?
    var trapAction4: SKNode?

    var groundFakeAction1: SKNode?
    var groundFakeAction2: SKNode?
    var groundFakeAction3: SKNode?
    var groundFakeAction4: SKNode?
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        trapAction1 = childNode(withName: "trapAction1")
        trapAction2 = childNode(withName: "trapAction2")
        trapAction3 = childNode(withName: "trapAction3")
        trapAction4 = childNode(withName: "trapAction4")

        groundAction1_1 = childNode(withName: "groundAction1_1")
        groundAction1_2 = childNode(withName: "groundAction1_2")
        groundAction1_3 = childNode(withName: "groundAction1_3")
        groundAction1_4 = childNode(withName: "groundAction1_4")
        
        groundFakeAction1 = childNode(withName: "groundFakeAction1")
        groundFakeAction2 = childNode(withName: "groundFakeAction2")
        groundFakeAction3 = childNode(withName: "groundFakeAction3")
        groundFakeAction4 = childNode(withName: "groundFakeAction4")
        
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
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {

        let actionMove = SKAction.moveTo(x: 9880, duration: 12.0)
        let actionMoveBack = SKAction.moveTo(x: 10855, duration: 12.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        let actionMove2 = SKAction.moveTo(x: 9925, duration: 12.0)
        let actionMoveBack2 = SKAction.moveTo(x: 10900, duration: 12.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)

        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround5() {
        let actionMove = SKAction.moveTo(y: -120, duration: 5.0)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 5.0)

        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(y: 80, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 3.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround3() {
        let actionMove = SKAction.moveTo(y: 80, duration: 2.0)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 2.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround4() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.4)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 2.4)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction4!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -50, duration: 2.5)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 1.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.7)
        let actionMoveBack = SKAction.moveTo(y: -80, duration: 1.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -160, duration: 3.3)
        let actionMoveBack = SKAction.moveTo(y: -80, duration: 0.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap4() {
        let actionMove = SKAction.moveTo(y: -80, duration: 1.5)
        let actionMoveBack = SKAction.moveTo(y: -160, duration: 2.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction4!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 1270, y: -60)
            arrow.zPosition = 30
            arrow.zRotation = -1.55
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 0, dy: 30)
            let impulse = SKAction.applyImpulse(action, duration: 1.6)
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
            portal.position = CGPoint(x: 1270, y: -85)
            portal.zPosition = 2
            portal.zRotation = 3.1
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
            arrow.position = CGPoint(x: 1220, y: -60)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 35, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.2)
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
            portal.position = CGPoint(x: 1205, y: -60)
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
    func spawnArrowEnemy3() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 9580, y: -60)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 45, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.9)
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
            portal.position = CGPoint(x: 9565, y: -60)
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
    func spawnArrowEnemy4() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 17990, y: -100)
            arrow.zPosition = 30
            arrow.zRotation = -1.55
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 0, dy: 30)
            let impulse = SKAction.applyImpulse(action, duration: 1.6)
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
            portal.position = CGPoint(x: 17990, y: -115)
            portal.zPosition = 2
            portal.zRotation = 3.1
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
            stone.position = CGPoint(x: 4880, y: 215)
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
            portal.position = CGPoint(x: 4880, y: 220)
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
            stone.position = CGPoint(x: 8300, y: 165)
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
            portal.position = CGPoint(x: 8300, y: 170)
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
        
        //TrapBall_1
        if (player?.position.x)! >= 4280 {
            if !position4280x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5080x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5080x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5080x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 14.4)])))
                position4280x = true
            }
        }
        if (player?.position.x)! >= 5080 {
            if !position5080x {
                position5080x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 6360 {
            if !position6360x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8800x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 3.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8800x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 6.4)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8800x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 14.3)])))
                position6360x = true
            }
        }
        if (player?.position.x)! >= 8800 {
            if !position8800x {
                position8800x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 840 {
            if !position840x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1480x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 1.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1480x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1480x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 1.8)])))
                position840x = true
            }
        }
        if (player?.position.x)! >= 1480 {
            if !position1480x {
                position1480x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 760 {
            if !position760x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2360x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 3.7)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2360x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2360x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 13.3)])))
                position760x = true
            }
        }
        if (player?.position.x)! >= 2360 {
            if !position2360x {
                position2360x = true
            }
        }
        //FireBool_3
        if (player?.position.x)! >= 9440 {
            if !position9440x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11160x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 2.9)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11160x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 5.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11160x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 12.1)])))
                position9440x = true
            }
        }
        if (player?.position.x)! >= 11160 {
            if !position11160x {
                position11160x = true
            }
        }
        //FireBool_4
        if (player?.position.x)! >= 17720 {
            if !position17720x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position18200x == false {
                    self!.spawnArrowEnemy4()
                    }
                }, SKAction.wait(forDuration: 1.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position18200x == false {
                    self!.spawnArrowEnemy4()
                    }
                }, SKAction.wait(forDuration: 1.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position18200x == false {
                    self!.spawnArrowEnemy4()
                    }
                }, SKAction.wait(forDuration: 1.8)])))
                position17720x = true
            }
        }
        if (player?.position.x)! >= 18200 {
            if !position18200x {
                position18200x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 8510 {
            if !position8810x {
                actionGround1()
            }
            position8810x = true
        }
        if (player?.position.x)! >= 11240 {
            if !position11240x {
                groundAction1_1?.removeFromParent()
                groundAction1_2?.removeFromParent()
                groundAction1_3?.removeFromParent()
                groundAction1_4?.removeFromParent()
            }
            position11240x = true
        }
        //GroundAction_2-5
        if (player?.position.x)! >= 14840 {
            if !position14840x {
                actionGround2()
                actionGround3()
                actionGround4()
                actionGround5()
            }
            position14840x = true
        }
        if (player?.position.x)! >= 17080 {
            if !position17080x {
                groundFakeAction1?.removeFromParent()
                groundFakeAction2?.removeFromParent()
                groundFakeAction3?.removeFromParent()
                groundFakeAction4?.removeFromParent()
            }
            position17080x = true
        }
        //TrapAction1
        if (player?.position.x)! >= 5820 {
            if !position6020x {
                actionTrap1()
            }
            position6020x = true
        }
        if (player?.position.x)! >= 7180 {
            if !position7180x {
                trapAction1?.removeFromParent()
            }
            position7180x = true
        }
        //TrapAction2_3_4
        if (player?.position.x)! >= 12560 {
            if !position12560x {
                actionTrap2()
                actionTrap3()
                actionTrap4()
            }
            position12560x = true
        }
        if (player?.position.x)! >= 14180 {
            if !position14180x {
                trapAction2?.removeFromParent()
                trapAction3?.removeFromParent()
                trapAction4?.removeFromParent()
            }
            position14180x = true
        }
        //Goblin1
        if (player?.position.x)! >= 240 {
            if !position240x {
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
            position240x = true
        }
        if (player?.position.x)! >= 1340 {
            if !position1340x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1340x = true
        }
        //Goblin2
        if (player?.position.x)! >= 3160 {
            if !position3160x {
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
            position3160x = true
        }
        if (player?.position.x)! >= 4260 {
            if !position4260x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position4260x = true
        }
        //Goblin3
        if (player?.position.x)! >= 4090 {
            if !position4090x {
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
            position4090x = true
        }
        if (player?.position.x)! >= 5190 {
            if !position5190x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position5190x = true
        }
        //Goblin4
        if (player?.position.x)! >= 5200 {
            if !position5200x {
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
            position5200x = true
        }
        if (player?.position.x)! >= 6300 {
            if !position6300x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position6300x = true
        }
        //Goblin5
        if (player?.position.x)! >= 9030 {
            if !position9030x {
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
            position9030x = true
        }
        if (player?.position.x)! >= 10130 {
            if !position10130x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position10130x = true
        }
        //Goblin6
        if (player?.position.x)! >= 11030 {
            if !position11030x {
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
            position11030x = true
        }
        if (player?.position.x)! >= 12130 {
            if !position12130x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position12130x = true
        }
        //Goblin7
        if (player?.position.x)! >= 12090 {
            if !position12090x {
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
            position12090x = true
        }
        if (player?.position.x)! >= 13190 {
            if !position13190x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position13190x = true
        }
        //Goblin8
        if (player?.position.x)! >= 15040 {
            if !position15040x {
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
            position15040x = true
        }
        if (player?.position.x)! >= 16140 {
            if !position16140x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position16140x = true
        }
        //Goblin9
        if (player?.position.x)! >= 16740 {
            if !position16740x {
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
            position16740x = true
        }
        if (player?.position.x)! >= 17840 {
            if !position17840x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position17840x = true
        }
        //Goblin10
        if (player?.position.x)! >= 17900 {
            if !position17900x {
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
            position17900x = true
        }
        //Goblin11
        if (player?.position.x)! >= 18300 {
            if !position18300x {
                spawnGoblin11()
                stateMachineGoblin11()
                physicsBodyEnemy11()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer11 == true {
                            self!.spawnAxe11()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position18300x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel59")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = LevelDialogue59(fileNamed: "LevelDialogue59")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        }
    }
}
