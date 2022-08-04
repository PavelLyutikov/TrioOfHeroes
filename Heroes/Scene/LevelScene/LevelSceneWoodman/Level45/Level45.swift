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
class Level45: GameScene {
    
    var position390x: Bool = false
    var position1490x: Bool = false
    var position600x: Bool = false
    var position1700x: Bool = false
    var position4070x: Bool = false
    var position5170x: Bool = false
    var position4680x: Bool = false
    var position5780x: Bool = false
    var position5730x: Bool = false
    var position6830x: Bool = false
    var position10090x: Bool = false
    var position11190x: Bool = false
    var position10840x: Bool = false
    var position11940x: Bool = false
    var position11890x: Bool = false
    var position12990x: Bool = false
    var position14530x: Bool = false
    var position15630x: Bool = false
    var position15660x: Bool = false
    var position16760x: Bool = false
    var position16650x: Bool = false
    var position1250x: Bool = false
    var position4180x: Bool = false
    var position6180x: Bool = false
    var position9050x: Bool = false
    var position11050x: Bool = false
    var position11500x: Bool = false
    var position13500x: Bool = false
    var position16610x: Bool = false
    var position2200x: Bool = false
    var position3200x: Bool = false
    var position6800x: Bool = false
    var position9120x: Bool = false
    var position13920x: Bool = false
    var position15040x: Bool = false
    var position1360x: Bool = false
    var position2040x: Bool = false
    var position3800x: Bool = false
    var position5100x: Bool = false
    var position2320x: Bool = false
    var position4000x: Bool = false
    var position8080x: Bool = false
    var position10440x: Bool = false
    var position14800x: Bool = false
    var position15800x: Bool = false
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    var groundAction2_1: SKNode?
    var groundAction2_2: SKNode?
    var groundAction2_3: SKNode?
    var groundAction2_4: SKNode?
    
    var groundAction3_1: SKNode?
    var groundAction3_2: SKNode?
    var groundAction3_3: SKNode?
    var groundAction3_4: SKNode?
    
    var groundFakeAction1: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        groundAction1_1 = childNode(withName: "groundAction1_1")
        groundAction1_2 = childNode(withName: "groundAction1_2")
        groundAction1_3 = childNode(withName: "groundAction1_3")
        groundAction1_4 = childNode(withName: "groundAction1_4")
        
        groundAction2_1 = childNode(withName: "groundAction2_1")
        groundAction2_2 = childNode(withName: "groundAction2_2")
        groundAction2_3 = childNode(withName: "groundAction2_3")
        groundAction2_4 = childNode(withName: "groundAction2_4")
        
        groundAction3_1 = childNode(withName: "groundAction3_1")
        groundAction3_2 = childNode(withName: "groundAction3_2")
        groundAction3_3 = childNode(withName: "groundAction3_3")
        groundAction3_4 = childNode(withName: "groundAction3_4")
        
        groundFakeAction1 = childNode(withName: "groundFakeAction1")
        
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
    }
