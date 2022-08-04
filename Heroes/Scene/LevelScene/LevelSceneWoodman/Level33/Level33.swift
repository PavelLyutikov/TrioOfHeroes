//
//  Level10.swift
//  Elon's Adventure
//
//  Created by mac on 20.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level33: GameScene {
    
    var position950x: Bool = false
    var position2050x: Bool = false
    var position3520x: Bool = false
    var position4630x: Bool = false
    var position4220x: Bool = false
    var position5320x: Bool = false
    var position4960x: Bool = false
    var position6060x: Bool = false
    var position8060x: Bool = false
    var position9160x: Bool = false
    var position11740x: Bool = false
    var position12020x: Bool = false
    var position380x: Bool = false
    var position2380x: Bool = false
    var position3110x: Bool = false
    var position5110x: Bool = false
    var position9060x: Bool = false
    var position11060x: Bool = false
    var position800x: Bool = false
    var position2000x: Bool = false
    var position3930x: Bool = false
    var position5080x: Bool = false
    var position5600x: Bool = false
    var position7840x: Bool = false
    var position8480x: Bool = false
    var position9320x: Bool = false
    var position9600x: Bool = false
    var position10600x: Bool = false
    var position10640x: Bool = false
    var position11680x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 1925, y: -90)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -40, dy: 0)
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
            portal.position = CGPoint(x: 1940, y: -90)
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
            arrow.position = CGPoint(x: 4170, y: -10)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 50, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.4)
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
            portal.position = CGPoint(x: 4155, y: -10)
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
//MARK: - SpanwStone
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.7)
            stone.position = CGPoint(x: 7700, y: 320)
            stone.zPosition = 30
            addChild(stone)

            let physicsBody = SKPhysicsBody(circleOfRadius: 110)
            stone.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true
        
            Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
                let remove = SKAction.removeFromParent()
                stone.run(SKAction.sequence([remove]))
            }
    }
//MARK: - PortalEndBall
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 9110, y: 135)
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
    func spawnPortal() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 9110, y: 140)
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
            stone.position = CGPoint(x: 10360, y: 165)
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
            portal.position = CGPoint(x: 10360, y: 170)
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
            stone.position = CGPoint(x: 11520, y: 175)
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
            portal.position = CGPoint(x: 11520, y: 180)
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
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        //TrapBall_1
        if (player?.position.x)! >= 8480 {
            if !position8480x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9320x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 4.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9320x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                position8480x = true
            }
        }
        if (player?.position.x)! >= 9320 {
            if !position9320x {
                position9320x = true
            }
        }
        //TrapBall_2
        if (player?.position.x)! >= 9600 {
            if !position9600x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10600x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 3.2)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10600x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.2)])))
                position9600x = true
            }
        }
        if (player?.position.x)! >= 10600 {
            if !position10600x {
                position10600x = true
            }
        }
        //TrapBall_3
        if (player?.position.x)! >= 10640 {
            if !position10640x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11680x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 7.1)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11680x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 4.5)])))
                position10640x = true
            }
        }
        if (player?.position.x)! >= 11680 {
            if !position11680x {
                position11680x = true
            }
        }
        //Stone
        if (player?.position.x)! >= 5600 {
            if !position5600x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7840x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 8.6)])))
                position5600x = true
            }
        }
        if (player?.position.x)! >= 7840 {
            if !position7840x {
                position7840x = true
            }
        }
        //FireBall_1
        if (player?.position.x)! >= 800 {
            if !position800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2000x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                position800x = true
            }
        }
        if (player?.position.x)! >= 2000 {
            if !position2000x {
                position2000x = true
            }
        }
        //FireBall_2
        if (player?.position.x)! >= 3930 {
            if !position3930x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5080x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 2.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5080x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                position3930x = true
            }
        }
        if (player?.position.x)! >= 5080 {
            if !position5080x {
                position5080x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 380 {
            if !position380x {
                spawnPuddlePractileEmitter()
            }
            position380x = true
        }
        if (player?.position.x)! >= 2380 {
            if !position2380x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position2380x = true
        }
        //Puddle2
        if (player?.position.x)! >= 3110 {
            if !position3110x {
                spawnPuddlePractileEmitter2()
            }
            position3110x = true
        }
        if (player?.position.x)! >= 5110 {
            if !position5110x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position5110x = true
        }
        //Puddle3
        if (player?.position.x)! >= 9060 {
            if !position9060x {
                spawnPuddlePractileEmitter3()
            }
            position9060x = true
        }
        if (player?.position.x)! >= 11060 {
            if !position11060x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position11060x = true
        }
        //Goblin1
        if (player?.position.x)! >= 950 {
            if !position950x {
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
            position950x = true
        }
        if (player?.position.x)! >= 2050 {
            if !position2050x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position2050x = true
        }
        //Goblin2
        if (player?.position.x)! >= 3520 {
            if !position3520x {
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
            position3520x = true
        }
        if (player?.position.x)! >= 4630 {
            if !position4630x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position4630x = true
        }
        //Goblin3
        if (player?.position.x)! >= 4220 {
            if !position4220x {
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
            position4220x = true
        }
        if (player?.position.x)! >= 5320 {
            if !position5320x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position5320x = true
        }
        //Goblin4
        if (player?.position.x)! >= 4960 {
            if !position4960x {
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
            position4960x = true
        }
        if (player?.position.x)! >= 6060 {
            if !position6060x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position6060x = true
        }
        //Goblin5
        if (player?.position.x)! >= 8060 {
            if !position8060x {
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
            position8060x = true
        }
        if (player?.position.x)! >= 9160 {
            if !position9160x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position9160x = true
        }
        //Goblin6
        if (player?.position.x)! >= 11740 {
            if !position11740x {
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
            position11740x = true
        }
        
        //Portal
        if (player?.position.x)! >= 12020 {
            if !position12020x {
                spawnPortalRedEmitter()
            }
            position12020x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel33")
            
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

