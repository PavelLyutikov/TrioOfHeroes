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
class Level61: GameScene {
    
    var position1180x: Bool = false
    var position2180x: Bool = false
    var position2500x: Bool = false
    var position3500x: Bool = false
    var position3140x: Bool = false
    var position4140x: Bool = false
    var position5780x: Bool = false
    var position6780x: Bool = false
    var position8810x: Bool = false
    var position9810x: Bool = false
    var position8860x: Bool = false
    var position9400x: Bool = false
    var position6160x: Bool = false
    var position8480x: Bool = false
    var position10180x: Bool = false
    var position11180x: Bool = false
    var position10720x: Bool = false
    var position12100x: Bool = false
    var position12560x: Bool = false
    var position13420x: Bool = false
    var position12960x: Bool = false
    var position13800x: Bool = false
    var position14480x: Bool = false
    var position15480x: Bool = false
    var position14750x: Bool = false
    var position15750x: Bool = false
    var position15200x: Bool = false
    var position16290x: Bool = false

    var groundFakeAction1: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        groundFakeAction1 = childNode(withName: "fakeGroundAction1")
    }
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {
        let actionMove = SKAction.moveTo(y: -220, duration: 5.0)
        let actionMoveBack = SKAction.moveTo(y: 20, duration: 5.0)

        let sequence = SKAction.sequence([actionMoveBack, actionMove])
        let repeatAction = SKAction.repeatForever(sequence)

        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
//    func actionTrap1() {
//        let actionMove = SKAction.moveTo(y: -60, duration: 2.5)
//        let actionMoveBack = SKAction.moveTo(y: -120, duration: 1.0)
//        let sequence = SKAction.sequence([actionMove, actionMoveBack])
//        let repeatAction = SKAction.repeatForever(sequence)
//
//        trapAction1!.run(SKAction.sequence([repeatAction]))
//    }
//MARK: - SpawnStone
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stoneSnow")
            stone.name = "Stone"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 16820, y: 320)
            stone.zPosition = 30
            addChild(stone)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 100)
            stone.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true
        
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
                let remove = SKAction.removeFromParent()
                stone.run(SKAction.sequence([remove]))
            }
    }