//MARK: - SpawnActionGround
    func actionGround() {
        let actionMove = SKAction.moveTo(x: 2480, duration: 4.0)
        let actionMoveBack = SKAction.moveTo(x: 2960, duration: 4.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 2525, duration: 4.0)
        let actionMoveBack2 = SKAction.moveTo(x: 3005, duration: 4.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(x: 7120, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 7870, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 7165, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 7915, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction2_1!.run(SKAction.sequence([repeatAction]))
        groundAction2_2!.run(SKAction.sequence([repeatAction]))
        groundAction2_3!.run(SKAction.sequence([repeatAction2]))
        groundAction2_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround3() {
        let actionMove = SKAction.moveTo(x: 8785, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 8030, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 8830, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 8075, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction3_1!.run(SKAction.sequence([repeatAction]))
        groundAction3_2!.run(SKAction.sequence([repeatAction]))
        groundAction3_3!.run(SKAction.sequence([repeatAction2]))
        groundAction3_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround4() {
        let actionMove = SKAction.moveTo(y: 40, duration: 2.0)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 2.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 1970, y: -80)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -24, dy: 0)
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
            portal.position = CGPoint(x: 1985, y: -80)
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
            arrow.position = CGPoint(x: 4970, y: -20)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -20, dy: 0)
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
            portal.position = CGPoint(x: 4985, y: -20)
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
    func spawnTrapBall1() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 3760, y: 195)
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
    func spawnPortal1() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 3760, y: 200)
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
            stone.position = CGPoint(x: 10120, y: 185)
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
        
        Timer.scheduledTimer(withTimeInterval: 10.8, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal2() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 10120, y: 190)
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
            stone.position = CGPoint(x: 15570, y: 235)
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
            portal.position = CGPoint(x: 15570, y: 240)
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
        if (player?.position.x)! >= 2320 {
            if !position2320x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4000x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 3.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4000x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 5.6)])))
                position2320x = true
            }
        }
        if (player?.position.x)! >= 4000 {
            if !position4000x {
                position4000x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 8080 {
            if !position8080x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10440x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10440x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 7.9)])))
                position8080x = true
            }
        }
        if (player?.position.x)! >= 10440 {
            if !position10440x {
                position10440x = true
            }
        }
        //TrapBall_3
        if (player?.position.x)! >= 14800 {
            if !position14800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position15800x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 3.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position15800x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 5.2)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position15800x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 10.4)])))
                position14800x = true
            }
        }
        if (player?.position.x)! >= 15800 {
            if !position15800x {
                position15800x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 1360 {
            if !position1360x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2040x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.9)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2040x == false {
                        self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                position1360x = true
            }
        }
        if (player?.position.x)! >= 2040 {
            if !position2040x {
                position2040x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 3800 {
            if !position3800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5100x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 3.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5100x == false {
                        self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.1)])))
                position3800x = true
            }
        }
        if (player?.position.x)! >= 5100 {
            if !position5100x {
                position5100x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 2200 {
            if !position2200x {
                actionGround()
            }
            position2200x = true
        }
        if (player?.position.x)! >= 3600 {
            if !position3200x {
                groundAction1_1?.removeFromParent()
                groundAction1_2?.removeFromParent()
                groundAction1_3?.removeFromParent()
                groundAction1_4?.removeFromParent()
            }
            position3200x = true
        }
        //GroundAction_2_3
        if (player?.position.x)! >= 6800 {
            if !position6800x {
                actionGround2()
                actionGround3()
            }
            position6800x = true
        }
        if (player?.position.x)! >= 9120 {
            if !position9120x {
                groundAction2_1?.removeFromParent()
                groundAction2_2?.removeFromParent()
                groundAction2_3?.removeFromParent()
                groundAction2_4?.removeFromParent()
                groundAction3_1?.removeFromParent()
                groundAction3_2?.removeFromParent()
                groundAction3_3?.removeFromParent()
                groundAction3_4?.removeFromParent()
            }
            position9120x = true
        }
        //GroundAction_4
        if (player?.position.x)! >= 13920 {
            if !position13920x {
                actionGround4()
            }
            position13920x = true
        }
        if (player?.position.x)! >= 15040 {
            if !position15040x {
                groundFakeAction1?.removeFromParent()
            }
            position15040x = true
        }
        //Puddle1
        if (player?.position.x)! >= 1250 {
            if !position1250x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position1250x = true
        }
        //Puddle2
        if (player?.position.x)! >= 4180 {
            if !position4180x {
                spawnPuddlePractileEmitter2()
            }
            position4180x = true
        }
        if (player?.position.x)! >= 6180 {
            if !position6180x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position6180x = true
        }
        //Puddle3
        if (player?.position.x)! >= 9050 {
            if !position9050x {
                spawnPuddlePractileEmitter3()
            }
            position9050x = true
        }
        if (player?.position.x)! >= 11050 {
            if !position11050x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position11050x = true
        }
        //Puddle4
        if (player?.position.x)! >= 11500 {
            if !position11500x {
                spawnPuddlePractileEmitter4()
            }
            position11500x = true
        }
        if (player?.position.x)! >= 13500 {
            if !position13500x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position13500x = true
        }
        //Goblin1
        if (player?.position.x)! >= 390 {
            if !position390x {
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
            position390x = true
        }
        if (player?.position.x)! >= 1490 {
            if !position1490x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1490x = true
        }
        //Goblin2
        if (player?.position.x)! >= 600 {
            if !position600x {
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
            position600x = true
        }
        if (player?.position.x)! >= 1700 {
            if !position1700x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position1700x = true
        }
        //Goblin3
        if (player?.position.x)! >= 4070 {
            if !position4070x {
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
            position4070x = true
        }
        if (player?.position.x)! >= 5170 {
            if !position5170x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position5170x = true
        }
        //Goblin4
        if (player?.position.x)! >= 4680 {
            if !position4680x {
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
            position4680x = true
        }
        if (player?.position.x)! >= 5780 {
            if !position5780x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position5780x = true
        }
        //Goblin5
        if (player?.position.x)! >= 5730 {
            if !position5730x {
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
            position5730x = true
        }
        if (player?.position.x)! >= 6830 {
            if !position6830x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position6830x = true
        }
        //Goblin6
        if (player?.position.x)! >= 10090 {
            if !position10090x {
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
            position10090x = true
        }
        if (player?.position.x)! >= 11190 {
            if !position11190x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position11190x = true
        }
        //Goblin7
        if (player?.position.x)! >= 10840 {
            if !position10840x {
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
            position10840x = true
        }
        if (player?.position.x)! >= 11940 {
            if !position11940x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position11940x = true
        }
        //Goblin8
        if (player?.position.x)! >= 11890 {
            if !position11890x {
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
            position11890x = true
        }
        if (player?.position.x)! >= 12990 {
            if !position12990x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position12990x = true
        }
        //Goblin9
        if (player?.position.x)! >= 14530 {
            if !position14530x {
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
            position14530x = true
        }
        if (player?.position.x)! >= 15630 {
            if !position15630x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position15630x = true
        }
        //Goblin10
        if (player?.position.x)! >= 15660 {
            if !position15660x {
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
            position15660x = true
        }
        if (player?.position.x)! >= 16760 {
            if !position16760x {
                enemy10?.removeFromParent()
                contactAxePlayer10 = false
            }
            position16760x = true
        }
        //Goblin11
        if (player?.position.x)! >= 16650 {
            if !position16650x {
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
            position16650x = true
        }
        
        //Portal
        if (player?.position.x)! >= 16610 {
            if !position16610x {
                spawnPortalRedEmitter()
            }
            position16610x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel45")
            
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
