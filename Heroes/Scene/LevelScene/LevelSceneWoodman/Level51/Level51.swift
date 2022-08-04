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
class Level51: GameScene {
    
    var position720x: Bool = false
    var position1820x: Bool = false
    var position1400x: Bool = false
    var position2500x: Bool = false
    var position4380x: Bool = false
    var position5480x: Bool = false
    var position5050x: Bool = false
    var position6150x: Bool = false
    var position5800x: Bool = false
    var position6900x: Bool = false
    var position7720x: Bool = false
    var position8820x: Bool = false
    var position9050x: Bool = false
    var position10150x: Bool = false
    var position11140x: Bool = false
    var position12240x: Bool = false
    var position12020x: Bool = false
    var position13120x: Bool = false
    var position14200x: Bool = false
    var position15300x: Bool = false
    var position15370x: Bool = false
    var position16470x: Bool = false
    var position17240x: Bool = false
    var position17260x: Bool = false
    var position2120x: Bool = false
    var position4320x: Bool = false
    var position12320x: Bool = false
    var position13720x: Bool = false
    var position940x: Bool = false
    var position2040x: Bool = false
    var position2700x: Bool = false
    var position4260x: Bool = false
    var position6200x: Bool = false
    var position7300x: Bool = false
    var position6520x: Bool = false
    var position7620x: Bool = false
    var position9820x: Bool = false
    var position11380x: Bool = false
    var position8360x: Bool = false
    var position9460x: Bool = false
    var position13280x: Bool = false
    var position14520x: Bool = false
    var position16560x: Bool = false
    var position17520x: Bool = false
    
    var trapAction1: SKNode?
    var trapAction2: SKNode?
    var trapAction3: SKNode?
    var trapAction4: SKNode?
    var trapAction5: SKNode?
    var trapAction6: SKNode?
    var trapAction7: SKNode?
    var trapAction8: SKNode?
    var trapAction9: SKNode?
    var trapAction10: SKNode?
    var trapAction11: SKNode?
    
    var groundFakeAction1: SKNode?
    var groundFakeAction2: SKNode?
    var groundFakeAction3: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        trapAction1 = childNode(withName: "trapAction1")
        trapAction2 = childNode(withName: "trapAction2")
        trapAction3 = childNode(withName: "trapAction3")
        trapAction4 = childNode(withName: "trapAction4")
        trapAction5 = childNode(withName: "trapAction5")
        trapAction6 = childNode(withName: "trapAction6")
        trapAction7 = childNode(withName: "trapAction7")
        trapAction8 = childNode(withName: "trapAction8")
        trapAction9 = childNode(withName: "trapAction9")
        trapAction10 = childNode(withName: "trapAction10")
        trapAction11 = childNode(withName: "trapAction11")
        
