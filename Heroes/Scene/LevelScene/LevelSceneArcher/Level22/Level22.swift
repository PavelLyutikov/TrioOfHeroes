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
class Level22: GameScene {
    
    var position100x: Bool = false
    var position1100x: Bool = false
    var position1430x: Bool = false
    var position2430x: Bool = false
    var position3480x: Bool = false
    var position4480x: Bool = false
    var position3780x: Bool = false
    var position4780x: Bool = false
    var position4230x: Bool = false
    var position5230x: Bool = false
    var position5380x: Bool = false
    var position6380x: Bool = false
    var position5510x: Bool = false
    var position6510x: Bool = false
    var position9980x: Bool = false
    var position10980x: Bool = false
    var position11220x: Bool = false
    var position3160x: Bool = false
    var position5160x: Bool = false
    var position3360x: Bool = false
    var position5360x: Bool = false
    var position6160x: Bool = false
    var position7600x: Bool = false
    var position1700x: Bool = false
    var position3600x: Bool = false
    var position4160x: Bool = false
    var position5600x: Bool = false
    var position5900x: Bool = false
    var position9520x: Bool = false
    var position10080x: Bool = false
    var position11280x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 6120, y: -40)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 50, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.7)
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
            portal.position = CGPoint(x: 6105, y: -40)
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
            stone.position = CGPoint(x: 3220, y: 265)
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
    func spawnPortal() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 3220, y: 270)
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
            stone.position = CGPoint(x: 3420, y: 265)
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
            portal.position = CGPoint(x: 3420, y: 270)
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
            stone.position = CGPoint(x: 5160, y: 265)
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
            portal.position = CGPoint(x: 5160, y: 270)
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
            stone.position = CGPoint(x: 8000, y: 125)
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
    func spawnPortal4() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 8000, y: 130)
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
            stone.position = CGPoint(x: 9200, y: 225)
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
    func spawnPortal5() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 9200, y: 230)
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
    func spawnTrapBall6() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 10760, y: 255)
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
    func spawnPortal6() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 10760, y: 260)
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
        
        //TrapBool_1_2
        if (player?.position.x)! >= 1700 {
            if !position1700x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3600x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 2.6)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3600x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 7.5)])))
                position1700x = true
            }
        }
        if (player?.position.x)! >= 3600 {
            if !position3600x {
                position3600x = true
            }
        }
        //TrapBool_3
        if (player?.position.x)! >= 4160 {
            if !position4160x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5600x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                }
                }, SKAction.wait(forDuration: 7.2)])))
                position4160x = true
            }
        }
        if (player?.position.x)! >= 5600 {
            if !position5600x {
                position5600x = true
            }
        }
        //TrapBool_5_7
        if (player?.position.x)! >= 5900 {
            if !position5900x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9520x == false {
                    self!.spawnTrapBall4()
                    self!.spawnPortal4()
                    }
                }, SKAction.wait(forDuration: 6.2)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9520x == false {
                    self!.spawnTrapBall5()
                    self!.spawnPortal5()
                    }
                }, SKAction.wait(forDuration: 2.1)])))
                position5900x = true
            }
        }
        if (player?.position.x)! >= 9520 {
            if !position9520x {
                position9520x = true
            }
        }
        //TrapBool_8
        if (player?.position.x)! >= 10080 {
            if !position10080x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11280x == false {
                    self!.spawnTrapBall6()
                    self!.spawnPortal6()
                }
                }, SKAction.wait(forDuration: 5.2)])))
                position10080x = true
            }
        }
        if (player?.position.x)! >= 11280 {
            if !position11280x {
                position11280x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 6160 {
            if !position6160x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7600x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.3)])))
                position6160x = true
            }
        }
        if (player?.position.x)! >= 7600 {
            if !position7600x {
                position7600x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 3160 {
            if !position3160x {
                spawnPuddlePractileEmitter()
            }
            position3160x = true
        }
        if (player?.position.x)! >= 5160 {
            if !position5160x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position5160x = true
        }
        //Puddle2
        if (player?.position.x)! >= 3360 {
            if !position3360x {
                spawnPuddlePractileEmitter2()
            }
            position3360x = true
        }
        
        if (player?.position.x)! >= 5360 {
            if !position5360x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position5360x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 100 {
            if !position100x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position100x = true
        }
        
        if (player?.position.x)! >= 1100 {
            if !position1100x {
                enemy1?.removeFromParent()
            }
            position1100x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1430 {
            if !position1430x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1430x = true
        }
        
        if (player?.position.x)! >= 2430 {
            if !position2430x {
                enemy2?.removeFromParent()
            }
            position2430x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 3480 {
            if !position3480x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position3480x = true
        }
        
        if (player?.position.x)! >= 4480 {
            if !position4480x {
                enemy3?.removeFromParent()
            }
            position4480x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 3780 {
            if !position3780x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position3780x = true
        }
        
        if (player?.position.x)! >= 4780 {
            if !position4780x {
                enemy4?.removeFromParent()
            }
            position4780x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 4230 {
            if !position4230x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position4230x = true
        }
        if (player?.position.x)! >= 5230 {
            if !position5230x {
                enemy5?.removeFromParent()
            }
            position5230x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 5380 {
            if !position5380x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position5380x = true
        }
        if (player?.position.x)! >= 6380 {
            if !position6380x {
                enemy6?.removeFromParent()
            }
            position6380x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 5510 {
            if !position5510x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position5510x = true
        }
        if (player?.position.x)! >= 6510 {
            if !position6510x {
                enemy7?.removeFromParent()
            }
            position6510x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 9980 {
            if !position9980x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position9980x = true
        }
        if (player?.position.x)! >= 10980 {
            if !position10980x {
                enemy8?.removeFromParent()
            }
            position10980x = true
        }
        //Portal
        if (player?.position.x)! >= 11220 {
            if !position11220x {
                spawnPortalEmitter()
            }
            position11220x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel22")
            
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

