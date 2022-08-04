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
class Level47: GameScene {
    
    var position650x: Bool = false
    var position1750x: Bool = false
    var position2110x: Bool = false
    var position3210x: Bool = false
    var position3580x: Bool = false
    var position4680x: Bool = false
    var position4220x: Bool = false
    var position5320x: Bool = false
    var position4810x: Bool = false
    var position5910x: Bool = false
    var position6750x: Bool = false
    var position7850x: Bool = false
    var position7320x: Bool = false
    var position8420x: Bool = false
    var position7920x: Bool = false
    var position9020x: Bool = false
    var position9440x: Bool = false
    var position10540x: Bool = false
    var position11730x: Bool = false
    var position12830x: Bool = false
    var position14220x: Bool = false
    var position15320x: Bool = false
    var position15900x: Bool = false
    var position17000x: Bool = false
    var position16460x: Bool = false
    var position16730x: Bool = false
    var position16740x: Bool = false
    var position1940x: Bool = false
    var position1060x: Bool = false
    var position3060x: Bool = false
    var position3920x: Bool = false
    var position4600x: Bool = false
    var position5040x: Bool = false
    var position7080x: Bool = false
    var position7020x: Bool = false
    var position7640x: Bool = false
    var position16120x: Bool = false
    var position16840x: Bool = false
    var position12040x: Bool = false
    var position14480x: Bool = false
    var position9400x: Bool = false
    var position11200x: Bool = false
    var position2200x: Bool = false
    var position3600x: Bool = false
    var position10480x: Bool = false
    var position12080x: Bool = false
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    var trapAction1: SKNode?
    var trapAction2: SKNode?
    var trapAction3: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        groundAction1_1 = childNode(withName: "groundAction1_1")
        groundAction1_2 = childNode(withName: "groundAction1_2")
        groundAction1_3 = childNode(withName: "groundAction1_3")
        groundAction1_4 = childNode(withName: "groundAction1_4")
        
        trapAction1 = childNode(withName: "trapAction1")
        trapAction2 = childNode(withName: "trapAction2")
        trapAction3 = childNode(withName: "trapAction3")
        