//MARK: - MoveBadWizard
func moveBadWizard1() {
    let moveXMinus = SKAction.moveTo(x: enemy1!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy1!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy1!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy1!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy1!.run(SKAction.sequence([repeatFr]))
}
func moveBadWizard2() {
    let moveXMinus = SKAction.moveTo(x: enemy2!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy2!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy2!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy2!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy2!.run(SKAction.sequence([repeatFr]))
}
func moveBadWizard3() {
    let moveXMinus = SKAction.moveTo(x: enemy3!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy3!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy3!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy3!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy3!.run(SKAction.sequence([repeatFr]))
}
func moveBadWizard4() {
    let moveXMinus = SKAction.moveTo(x: enemy4!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy4!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy4!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy4!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy4!.run(SKAction.sequence([repeatFr]))
}
func moveBadWizard5() {
    let moveXMinus = SKAction.moveTo(x: enemy5!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy5!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy5!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy5!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy5!.run(SKAction.sequence([repeatFr]))
}
func moveBadWizard6() {
    let moveXMinus = SKAction.moveTo(x: enemy6!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy6!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy6!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy6!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy6!.run(SKAction.sequence([repeatFr]))
}
func moveBadWizard7() {
    let moveXMinus = SKAction.moveTo(x: enemy7!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy7!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy7!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy7!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy7!.run(SKAction.sequence([repeatFr]))
}
func moveBadWizard8() {
    let moveXMinus = SKAction.moveTo(x: enemy8!.position.x - 10, duration: 1)
    let moveYPlus = SKAction.moveTo(y: enemy8!.position.y + 7, duration: 1)
    let moveXPlus = SKAction.moveTo(x: enemy8!.position.x + 10, duration: 1)
    let moveYMinus = SKAction.moveTo(y: enemy8!.position.y - 7, duration: 1)
    
    let groupLeft = SKAction.group([moveXMinus, moveYPlus])
    let groupRight = SKAction.group([moveXPlus, moveYPlus])
    
    let action = SKAction.sequence([groupLeft, moveYMinus, groupRight, moveYMinus])
    let repeatFr = SKAction.repeatForever(action)
    enemy8!.run(SKAction.sequence([repeatFr]))
}
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 10740, y: -10)
            arrow.zPosition = 30
            arrow.zRotation = 3.12
            addChild(arrow)

            let action = CGVector(dx: 60, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.8)
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([impulse, remove]))

            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false


            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 10720, y: -10)
            portal.zPosition = 29
            portal.zRotation = 1.5
            addChild(portal)

            var textures: [SKTexture] = []
                    for i in 1...2 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.1)
        
            var textures2: [SKTexture] = []
                    for i in 3...5 {
                        textures2.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal2 = SKAction.animate(with: textures2, timePerFrame: 0.166)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)
        
            let group = SKAction.group([actionPortal, appear])
            let group2 = SKAction.group([actionPortal2, disappear])

            portal.run(SKAction.sequence([group, group2]))
    }
    func spawnArrowEnemy2() {
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 13165, y: -120)
            arrow.zPosition = 30
            arrow.zRotation = -1.55
            addChild(arrow)

            let action = CGVector(dx: 0, dy: 30)
            let impulse = SKAction.applyImpulse(action, duration: 1.6)
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([impulse, remove]))

            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false


            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 13165, y: -120)
            portal.zPosition = 29
            portal.zRotation = 3.1
            addChild(portal)

            var textures: [SKTexture] = []
                    for i in 1...2 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.1)
        
            var textures2: [SKTexture] = []
                    for i in 3...5 {
                        textures2.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal2 = SKAction.animate(with: textures2, timePerFrame: 0.166)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)
        
            let group = SKAction.group([actionPortal, appear])
            let group2 = SKAction.group([actionPortal2, disappear])

            portal.run(SKAction.sequence([group, group2]))
    }
    func spawnArrowEnemy3() {
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 13542, y: -120)
            arrow.zPosition = 30
            arrow.zRotation = -1.55
            addChild(arrow)

            let action = CGVector(dx: 0, dy: 30)
            let impulse = SKAction.applyImpulse(action, duration: 1.6)
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([impulse, remove]))

            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false


            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 13542, y: -120)
            portal.zPosition = 29
            portal.zRotation = 3.1
            addChild(portal)

            var textures: [SKTexture] = []
                    for i in 1...2 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.1)
        
            var textures2: [SKTexture] = []
                    for i in 3...5 {
                        textures2.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal2 = SKAction.animate(with: textures2, timePerFrame: 0.166)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)
        
            let group = SKAction.group([actionPortal, appear])
            let group2 = SKAction.group([actionPortal2, disappear])

            portal.run(SKAction.sequence([group, group2]))
    }
