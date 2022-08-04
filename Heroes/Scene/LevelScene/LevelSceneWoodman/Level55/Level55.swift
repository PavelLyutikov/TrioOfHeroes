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
class Level55: GameScene {
    
    var position1600x: Bool = false
    var position2700x: Bool = false
    var position2450x: Bool = false
    var position3550x: Bool = false
    var position3470x: Bool = false
    var position4570x: Bool = false
    var position4410x: Bool = false
    var position5510x: Bool = false
    var position6380x: Bool = false
    var position7480x: Bool = false
    var position8720x: Bool = false
    var position9820x: Bool = false
    var position10450x: Bool = false
    var position11550x: Bool = false
    var position14710x: Bool = false
    var position15810x: Bool = false
    var position16230x: Bool = false
    var position17330x: Bool = false
    var position17580x: Bool = false
    var position14340x: Bool = false
    var position16340x: Bool = false
    var position16540x: Bool = false
    var position7360x: Bool = false
    var position8940x: Bool = false
    var position2000x: Bool = false
    var position2680x: Bool = false
    var position9760x: Bool = false
    var position13760x: Bool = false
    var position800x: Bool = false
    var position1860x: Bool = false
    var position13750x: Bool = false
    var position19160x: Bool = false
    
    var trapAction1: SKNode?
    var trapAction2: SKNode?
    var trapAction3: SKNode?

    var groundFakeAction1: SKNode?
    var groundFakeAction2: SKNode?
    var groundFakeAction3: SKNode?
    var groundFakeAction4: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        trapAction1 = childNode(withName: "trapAction1")
        trapAction2 = childNode(withName: "trapAction2")
        trapAction3 = childNode(withName: "trapAction3")
        
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
    }
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {
        let actionMove = SKAction.moveTo(y: 80, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 3.0)

        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.7)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 2.7)
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
        let actionMove = SKAction.moveTo(y: 80, duration: 2.4)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 2.4)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction4!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -160, duration: 2.9)
        let actionMoveBack = SKAction.moveTo(y: -70, duration: 0.9)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.7)
        let actionMoveBack = SKAction.moveTo(y: -70, duration: 1.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -70, duration: 3.3)
        let actionMoveBack = SKAction.moveTo(y: -160, duration: 0.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction3!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 14340, y: -60)
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
            portal.position = CGPoint(x: 14325, y: -60)
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
            stone.position = CGPoint(x: 2540, y: 135)
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
            portal.position = CGPoint(x: 2540, y: 140)
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
            stone.position = CGPoint(x: 13500, y: 245)
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
        
        Timer.scheduledTimer(withTimeInterval: 12.0, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal2() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 13500, y: 250)
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
            stone.position = CGPoint(x: 1580, y: 135)
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
            portal.position = CGPoint(x: 1580, y: 140)
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
        if (player?.position.x)! >= 2000 {
            if !position2000x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2680x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2680x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position2000x = true
            }
        }
        if (player?.position.x)! >= 2680 {
            if !position2680x {
                position2680x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 9760 {
            if !position9760x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13760x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 14.4)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13760x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                position9760x = true
            }
        }
        if (player?.position.x)! >= 13760 {
            if !position13760x {
                position13760x = true
            }
        }
        //TrapBall_3
        if (player?.position.x)! >= 800 {
            if !position800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1860x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1860x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 4.1)])))
                position800x = true
            }
        }
        if (player?.position.x)! >= 1860 {
            if !position1860x {
                position1860x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 13750 {
            if !position13750x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position19160x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 3.7)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position19160x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position19160x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 8.8)])))
                position13750x = true
            }
        }
        if (player?.position.x)! >= 19160 {
            if !position19160x {
                position19160x = true
            }
        }
        //GroundAction_1-4
        if (player?.position.x)! >= 16540 {
            if !position16540x {
                actionGround1()
                actionGround2()
                actionGround3()
                actionGround4()
            }
            position16540x = true
        }
        //TrapAction1_2_3
        if (player?.position.x)! >= 7360 {
            if !position7360x {
                actionTrap1()
                actionTrap2()
                actionTrap3()
            }
            position7360x = true
        }
        if (player?.position.x)! >= 8940 {
            if !position8940x {
                trapAction1?.removeFromParent()
                trapAction2?.removeFromParent()
                trapAction3?.removeFromParent()
            }
            position8940x = true
        }
        //Puddle1
        if (player?.position.x)! >= 14340 {
            if !position14340x {
                spawnPuddlePractileEmitter()
            }
            position14340x = true
        }
        if (player?.position.x)! >= 16340 {
            if !position16340x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position16340x = true
        }
        //Goblin1
        if (player?.position.x)! >= 1600 {
            if !position1600x {
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
            position1600x = true
        }
        if (player?.position.x)! >= 2700 {
            if !position2700x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position2700x = true
        }
        //Goblin2
        if (player?.position.x)! >= 2450 {
            if !position2450x {
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
            position2450x = true
        }
        if (player?.position.x)! >= 3550 {
            if !position3550x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position3550x = true
        }
        //Goblin3
        if (player?.position.x)! >= 3470 {
            if !position3470x {
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
            position3470x = true
        }
        if (player?.position.x)! >= 4570 {
            if !position4570x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position4570x = true
        }
        //Goblin4
        if (player?.position.x)! >= 4410 {
            if !position4410x {
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
            position4410x = true
        }
        if (player?.position.x)! >= 5510 {
            if !position5510x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position5510x = true
        }
        //Goblin5
        if (player?.position.x)! >= 6380 {
            if !position6380x {
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
            position6380x = true
        }
        if (player?.position.x)! >= 7480 {
            if !position7480x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position7480x = true
        }
        //Goblin6
        if (player?.position.x)! >= 8720 {
            if !position8720x {
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
            position8720x = true
        }
        if (player?.position.x)! >= 9820 {
            if !position9820x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position9820x = true
        }
        //Goblin7
        if (player?.position.x)! >= 10450 {
            if !position10450x {
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
            position10450x = true
        }
        if (player?.position.x)! >= 11550 {
            if !position11550x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position11550x = true
        }
        //Goblin8
        if (player?.position.x)! >= 14710 {
            if !position14710x {
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
            position14710x = true
        }
        if (player?.position.x)! >= 15810 {
            if !position15810x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position15810x = true
        }
        //Goblin9
        if (player?.position.x)! >= 16230 {
            if !position16230x {
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
            position16230x = true
        }
        if (player?.position.x)! >= 17330 {
            if !position17330x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position17330x = true
        }
        
        //Portal
        if (player?.position.x)! >= 17580 {
            if !position17580x {
                spawnPortalRedEmitter()
            }
            position17580x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel55")
            
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
