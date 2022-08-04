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
class Level58: GameScene {
    
    var position850x: Bool = false
    var position1950x: Bool = false
    var position1470x: Bool = false
    var position2570x: Bool = false
    var position4320x: Bool = false
    var position5420x: Bool = false
    var position6850x: Bool = false
    var position7950x: Bool = false
    var position10280x: Bool = false
    var position11380x: Bool = false
    var position11020x: Bool = false
    var position12120x: Bool = false
    var position13810x: Bool = false
    var position14910x: Bool = false
    var position16410x: Bool = false
    var position17510x: Bool = false
    var position17150x: Bool = false
    var position18250x: Bool = false
    var position18000x: Bool = false
    var position8910x: Bool = false
    var position10910x: Bool = false
    var position1840x: Bool = false
    var position3400x: Bool = false
    var position5440x: Bool = false
    var position6920x: Bool = false
    var position1080x: Bool = false
    var position1760x: Bool = false
    var position13240x: Bool = false
    var position13960x: Bool = false
    var position4330x: Bool = false
    var position7000x: Bool = false
    var position1160x: Bool = false
    var position2320x: Bool = false
    var position12500x: Bool = false
    var position14070x: Bool = false
    var position17680x: Bool = false
    var position18190x: Bool = false
    var position5920x: Bool = false
    var position8960x: Bool = false
    
    var trapAction1: SKNode?
    var trapAction2: SKNode?
    var trapAction3: SKNode?
    var trapAction4: SKNode?
    var trapAction5: SKNode?
    
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
        trapAction5 = childNode(withName: "trapAction5")

        groundAction1_1 = childNode(withName: "groundAction1_1")
        groundAction1_2 = childNode(withName: "groundAction1_2")
        groundAction1_3 = childNode(withName: "groundAction1_3")
        groundAction1_4 = childNode(withName: "groundAction1_4")

  

        
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
        stone.position = CGPoint(x: 8600, y: 320)
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