//MARK: - PortalEndBall
    func spawnTrapBall1() {
            let stone = SKSpriteNode(imageNamed: "snowTrapBall")
            stone.name = "Ball"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 8100, y: 150)
            stone.zPosition = 30
            addChild(stone)

            let physicsBody = SKPhysicsBody(circleOfRadius: 35)
            stone.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true

        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal1() {

            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 8100, y: 170)
            portal.zPosition = 29
            addChild(portal)

            var textures: [SKTexture] = []
                    for i in 1...2 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.1)
        
            var textures2: [SKTexture] = []
                    for i in 3...5 {
                        textures2.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal2 = SKAction.animate(with: textures2, timePerFrame: 0.166)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)
        
            let group = SKAction.group([actionPortal, appear])
            let group2 = SKAction.group([actionPortal2, disappear])

            portal.run(SKAction.sequence([group, group2]))
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

        //GroundFake
        if (player?.position.x)! >= 8860 {
            if !position8860x {
                actionGround1()
                position8860x = true
            }
        }
        if (player?.position.x)! >= 9400 {
            if !position9400x {
                groundFakeAction1?.removeFromParent()
                position9400x = true
            }
        }
        //Stone
        if (player?.position.x)! >= 15400 {
            if !position15200x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    self!.spawnStone()
                }, SKAction.wait(forDuration: 10.9)])))
                position15200x = true
            }
        }
        //TrapBool_1
        if (player?.position.x)! >= 6160 {
            if !position6160x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8480x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8480x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 7.4)])))
                position6160x = true
            }
        }
        if (player?.position.x)! >= 8480 {
            if !position8480x {
                position8480x = true
            }
        }
        //Fire_Ball1
        if (player?.position.x)! >= 10720 {
            if !position10720x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12100x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.7)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12100x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 7.4)])))
                position10720x = true
            }
        }
        if (player?.position.x)! >= 12100 {
            if !position12100x {
                position12100x = true
            }
        }
        //Fire_Ball2
        if (player?.position.x)! >= 12560 {
            if !position12560x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13420x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 2.7)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13420x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                position12560x = true
            }
        }
        if (player?.position.x)! >= 13420 {
            if !position13420x {
                position13420x = true
            }
        }
        //Fire_Ball3
        if (player?.position.x)! >= 12960 {
            if !position12960x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13800x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position13800x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 5.4)])))
                position12960x = true
            }
        }
        if (player?.position.x)! >= 13800 {
            if !position13800x {
                position13800x = true
            }
        }
        //Puddle1