        spawnPuddlePractileEmitter()
        
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
        spawnTorch16()
        spawnTorch17()
        spawnTorch18()
        spawnTorch19()
    }
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {
        let actionMove = SKAction.moveTo(x: 13320, duration: 7.0)
        let actionMoveBack = SKAction.moveTo(x: 14155, duration: 7.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 13365, duration: 7.0)
        let actionMoveBack2 = SKAction.moveTo(x: 14200, duration: 7.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -120, duration: 0.8)
        let actionMoveBack = SKAction.moveTo(y: -240, duration: 2.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        trapAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -120, duration: 1.0)
        let actionMoveBack = SKAction.moveTo(y: -240, duration: 1.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        trapAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.0)
        let actionMoveBack = SKAction.moveTo(y: -240, duration: 0.8)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        trapAction3!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 2760, y: -40)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 25, dy: 0)
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
            portal.position = CGPoint(x: 2745, y: -40)
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
            arrow.position = CGPoint(x: 11080, y: -80)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 30, dy: 0)
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
            portal.position = CGPoint(x: 11065, y: -80)
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
            stone.position = CGPoint(x: 4460, y: 175)
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
            portal.position = CGPoint(x: 4460, y: 180)
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
            stone.position = CGPoint(x: 6920, y: 195)
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
            portal.position = CGPoint(x: 6920, y: 200)
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
            stone.position = CGPoint(x: 7520, y: 175)
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
            portal.position = CGPoint(x: 7520, y: 180)
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
            stone.position = CGPoint(x: 16720, y: 175)
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
            portal.position = CGPoint(x: 16720, y: 180)
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
        if (player?.position.x)! >= 3920 {
            if !position3920x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4600x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4600x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position3920x = true
            }
        }
        if (player?.position.x)! >= 4600 {
            if !position4600x {
                position4600x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 5040 {
            if !position5040x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7080x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7080x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 4.2)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7080x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7080x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 9.3)])))
                position5040x = true
            }
        }
        if (player?.position.x)! >= 7080 {
            if !position7080x {
                position7080x = true
            }
        }
        //TrapBall_3
        if (player?.position.x)! >= 7020 {
            if !position7020x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7640x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7640x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                position7020x = true
            }
        }
        if (player?.position.x)! >= 7640 {
            if !position7640x {
                position7640x = true
            }
        }
        //TrapBall_4
        if (player?.position.x)! >= 16120 {
            if !position16120x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position16840x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position16840x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                position16120x = true
            }
        }
        if (player?.position.x)! >= 16840 {
            if !position16840x {
                position16840x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 2200 {
            if !position2200x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3600x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3600x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3600x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 8.8)])))
                position2200x = true
            }
        }
        if (player?.position.x)! >= 3600 {
            if !position3600x {
                position3600x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 10480 {
            if !position10480x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12080x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12080x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12080x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 7.9)])))
                position10480x = true
            }
        }
        if (player?.position.x)! >= 12080 {
            if !position12080x {
                position12080x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 12040 {
            if !position12040x {
                actionGround1()
            }
            position12040x = true
        }
        if (player?.position.x)! >= 14480 {
            if !position14480x {
                groundAction1_1?.removeFromParent()
                groundAction1_2?.removeFromParent()
                groundAction1_3?.removeFromParent()
                groundAction1_4?.removeFromParent()
            }
            position14480x = true
        }
        //TrapAction_1_2_3
        if (player?.position.x)! >= 9400 {
            if !position9400x {
                actionTrap1()
                actionTrap2()
                actionTrap3()
            }
            position9400x = true
        }
        if (player?.position.x)! >= 11200 {
            if !position11200x {
                trapAction1?.removeFromParent()
                trapAction2?.removeFromParent()
                trapAction3?.removeFromParent()
            }
            position11200x = true
        }
        //Puddle1
        if (player?.position.x)! >= 1940 {
            if !position1940x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position1940x = true
        }
        //Puddle2
        if (player?.position.x)! >= 1060 {
            if !position1060x {
                spawnPuddlePractileEmitter2()
            }
            position1060x = true
        }
        if (player?.position.x)! >= 3060 {
            if !position3060x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position3060x = true
        }
        //Goblin1
        if (player?.position.x)! >= 650 {
            if !position650x {
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
            position650x = true
        }
        if (player?.position.x)! >= 1750 {
            if !position1750x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1750x = true
        }
        //Goblin2
        if (player?.position.x)! >= 2110 {
            if !position2110x {
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
            position2110x = true
        }
        if (player?.position.x)! >= 3210 {
            if !position3210x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position3210x = true
        }
        //Goblin3
        if (player?.position.x)! >= 3580 {
            if !position3580x {
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
            position3580x = true
        }
        if (player?.position.x)! >= 4680 {
            if !position4680x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position4680x = true
        }
        //Goblin4
        if (player?.position.x)! >= 4220 {
            if !position4220x {
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
            position4220x = true
        }
        if (player?.position.x)! >= 5320 {
            if !position5320x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position5320x = true
        }
        //Goblin5
        if (player?.position.x)! >= 4810 {
            if !position4810x {
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
            position4810x = true
        }
        if (player?.position.x)! >= 5910 {
            if !position5910x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position5910x = true
        }
        //Goblin6
        if (player?.position.x)! >= 6750 {
            if !position6750x {
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
            position6750x = true
        }
        if (player?.position.x)! >= 7850 {
            if !position7850x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position7850x = true
        }
        //Goblin7
        if (player?.position.x)! >= 7320 {
            if !position7320x {
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
            position7320x = true
        }
        if (player?.position.x)! >= 8420 {
            if !position8420x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position8420x = true
        }
        //Goblin8
        if (player?.position.x)! >= 7920 {
            if !position7920x {
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
            position7920x = true
        }
        if (player?.position.x)! >= 9020 {
            if !position9020x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position9020x = true
        }
        //Goblin9
        if (player?.position.x)! >= 9440 {
            if !position9440x {
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
            position9440x = true
        }
        if (player?.position.x)! >= 10540 {
            if !position10540x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position10540x = true
        }
        //Goblin10
        if (player?.position.x)! >= 11730 {
            if !position11730x {
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
            position11730x = true
        }
        if (player?.position.x)! >= 12830 {
            if !position12830x {
                enemy10?.removeFromParent()
                contactAxePlayer10 = false
            }
            position12830x = true
        }
        //Goblin11
        if (player?.position.x)! >= 14220 {
            if !position14220x {
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
            position14220x = true
        }
        if (player?.position.x)! >= 15320 {
            if !position15320x {
                enemy11?.removeFromParent()
                contactAxePlayer11 = false
            }
            position15320x = true
        }
        //Goblin12
        if (player?.position.x)! >= 15900 {
            if !position15900x {
                spawnGoblin12()
                stateMachineGoblin12()
                physicsBodyEnemy12()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer12 == true {
                            self!.spawnAxe12()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position15900x = true
        }
        if (player?.position.x)! >= 17000 {
            if !position17000x {
                enemy12?.removeFromParent()
                contactAxePlayer12 = false
            }
            position17000x = true
        }
        //Goblin13
        if (player?.position.x)! >= 16460 {
            if !position16460x {
                spawnGoblin13()
                stateMachineGoblin13()
                physicsBodyEnemy13()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer13 == true {
                            self!.spawnAxe13()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position16460x = true
        }
        //Goblin14
        if (player?.position.x)! >= 16730 {
            if !position16730x {
                spawnGoblin14()
                stateMachineGoblin14()
                physicsBodyEnemy14()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer14 == true {
                            self!.spawnAxe14()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position16730x = true
        }
        
        //Portal
        if (player?.position.x)! >= 16740 {
            if !position16740x {
                spawnPortalRedEmitter()
            }
            position16740x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel47")
            
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
