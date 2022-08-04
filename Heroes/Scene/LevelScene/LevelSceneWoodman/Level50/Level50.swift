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
class Level50: GameScene {
    
    var position310x: Bool = false
    var position1410x: Bool = false
    var position1420x: Bool = false
    var position2520x: Bool = false
    var position2420x: Bool = false
    var position3520x: Bool = false
    var position4450x: Bool = false
    var position5550x: Bool = false
    var position6020x: Bool = false
    var position7120x: Bool = false
    var position9340x: Bool = false
    var position10440x: Bool = false
    var position10280x: Bool = false
    var position11380x: Bool = false
    var position11140x: Bool = false
    var position12240x: Bool = false
    var position12020x: Bool = false
    var position13120x: Bool = false
    var position14220x: Bool = false
    var position15320x: Bool = false
    var position15350x: Bool = false
    var position16450x: Bool = false
    var position17090x: Bool = false
    var position17110x: Bool = false
    var position11660x: Bool = false
    var position13660x: Bool = false
    var position9440x: Bool = false
    var position11120x: Bool = false
    var position6380x: Bool = false
    var position7280x: Bool = false
    var position2920x: Bool = false
    var position5000x: Bool = false
    var position4160x: Bool = false
    var position6240x: Bool = false
    var position3760x: Bool = false
    var position5640x: Bool = false
    var position1560x: Bool = false
    var position3360x: Bool = false
    var position7720x: Bool = false
    var position9590x: Bool = false
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    var groundAction2_1: SKNode?
    var groundAction2_2: SKNode?
    var groundAction2_3: SKNode?
    var groundAction2_4: SKNode?
    
    var groundAction3: SKNode?
    var groundAction4: SKNode?
    var groundAction5: SKNode?
    var groundAction7: SKNode?
    
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
        
