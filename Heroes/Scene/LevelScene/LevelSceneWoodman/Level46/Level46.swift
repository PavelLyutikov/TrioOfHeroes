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
class Level46: GameScene {
    
    var position330x: Bool = false
    var position1430x: Bool = false
    var position4310x: Bool = false
    var position5410x: Bool = false
    var position5730x: Bool = false
    var position6830x: Bool = false
    var position8810x: Bool = false
    var position9910x: Bool = false
    var position9230x: Bool = false
    var position10330x: Bool = false
    var position12110x: Bool = false
    var position13210x: Bool = false
    var position13570x: Bool = false
    var position14670x: Bool = false
    var position14550x: Bool = false
    var position15650x: Bool = false
    var position16750x: Bool = false
    var position4180x: Bool = false
    var position6180x: Bool = false
    var position8800x: Bool = false
    var position10800x: Bool = false
    var position3600x: Bool = false
    var position4720x: Bool = false
    var position7520x: Bool = false
    var position8520x: Bool = false
    var position15120x: Bool = false
    var position4560x: Bool = false
    var position5800x: Bool = false
    var position6400x: Bool = false
    var position8080x: Bool = false
    var position6800x: Bool = false
    var position8500x: Bool = false
    var position7680x: Bool = false
    var position9400x: Bool = false
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    var groundFakeAction1: SKNode?
    var groundFakeAction2: SKNode?
    var groundFakeAction3: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        groundAction1_1 = childNode(withName: "groundAction1_1")
        groundAction1_2 = childNode(withName: "groundAction1_2")
        groundAction1_3 = childNode(withName: "groundAction1_3")
        groundAction1_4 = childNode(withName: "groundAction1_4")
        
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
    }
//MARK: - SpawnActionGround
    func actionGround() {
        let actionMove = SKAction.moveTo(x: 5040, duration: 4.0)
        let actionMoveBack = SKAction.moveTo(x: 5515, duration: 4.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 5085, duration: 4.0)
        let actionMoveBack2 = SKAction.moveTo(x: 5560, duration: 4.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(y: 80, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: -140, duration: 3.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround3() {
        let actionMove = SKAction.moveTo(y: -140, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 3.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionGround4() {
        let actionMove = SKAction.moveTo(y: -80, duration: 3.0)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 3.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction3!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - PortalEndBall
    func spawnTrapBall1() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 4570, y: 175)
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
            portal.position = CGPoint(x: 4570, y: 180)
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
            stone.position = CGPoint(x: 8220, y: 175)
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
            portal.position = CGPoint(x: 8220, y: 180)
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
            stone.position = CGPoint(x: 17140, y: 185)
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
    func spawnPortal3() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 17140, y: 190)
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
        if (player?.position.x)! >= 3600 {
            if !position3600x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4720x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 3.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4720x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 9.6)])))
                position3600x = true
            }
        }
        if (player?.position.x)! >= 4720 {
            if !position4720x {
                position4720x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 7520 {
            if !position7520x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8520x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8520x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 7.9)])))
                position7520x = true
            }
        }
        if (player?.position.x)! >= 8520 {
            if !position8520x {
                position8520x = true
            }
        }
        //TrapBall_3
        if (player?.position.x)! >= 15120 {
            if !position15120x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                }, SKAction.wait(forDuration: 3.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                }, SKAction.wait(forDuration: 5.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                }, SKAction.wait(forDuration: 11.4)])))
                position15120x = true
            }
        }
        //GroundAction_1
        if (player?.position.x)! >= 4560 {
            if !position4560x {
                actionGround()
            }
            position4560x = true
        }
        if (player?.position.x)! >= 5800 {
            if !position5800x {
                groundAction1_1?.removeFromParent()
                groundAction1_2?.removeFromParent()
                groundAction1_3?.removeFromParent()
                groundAction1_4?.removeFromParent()
            }
            position5800x = true
        }
        //GroundAction_2
        if (player?.position.x)! >= 6400 {
            if !position6400x {
                actionGround2()
            }
            position6400x = true
        }
        if (player?.position.x)! >= 8080 {
            if !position8080x {
                groundFakeAction1?.removeFromParent()
            }
            position8080x = true
        }
        //GroundAction_3
        if (player?.position.x)! >= 6800 {
            if !position6800x {
                actionGround3()
            }
            position6800x = true
        }
        if (player?.position.x)! >= 8500 {
            if !position8500x {
                groundFakeAction2?.removeFromParent()
            }
            position8500x = true
        }
        //GroundAction_4
        if (player?.position.x)! >= 7680 {
            if !position7680x {
                actionGround4()
            }
            position7680x = true
        }
        if (player?.position.x)! >= 9400 {
            if !position9400x {
                groundFakeAction3?.removeFromParent()
            }
            position9400x = true
        }
        //Puddle1
        if (player?.position.x)! >= 4180 {
            if !position4180x {
                spawnPuddlePractileEmitter()
            }
            position4180x = true
        }
        if (player?.position.x)! >= 6180 {
            if !position6180x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position6180x = true
        }
        //Puddle2
        if (player?.position.x)! >= 8800 {
            if !position8800x {
                spawnPuddlePractileEmitter2()
            }
            position8800x = true
        }
        if (player?.position.x)! >= 10800 {
            if !position10800x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position10800x = true
        }
        //Goblin1
        if (player?.position.x)! >= 330 {
            if !position330x {
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
            position330x = true
        }
        if (player?.position.x)! >= 1430 {
            if !position1430x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position1430x = true
        }
        //Goblin2
        if (player?.position.x)! >= 4310 {
            if !position4310x {
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
            position4310x = true
        }
        if (player?.position.x)! >= 5410 {
            if !position5410x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position5410x = true
        }
        //Goblin3
        if (player?.position.x)! >= 5730 {
            if !position5730x {
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
            position5730x = true
        }
        if (player?.position.x)! >= 6830 {
            if !position6830x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position6830x = true
        }
        //Goblin4
        if (player?.position.x)! >= 8810 {
            if !position8810x {
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
            position8810x = true
        }
        if (player?.position.x)! >= 9910 {
            if !position9910x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position9910x = true
        }
        //Goblin5
        if (player?.position.x)! >= 9230 {
            if !position9230x {
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
            position9230x = true
        }
        if (player?.position.x)! >= 10330 {
            if !position10330x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position10330x = true
        }
        //Goblin6
        if (player?.position.x)! >= 12110 {
            if !position12110x {
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
            position12110x = true
        }
        if (player?.position.x)! >= 13210 {
            if !position13210x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position13210x = true
        }
        //Goblin7
        if (player?.position.x)! >= 13570 {
            if !position13570x {
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
            position13570x = true
        }
        if (player?.position.x)! >= 14670 {
            if !position14670x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position14670x = true
        }
        //Goblin8
        if (player?.position.x)! >= 14550 {
            if !position14550x {
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
            position14550x = true
        }
        if (player?.position.x)! >= 15650 {
            if !position15650x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position15650x = true
        }
        
        //Portal
        if (player?.position.x)! >= 16750 {
            if !position16750x {
                spawnPortalRedEmitter()
            }
            position16750x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel46")
            
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