        let actionMove = SKAction.moveTo(x: 5440, duration: 12.0)
        let actionMoveBack = SKAction.moveTo(x: 6595, duration: 12.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        let actionMove2 = SKAction.moveTo(x: 5485, duration: 12.0)
        let actionMoveBack2 = SKAction.moveTo(x: 6640, duration: 12.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)

        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -200, duration: 2.5)
        let actionMoveBack = SKAction.moveTo(y: -110, duration: 1.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.7)
        let actionMoveBack = SKAction.moveTo(y: -75, duration: 1.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -160, duration: 3.3)
        let actionMoveBack = SKAction.moveTo(y: -75, duration: 0.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap4() {
        let actionMove = SKAction.moveTo(y: -90, duration: 1.5)
        let actionMoveBack = SKAction.moveTo(y: -160, duration: 2.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction4!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap5() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.9)
        let actionMoveBack = SKAction.moveTo(y: -90, duration: 2.1)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction5!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 3240, y: 20)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -35, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.3)
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
            portal.position = CGPoint(x: 3255, y: 20)
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
            arrow.position = CGPoint(x: 6780, y: -20)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -42, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.6)
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
            portal.position = CGPoint(x: 6795, y: -20)
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
            stone.position = CGPoint(x: 1590, y: 185)
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
            portal.position = CGPoint(x: 1590, y: 190)
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
            stone.position = CGPoint(x: 13690, y: 135)
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
            portal.position = CGPoint(x: 13690, y: 140)
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
        if (player?.position.x)! >= 5920 {
            if !position5920x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8960x == false {
                    self!.spawnStone()
                }
                }, SKAction.wait(forDuration: 11.9)])))
                position5920x = true
            }
        }
        if (player?.position.x)! >= 8960 {
            if !position8960x {
                position8960x = true
            }
        }
        //TrapBall_1
        if (player?.position.x)! >= 1080 {
            if !position1080x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1760x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1760x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                position1080x = true
            }
        }
        if (player?.position.x)! >= 1760 {
            if !position1760x {
                position1760x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 13240 {
            if !position13240x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13960x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 3.4)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13960x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.6)])))
                position13240x = true
            }
        }
        if (player?.position.x)! >= 13960 {
            if !position13960x {
                position13960x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 1840 {
            if !position1840x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3400x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3400x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 5.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3400x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 10.1)])))
                position1840x = true
            }
        }
        if (player?.position.x)! >= 3400 {
            if !position3400x {
                position3400x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 5440 {
            if !position5440x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6920x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 3.7)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6920x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                position5440x = true
            }
        }
        if (player?.position.x)! >= 6920 {
            if !position6920x {
                position6920x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 3030 {
            if !position4330x {
                actionGround1()
            }
            position4330x = true
        }
        if (player?.position.x)! >= 7000 {
            if !position7000x {
                groundAction1_1?.removeFromParent()
                groundAction1_2?.removeFromParent()
                groundAction1_3?.removeFromParent()
                groundAction1_4?.removeFromParent()
            }
            position7000x = true
        }
        //TrapAction1
        if (player?.position.x)! >= 1160 {
            if !position1160x {
                actionTrap1()
            }
            position1160x = true
        }
        if (player?.position.x)! >= 2320 {
            if !position2320x {
                trapAction1?.removeFromParent()
            }
            position2320x = true
        }
        //TrapAction2_3
        if (player?.position.x)! >= 12500 {
            if !position12500x {
                actionTrap2()
                actionTrap3()
            }
            position12500x = true
        }
        if (player?.position.x)! >= 14070 {
            if !position14070x {
                trapAction2?.removeFromParent()
                trapAction3?.removeFromParent()
            }
            position14070x = true
        }
        //TrapAction_4_5
        if (player?.position.x)! >= 17680 {
            if !position17680x {
                actionTrap4()
                actionTrap5()
            }
            position17680x = true
        }
        //Puddle1
        if (player?.position.x)! >= 8910 {
            if !position8910x {
                spawnPuddlePractileEmitter()
            }
            position8910x = true
        }
        if (player?.position.x)! >= 10910 {
            if !position10910x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position10910x = true
        }
        //Goblin1
        if (player?.position.x)! >= 850 {
            if !position850x {
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
            position850x = true
        }
        if (player?.position.x)! >= 1950 {
            if !position1950x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1950x = true
        }
        //Goblin2
        if (player?.position.x)! >= 1470 {
            if !position1470x {
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
            position1470x = true
        }
        if (player?.position.x)! >= 2570 {
            if !position2570x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position2570x = true
        }
        //Goblin3
        if (player?.position.x)! >= 4320 {
            if !position4320x {
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
            position4320x = true
        }
        if (player?.position.x)! >= 5420 {
            if !position5420x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position5420x = true
        }
        //Goblin4
        if (player?.position.x)! >= 6850 {
            if !position6850x {
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
            position6850x = true
        }
        if (player?.position.x)! >= 7950 {
            if !position7950x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position7950x = true
        }
        //Goblin5
        if (player?.position.x)! >= 10280 {
            if !position10280x {
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
            position10280x = true
        }
        if (player?.position.x)! >= 11380 {
            if !position11380x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position11380x = true
        }
        //Goblin6
        if (player?.position.x)! >= 11020 {
            if !position11020x {
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
            position11020x = true
        }
        if (player?.position.x)! >= 12120 {
            if !position12120x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position12120x = true
        }
        //Goblin7
        if (player?.position.x)! >= 13810 {
            if !position13810x {
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
            position13810x = true
        }
        if (player?.position.x)! >= 14910 {
            if !position14910x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position14910x = true
        }
        //Goblin8
        if (player?.position.x)! >= 16410 {
            if !position16410x {
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
            position16410x = true
        }
        if (player?.position.x)! >= 17510 {
            if !position17510x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position17510x = true
        }
        //Goblin9
        if (player?.position.x)! >= 17150 {
            if !position17150x {
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
            position17150x = true
        }
        if (player?.position.x)! >= 18250 {
            if !position18250x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position18250x = true
        }
        //Goblin10
        if (player?.position.x)! >= 18000 {
            if !position18000x {
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
            position18000x = true
        }
        
        //Portal
        if (player?.position.x)! >= 18190 {
            if !position18190x {
                spawnPortalRedEmitter()
            }
            position18190x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel58")
            
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