//        if (player?.position.x)! >= 2230 {
//            if !position2230x {
//                spawnPuddlePractileEmitter()
//            }
//            position2230x = true
//        }
//        if (player?.position.x)! >= 4230 {
//            if !position4230x {
//                puddle?.removeFromParent()
//                puddleAnimation.removeFromParent()
//            }
//            position4230x = true
//        }
       
        //BadWizard1
        if (player?.position.x)! >= 1180 {
            if !position1180x {
                spawnBadWizard1()
                stateMachineBadWizard1()
                physicsBodyEnemy1()
                moveBadWizard1()
                cloudBadWizard()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer == true {
                            self!.spawnFireBool1()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard.position.x = self.enemy1!.position.x + 10
                    self.puddleBadWizard.position.y = self.enemy1!.position.y - 30
                }
            }
            position1180x = true

        }
        if (player?.position.x)! >= 2180 {
            if !position2180x {
                enemy1?.removeFromParent()
                puddleBadWizard.removeFromParent()
                contactAxePlayer = false
            }
            position2180x = true
        }
        //BadWizard2
        if (player?.position.x)! >= 2500 {
            if !position2500x {
                spawnBadWizard2()
                stateMachineBadWizard2()
                physicsBodyEnemy2()
                moveBadWizard2()
                cloudBadWizard2()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer2 == true {
                            self!.spawnFireBool2()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard2.position.x = self.enemy2!.position.x + 10
                    self.puddleBadWizard2.position.y = self.enemy2!.position.y - 30
                }
            }
            position2500x = true
            
        }
        if (player?.position.x)! >= 3500 {
            if !position3500x {
                enemy2?.removeFromParent()
                puddleBadWizard2.removeFromParent()
                contactAxePlayer2 = false
            }
            position3500x = true
        }
        //BadWizard3
        if (player?.position.x)! >= 3140 {
            if !position3140x {
                spawnBadWizard3()
                stateMachineBadWizard3()
                physicsBodyEnemy3()
                moveBadWizard3()
                cloudBadWizard3()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer3 == true {
                            self!.spawnFireBool3()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard3.position.x = self.enemy3!.position.x + 10
                    self.puddleBadWizard3.position.y = self.enemy3!.position.y - 30
                }
            }
            position3140x = true
            
        }
        if (player?.position.x)! >= 4140 {
            if !position4140x {
                enemy3?.removeFromParent()
                puddleBadWizard3.removeFromParent()
                contactAxePlayer3 = false
            }
            position4140x = true
        }
        //BadWizard4
        if (player?.position.x)! >= 5780 {
            if !position5780x {
                spawnBadWizard4()
                stateMachineBadWizard4()
                physicsBodyEnemy4()
                moveBadWizard4()
                cloudBadWizard4()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer4 == true {
                            self!.spawnFireBool4()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard4.position.x = self.enemy4!.position.x + 10
                    self.puddleBadWizard4.position.y = self.enemy4!.position.y - 30
                }
            }
            position5780x = true

        }
        if (player?.position.x)! >= 6780 {
            if !position6780x {
                enemy4?.removeFromParent()
                puddleBadWizard4.removeFromParent()
                contactAxePlayer4 = false
            }
            position6780x = true
        }
        //BadWizard5
        if (player?.position.x)! >= 8810 {
            if !position8810x {
                spawnBadWizard5()
                stateMachineBadWizard5()
                physicsBodyEnemy5()
                moveBadWizard5()
                cloudBadWizard5()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer5 == true {
                            self!.spawnFireBool5()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard5.position.x = self.enemy5!.position.x + 10
                    self.puddleBadWizard5.position.y = self.enemy5!.position.y - 30
                }
            }
            position8810x = true

        }
        if (player?.position.x)! >= 9810 {
            if !position9810x {
                enemy5?.removeFromParent()
                puddleBadWizard5.removeFromParent()
                contactAxePlayer5 = false
            }
            position9810x = true
        }
        //BadWizard6
        if (player?.position.x)! >= 10180 {
            if !position10180x {
                spawnBadWizard6()
                stateMachineBadWizard6()
                physicsBodyEnemy6()
                moveBadWizard6()
                cloudBadWizard6()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer6 == true {
                            self!.spawnFireBool6()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard6.position.x = self.enemy6!.position.x + 10
                    self.puddleBadWizard6.position.y = self.enemy6!.position.y - 30
                }
            }
            position10180x = true

        }
        if (player?.position.x)! >= 11180 {
            if !position11180x {
                enemy6?.removeFromParent()
                puddleBadWizard6.removeFromParent()
                contactAxePlayer6 = false
            }
            position11180x = true
        }
        //BadWizard7
        if (player?.position.x)! >= 14480 {
            if !position14480x {
                spawnBadWizard7()
                stateMachineBadWizard7()
                physicsBodyEnemy7()
                moveBadWizard7()
                cloudBadWizard7()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer7 == true {
                            self!.spawnFireBool7()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard7.position.x = self.enemy7!.position.x + 10
                    self.puddleBadWizard7.position.y = self.enemy7!.position.y - 30
                }
            }
            position14480x = true

        }
        if (player?.position.x)! >= 15480 {
            if !position15480x {
                enemy7?.removeFromParent()
                puddleBadWizard7.removeFromParent()
                contactAxePlayer7 = false
            }
            position15480x = true
        }
        //BadWizard8
        if (player?.position.x)! >= 14750 {
            if !position14750x {
                spawnBadWizard8()
                stateMachineBadWizard8()
                physicsBodyEnemy8()
                moveBadWizard8()
                cloudBadWizard8()

                var animationInterval: Int = 0

                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer8 == true {
                            self!.spawnFireBool8()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                    self.puddleBadWizard8.position.x = self.enemy8!.position.x + 10
                    self.puddleBadWizard8.position.y = self.enemy8!.position.y - 30
                }
            }
            position14750x = true

        }
        if (player?.position.x)! >= 15750 {
            if !position15750x {
                enemy8?.removeFromParent()
                puddleBadWizard8.removeFromParent()
                contactAxePlayer8 = false
            }
            position15750x = true
        }
        //Portal
        if (player?.position.x)! >= 16290 {
            if !position16290x {
                spawnPortalPurpleEmitter()
            }
            position16290x = true
        }
        
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel61")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel61_90(fileNamed: "MenuLevel61_90")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        }
    }
}