        groundAction3 = childNode(withName: "groundAction3")
        groundAction4 = childNode(withName: "groundAction4")
        groundAction5 = childNode(withName: "groundAction5")
        groundAction7 = childNode(withName: "groundAction7")
        
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
    }
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {
        let actionMove = SKAction.moveTo(x: 4000, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 4755, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        let actionMove2 = SKAction.moveTo(x: 4045, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 4800, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)

        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(x: 5180, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 6015, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        let actionMove2 = SKAction.moveTo(x: 5225, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 6060, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)

        groundAction2_1!.run(SKAction.sequence([repeatAction]))
        groundAction2_2!.run(SKAction.sequence([repeatAction]))
        groundAction2_3!.run(SKAction.sequence([repeatAction2]))
        groundAction2_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround3() {
        let actionMove = SKAction.moveTo(y: -120, duration: 4.1)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 4.1)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround4() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.8)
        let actionMoveBack = SKAction.moveTo(y: 0, duration: 2.8)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundAction4!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround5() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.8)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 2.8)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundAction5!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround7() {
        let actionMove = SKAction.moveTo(x: 8760, duration: 5.0)
        let actionMoveBack = SKAction.moveTo(x: 9400, duration: 5.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundAction7!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 10280, y: -80)
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
            portal.position = CGPoint(x: 10265, y: -80)
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
            stone.position = CGPoint(x: 7010, y: 175)
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
            portal.position = CGPoint(x: 7010, y: 180)
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
        if (player?.position.x)! >= 6380 {
            if !position6380x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7280x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7280x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position6380x = true
            }
        }
        if (player?.position.x)! >= 7280 {
            if !position7280x {
                position7280x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 9440 {
            if !position9440x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11120x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11120x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 3.4)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11120x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 11.1)])))
                position9440x = true
            }
        }
        if (player?.position.x)! >= 11120 {
            if !position11120x {
                position11120x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 2920 {
            if !position2920x {
                actionGround1()
            }
            position2920x = true
        }
        if (player?.position.x)! >= 5000 {
            if !position5000x {
                groundAction1_1?.removeFromParent()
                groundAction1_2?.removeFromParent()
                groundAction1_3?.removeFromParent()
                groundAction1_4?.removeFromParent()
            }
            position5000x = true
        }
        //GroundAction_2
        if (player?.position.x)! >= 4160 {
            if !position4160x {
                actionGround2()
            }
            position4160x = true
        }
        if (player?.position.x)! >= 6240 {
            if !position6240x {
                groundAction2_1?.removeFromParent()
                groundAction2_2?.removeFromParent()
                groundAction2_3?.removeFromParent()
                groundAction2_4?.removeFromParent()
            }
            position6240x = true
        }
        //GroundAction_3
        if (player?.position.x)! >= 3760 {
            if !position3760x {
                actionGround3()
            }
            position3760x = true
        }
        if (player?.position.x)! >= 5640 {
            if !position5640x {
                groundAction3?.removeFromParent()
            }
            position5640x = true
        }
        //GroundAction_4_5
        if (player?.position.x)! >= 1560 {
            if !position1560x {
                actionGround4()
                actionGround5()
            }
            position1560x = true
        }
        if (player?.position.x)! >= 3360 {
            if !position3360x {
                groundAction4?.removeFromParent()
                groundAction5?.removeFromParent()
            }
            position3360x = true
        }
        //GroundAction_7
        if (player?.position.x)! >= 7720 {
            if !position7720x {
                actionGround7()
            }
            position7720x = true
        }
        if (player?.position.x)! >= 9590 {
            if !position9590x {
                groundAction7?.removeFromParent()
            }
            position9590x = true
        }
        //Puddle1
        if (player?.position.x)! >= 11660 {
            if !position11660x {
                spawnPuddlePractileEmitter()
            }
            position11660x = true
        }
        if (player?.position.x)! >= 13660 {
            if !position13660x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position13660x = true
        }
        //Goblin1
        if (player?.position.x)! >= 310 {
            if !position310x {
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
            position310x = true
        }
        if (player?.position.x)! >= 1410 {
            if !position1410x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1410x = true
        }
        //Goblin2
        if (player?.position.x)! >= 1420 {
            if !position1420x {
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
            position1420x = true
        }
        if (player?.position.x)! >= 2520 {
            if !position2520x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position2520x = true
        }
        //Goblin3
        if (player?.position.x)! >= 2420 {
            if !position2420x {
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
            position2420x = true
        }
        if (player?.position.x)! >= 3520 {
            if !position3520x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position3520x = true
        }
        //Goblin4
        if (player?.position.x)! >= 4450 {
            if !position4450x {
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
            position4450x = true
        }
        if (player?.position.x)! >= 5550 {
            if !position5550x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position5550x = true
        }
        //Goblin5
        if (player?.position.x)! >= 6020 {
            if !position6020x {
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
            position6020x = true
        }
        if (player?.position.x)! >= 7120 {
            if !position7120x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position7120x = true
        }
        //Goblin6
        if (player?.position.x)! >= 9340 {
            if !position9340x {
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
            position9340x = true
        }
        if (player?.position.x)! >= 10440 {
            if !position10440x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position10440x = true
        }
        //Goblin7
        if (player?.position.x)! >= 10280 {
            if !position10280x {
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
            position10280x = true
        }
        if (player?.position.x)! >= 11380 {
            if !position11380x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position11380x = true
        }
        //Goblin8
        if (player?.position.x)! >= 11140 {
            if !position11140x {
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
            position11140x = true
        }
        if (player?.position.x)! >= 12240 {
            if !position12240x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position12240x = true
        }
        //Goblin9
        if (player?.position.x)! >= 12020 {
            if !position12020x {
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
            position12020x = true
        }
        if (player?.position.x)! >= 13120 {
            if !position13120x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position13120x = true
        }
        //Goblin10
        if (player?.position.x)! >= 14220 {
            if !position14220x {
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
            position14220x = true
        }
        if (player?.position.x)! >= 15320 {
            if !position15320x {
                enemy10?.removeFromParent()
                contactAxePlayer10 = false
            }
            position15320x = true
        }
        //Goblin11
        if (player?.position.x)! >= 15350 {
            if !position15350x {
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
            position15350x = true
        }
        if (player?.position.x)! >= 16450 {
            if !position16450x {
                enemy11?.removeFromParent()
                contactAxePlayer11 = false
            }
            position16450x = true
        }
        //Goblin12
        if (player?.position.x)! >= 17090 {
            if !position17090x {
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
            position17090x = true
        }
        
        //Portal
        if (player?.position.x)! >= 17110 {
            if !position17110x {
                spawnPortalRedEmitter()
            }
            position17110x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel50")
            
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