        groundFakeAction1 = childNode(withName: "groundFakeAction1")
        groundFakeAction2 = childNode(withName: "groundFakeAction2")
        groundFakeAction3 = childNode(withName: "groundFakeAction3")
        
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
        let actionMove = SKAction.moveTo(y: 80, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 3.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(x: 13800, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(x: 14240, duration: 3.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround3() {
        let actionMove = SKAction.moveTo(y: -120, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 3.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -160, duration: 1.0)
        let actionMoveBack = SKAction.moveTo(y: -70, duration: 1.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -120, duration: 0.7)
        let actionMoveBack = SKAction.moveTo(y: -20, duration: 2.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.3)
        let actionMoveBack = SKAction.moveTo(y: 30, duration: 1.1)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap4() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.7)
        let actionMoveBack = SKAction.moveTo(y: -60, duration: 1.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction4!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap5() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.9)
        let actionMoveBack = SKAction.moveTo(y: -60, duration: 2.1)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction5!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap6() {
        let actionMove = SKAction.moveTo(y: -200, duration: 1.5)
        let actionMoveBack = SKAction.moveTo(y: -100, duration: 1.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction6!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap7() {
        let actionMove = SKAction.moveTo(y: -200, duration: 1.7)
        let actionMoveBack = SKAction.moveTo(y: -100, duration: 1.7)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction7!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap8() {
        let actionMove = SKAction.moveTo(y: -200, duration: 1.9)
        let actionMoveBack = SKAction.moveTo(y: -100, duration: 1.9)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction8!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap9() {
        let actionMove = SKAction.moveTo(y: -200, duration: 2.1)
        let actionMoveBack = SKAction.moveTo(y: -100, duration: 2.1)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction9!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap10() {
        let actionMove = SKAction.moveTo(y: -200, duration: 2.3)
        let actionMoveBack = SKAction.moveTo(y: -100, duration: 2.3)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction10!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap11() {
        let actionMove = SKAction.moveTo(y: -200, duration: 2.5)
        let actionMoveBack = SKAction.moveTo(y: -100, duration: 2.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction11!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy1() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 12760, y: -50)
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
            portal.position = CGPoint(x: 12745, y: -50)
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
            stone.position = CGPoint(x: 4080, y: 245)
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
            portal.position = CGPoint(x: 4080, y: 250)
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
        if (player?.position.x)! >= 2120 {
            if !position2120x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4320x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4320x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position2120x = true
            }
        }
        if (player?.position.x)! >= 4320 {
            if !position4320x {
                position4320x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 12320 {
            if !position12320x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13720x == false {
                    self!.spawnArrowEnemy1()
                    }
                }, SKAction.wait(forDuration: 3.4)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13720x == false {
                    self!.spawnArrowEnemy1()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13720x == false {
                    self!.spawnArrowEnemy1()
                    }
                }, SKAction.wait(forDuration: 11.1)])))
                position12320x = true
            }
        }
        if (player?.position.x)! >= 13720 {
            if !position13720x {
                position13720x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 8360 {
            if !position8360x {
                actionGround1()
            }
            position8360x = true
        }
        if (player?.position.x)! >= 9460 {
            if !position9460x {
                groundFakeAction1?.removeFromParent()
            }
            position9460x = true
        }
        //GroundAction_2
        if (player?.position.x)! >= 13280 {
            if !position13280x {
                actionGround2()
            }
            position13280x = true
        }
        if (player?.position.x)! >= 14520 {
            if !position14520x {
                groundFakeAction2?.removeFromParent()
            }
            position14520x = true
        }
        //GroundAction_3
        if (player?.position.x)! >= 16560 {
            if !position16560x {
                actionGround3()
            }
            position16560x = true
        }
        if (player?.position.x)! >= 17520 {
            if !position17520x {
                groundFakeAction3?.removeFromParent()
            }
            position17520x = true
        }
        //TrapAction_1
        if (player?.position.x)! >= 940 {
            if !position940x {
                actionTrap1()
            }
            position940x = true
        }
        if (player?.position.x)! >= 2040 {
            if !position2040x {
                trapAction1?.removeFromParent()
            }
            position2040x = true
        }
        //TrapAction_2_3
        if (player?.position.x)! >= 2700 {
            if !position2700x {
                actionTrap2()
                actionTrap3()
            }
            position2700x = true
        }
        if (player?.position.x)! >= 4260 {
            if !position4260x {
                trapAction2?.removeFromParent()
                trapAction3?.removeFromParent()
            }
            position4260x = true
        }
        //TrapAction_4
        if (player?.position.x)! >= 6200 {
            if !position6200x {
                actionTrap4()
            }
            position6200x = true
        }
        if (player?.position.x)! >= 7300 {
            if !position7300x {
                trapAction4?.removeFromParent()
            }
            position7300x = true
        }
        //TrapAction_5
        if (player?.position.x)! >= 6520 {
            if !position6520x {
                actionTrap5()
            }
            position6520x = true
        }
        if (player?.position.x)! >= 7620 {
            if !position7620x {
                trapAction5?.removeFromParent()
            }
            position7620x = true
        }
        //TrapAction_6-11
        if (player?.position.x)! >= 9820 {
            if !position9820x {
                actionTrap6()
                actionTrap7()
                actionTrap8()
                actionTrap9()
                actionTrap10()
                actionTrap11()
            }
            position9820x = true
        }
        if (player?.position.x)! >= 11380 {
            if !position11380x {
                trapAction6?.removeFromParent()
                trapAction7?.removeFromParent()
                trapAction8?.removeFromParent()
                trapAction9?.removeFromParent()
                trapAction10?.removeFromParent()
                trapAction11?.removeFromParent()
            }
            position11380x = true
        }
        //Goblin1
        if (player?.position.x)! >= 720 {
            if !position720x {
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
            position720x = true
        }
        if (player?.position.x)! >= 1820 {
            if !position1820x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1820x = true
        }
        //Goblin2
        if (player?.position.x)! >= 1400 {
            if !position1400x {
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
            position1400x = true
        }
        if (player?.position.x)! >= 2500 {
            if !position2500x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position2500x = true
        }
        //Goblin3
        if (player?.position.x)! >= 4380 {
            if !position4380x {
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
            position4380x = true
        }
        if (player?.position.x)! >= 5480 {
            if !position5480x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position5480x = true
        }
        //Goblin4
        if (player?.position.x)! >= 5050 {
            if !position5050x {
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
            position5050x = true
        }
        if (player?.position.x)! >= 6150 {
            if !position6150x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position6150x = true
        }
        //Goblin5
        if (player?.position.x)! >= 5800 {
            if !position5800x {
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
            position5800x = true
        }
        if (player?.position.x)! >= 6900 {
            if !position6900x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position6900x = true
        }
        //Goblin6
        if (player?.position.x)! >= 7720 {
            if !position7720x {
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
            position7720x = true
        }
        if (player?.position.x)! >= 8820 {
            if !position8820x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position8820x = true
        }
        //Goblin7
        if (player?.position.x)! >= 9050 {
            if !position9050x {
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
            position9050x = true
        }
        if (player?.position.x)! >= 10150 {
            if !position10150x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position10150x = true
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
        if (player?.position.x)! >= 14200 {
            if !position14200x {
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
            position14200x = true
        }
        if (player?.position.x)! >= 15300 {
            if !position15300x {
                enemy10?.removeFromParent()
                contactAxePlayer10 = false
            }
            position15300x = true
        }
        //Goblin11
        if (player?.position.x)! >= 15370 {
            if !position15370x {
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
            position15370x = true
        }
        if (player?.position.x)! >= 16470 {
            if !position16470x {
                enemy11?.removeFromParent()
                contactAxePlayer11 = false
            }
            position16470x = true
        }
        //Goblin12
        if (player?.position.x)! >= 17240 {
            if !position17240x {
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
            position17240x = true
        }
        
        //Portal
        if (player?.position.x)! >= 17260 {
            if !position17260x {
                spawnPortalRedEmitter()
            }
            position17260x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel51")
            
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
