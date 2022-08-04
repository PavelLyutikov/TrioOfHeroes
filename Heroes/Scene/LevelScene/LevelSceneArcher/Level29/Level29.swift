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
class Level29: GameScene {
    
    var position800x: Bool = false
    var position1800x: Bool = false
    var position870x: Bool = false
    var position1870x: Bool = false
    var position1890x: Bool = false
    var position2890x: Bool = false
    var position2100x: Bool = false
    var position3100x: Bool = false
    var position3380x: Bool = false
    var position4380x: Bool = false
    var position3580x: Bool = false
    var position4580x: Bool = false
    var position4570x: Bool = false
    var position5570x: Bool = false
    var position4720x: Bool = false
    var position5720x: Bool = false
    var position6580x: Bool = false
    var position7580x: Bool = false
    var position9500x: Bool = false
    var position10500x: Bool = false
    var position10930x: Bool = false
    var position11930x: Bool = false
    var position12040x: Bool = false
    var position13040x: Bool = false
    var position12220x: Bool = false
    var position13220x: Bool = false
    var position12440x: Bool = false
    var position13440x: Bool = false
    var position12960x: Bool = false
    var position1950x: Bool = false
    var position3950x: Bool = false
    var position2800x: Bool = false
    var position4800x: Bool = false
    var position7500x: Bool = false
    var position9510x: Bool = false
    var position9240x: Bool = false
    var position11240x: Bool = false
    var position11840x: Bool = false
    var position1280x: Bool = false
    var position3360x: Bool = false
    var position6880x: Bool = false
    var position8400x: Bool = false
    var position8840x: Bool = false
    var position10360x: Bool = false
    var position4640x: Bool = false
    var position5800x: Bool = false
    var position5730x: Bool = false
    var position6920x: Bool = false
    var position10800x: Bool = false
    var position11860x: Bool = false
    var position11200x: Bool = false
    var position12320x: Bool = false
    var position12310x: Bool = false

    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 3320, y: -100)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -45, dy: 0)
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
            portal.position = CGPoint(x: 3335, y: -100)
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
            arrow.position = CGPoint(x: 8320, y: -60)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -45, dy: 0)
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
            portal.position = CGPoint(x: 8335, y: -60)
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
    func spawnArrowEnemy3() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 9190, y: -80)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 45, dy: 0)
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
            portal.position = CGPoint(x: 9175, y: -80)
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
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 5520, y: 165)
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
            portal.position = CGPoint(x: 5520, y: 170)
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
            stone.position = CGPoint(x: 6580, y: 265)
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
            portal.position = CGPoint(x: 6580, y: 270)
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
            stone.position = CGPoint(x: 11630, y: 165)
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
            portal.position = CGPoint(x: 11630, y: 170)
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
            stone.position = CGPoint(x: 11960, y: 165)
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
            portal.position = CGPoint(x: 11960, y: 170)
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
    func spawnTrapBall5() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 13120, y: 135)
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
    func spawnPortal5() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 13120, y: 140)
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
        
        //TrapBool_1
        if (player?.position.x)! >= 4640 {
            if !position4640x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5800x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 3.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5800x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position4640x = true
            }
        }
        if (player?.position.x)! >= 5800 {
            if !position5800x {
                position5800x = true
            }
        }
        //TrapBool_2
        if (player?.position.x)! >= 5730 {
            if !position5730x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6920x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6920x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                }
                }, SKAction.wait(forDuration: 3.2)])))
                position5730x = true
            }
        }
        if (player?.position.x)! >= 6920 {
            if !position6920x {
                position6920x = true
            }
        }
        //TrapBool_3
        if (player?.position.x)! >= 10800 {
            if !position10800x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11860x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 4.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11860x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 5.1)])))
                position10800x = true
            }
        }
        if (player?.position.x)! >= 11860 {
            if !position11860x {
                position11860x = true
            }
        }
        //TrapBool_4
        if (player?.position.x)! >= 11200 {
            if !position11200x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12320x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position12320x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 6.1)])))
                position11200x = true
            }
        }
        if (player?.position.x)! >= 12320 {
            if !position12320x {
                position12320x = true
            }
        }
        //TrapBool_5
        if (player?.position.x)! >= 12310 {
            if !position12310x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                }, SKAction.wait(forDuration: 3.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                }, SKAction.wait(forDuration: 7.3)])))
                position12310x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 1280 {
            if !position1280x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3360x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3360x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 6.7)])))
                position1280x = true
            }
        }
        if (player?.position.x)! >= 3360 {
            if !position3360x {
                position3360x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 6880 {
            if !position6880x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8400x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 3.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8400x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.2)])))
                position6880x = true
            }
        }
        if (player?.position.x)! >= 8400 {
            if !position8400x {
                position8400x = true
            }
        }
        //FireBool_3
        if (player?.position.x)! >= 8840 {
            if !position8840x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10360x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10360x == false {
                    self!.spawnArrowEnemy3()
                    }
                }, SKAction.wait(forDuration: 6.2)])))
                position8840x = true
            }
        }
        if (player?.position.x)! >= 10360 {
            if !position10360x {
                position10360x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 1950 {
            if !position1950x {
                spawnPuddlePractileEmitter()
            }
            position1950x = true
        }
        if (player?.position.x)! >= 3950 {
            if !position3950x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position3950x = true
        }
        //Puddle2
        if (player?.position.x)! >= 2800 {
            if !position2800x {
                spawnPuddlePractileEmitter2()
            }
            position2800x = true
        }
        if (player?.position.x)! >= 4800 {
            if !position4800x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position4800x = true
        }
        //Puddle3
        if (player?.position.x)! >= 7500 {
            if !position7500x {
                spawnPuddlePractileEmitter3()
            }
            position7500x = true
        }
        if (player?.position.x)! >= 9510 {
            if !position9510x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position9510x = true
        }
        //Puddle4
        if (player?.position.x)! >= 9240 {
            if !position9240x {
                spawnPuddlePractileEmitter4()
            }
            position9240x = true
        }
        if (player?.position.x)! >= 11240 {
            if !position11240x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position11240x = true
        }
        //Puddle5
        if (player?.position.x)! >= 11840 {
            if !position11840x {
                spawnPuddlePractileEmitter5()
            }
            position11840x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 800 {
            if !position800x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position800x = true
        }
        if (player?.position.x)! >= 1800 {
            if !position1800x {
                enemy1?.removeFromParent()
            }
            position1800x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 870 {
            if !position870x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position870x = true
        }
        
        if (player?.position.x)! >= 1870 {
            if !position1870x {
                enemy2?.removeFromParent()
            }
            position1870x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 1890 {
            if !position1890x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position1890x = true
        }
        
        if (player?.position.x)! >= 2890 {
            if !position2890x {
                enemy3?.removeFromParent()
            }
            position2890x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 2100 {
            if !position2100x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position2100x = true
        }
        
        if (player?.position.x)! >= 3100 {
            if !position3100x {
                enemy4?.removeFromParent()
            }
            position3100x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 3380 {
            if !position3380x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position3380x = true
        }
        if (player?.position.x)! >= 4380 {
            if !position4380x {
                enemy5?.removeFromParent()
            }
            position4380x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 3580 {
            if !position3580x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position3580x = true
        }
        if (player?.position.x)! >= 4580 {
            if !position4580x {
                enemy6?.removeFromParent()
            }
            position4580x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 4570 {
            if !position4570x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position4570x = true
        }
        if (player?.position.x)! >= 5570 {
            if !position5570x {
                enemy7?.removeFromParent()
            }
            position5570x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 4720 {
            if !position4720x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position4720x = true
        }
        if (player?.position.x)! >= 5720 {
            if !position5720x {
                enemy8?.removeFromParent()
            }
            position5720x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 6580 {
            if !position6580x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position6580x = true
        }
        if (player?.position.x)! >= 7580 {
            if !position7580x {
                enemy9?.removeFromParent()
            }
            position7580x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 9500 {
            if !position9500x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position9500x = true
        }
        if (player?.position.x)! >= 10500 {
            if !position10500x {
                enemy10?.removeFromParent()
            }
            position10500x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 10930 {
            if !position10930x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position10930x = true
        }
        if (player?.position.x)! >= 11930 {
            if !position11930x {
                enemy11?.removeFromParent()
            }
            position11930x = true
        }
        //Skeleton12
        if (player?.position.x)! >= 12040 {
            if !position12040x {
                spawnSkeleton12()
                stateMachineSkeleton12()
                physicsBodyEnemy12()
            }
            position12040x = true
        }
        if (player?.position.x)! >= 13040 {
            if !position13040x {
                enemy12?.removeFromParent()
            }
            position13040x = true
        }
        //Skeleton13
        if (player?.position.x)! >= 12220 {
            if !position12220x {
                spawnSkeleton13()
                stateMachineSkeleton13()
                physicsBodyEnemy13()
            }
            position12220x = true
        }
        if (player?.position.x)! >= 13220 {
            if !position13220x {
                enemy13?.removeFromParent()
            }
            position13220x = true
        }
        //Skeleton14
        if (player?.position.x)! >= 12440 {
            if !position12440x {
                spawnSkeleton14()
                stateMachineSkeleton14()
                physicsBodyEnemy14()
            }
            position12440x = true
        }
        if (player?.position.x)! >= 13440 {
            if !position13440x {
                enemy14?.removeFromParent()
            }
            position13440x = true
        }
        //Portal
        if (player?.position.x)! >= 12960 {
            if !position12960x {
                spawnPortalEmitter()
            }
            position12960x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel29")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            let transition = SKTransition.fade(withDuration: 1)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        }
    }
}

