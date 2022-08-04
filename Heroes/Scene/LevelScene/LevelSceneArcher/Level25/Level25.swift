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
class Level25: GameScene {
    
    var position940x: Bool = false
    var position1940x: Bool = false
    var position1230x: Bool = false
    var position2230x: Bool = false
    var position5120x: Bool = false
    var position6120x: Bool = false
    var position5280x: Bool = false
    var position6280x: Bool = false
    var position8110x: Bool = false
    var position9110x: Bool = false
    var position8270x: Bool = false
    var position9270x: Bool = false
    var position9680x: Bool = false
    var position10680x: Bool = false
    var position10580x: Bool = false
    var position11580x: Bool = false
    var position10730x: Bool = false
    var position11730x: Bool = false
    var position12060x: Bool = false
    var position12210x: Bool = false
    var position1680x: Bool = false
    var position1600x: Bool = false
    var position3600x: Bool = false
    var position9060x: Bool = false
    var position11060x: Bool = false
    var position560x: Bool = false
    var position2040x: Bool = false
    var position3960x: Bool = false
    var position5130x: Bool = false
    var position5440x: Bool = false
    var position7880x: Bool = false
    var position8320x: Bool = false
    var position9380x: Bool = false
    var position9400x: Bool = false
    var position10640x: Bool = false
    var position10480x: Bool = false
    var position11720x: Bool = false
    var position12020x: Bool = false
    
    let rain = SKEmitterNode(fileNamed: "RainLevel25.sks")!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        spawnRainEmitter()
        spawnPuddlePractileEmitter()
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 1925, y: -90)
            arrow.zPosition = 5
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
            portal.zPosition = 4
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
            arrow.zPosition = 5
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
            portal.zPosition = 4
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
            stone.position = CGPoint(x: 11520, y: 165)
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
            portal.position = CGPoint(x: 11520, y: 170)
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
//MARK: - SpawnEmitterRain
    func spawnRainEmitter() {
        rain.zPosition = 1
        addChild(rain)
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
        
        rain.position = CGPoint(x: 6000, y: cameraNode!.position.y + 170)
        
        //TrapBool_1
        if (player?.position.x)! >= 8320 {
            if !position8320x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9380x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9380x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 4.8)])))
                position8320x = true
            }
        }
        if (player?.position.x)! >= 9380 {
            if !position9380x {
                position9380x = true
            }
        }
        //TrapBool_2
        if (player?.position.x)! >= 9400 {
            if !position9400x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10640x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 3.2)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10640x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                }
                }, SKAction.wait(forDuration: 5.2)])))
                position9400x = true
            }
        }
        if (player?.position.x)! >= 10640 {
            if !position10640x {
                position10640x = true
            }
        }
        //TrapBool_3
        if (player?.position.x)! >= 10480 {
            if !position10480x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11720x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 4.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position11720x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 7.1)])))
                position10480x = true
            }
        }
        if (player?.position.x)! >= 11720 {
            if !position11720x {
                position11720x = true
            }
        }
        //Stone
        if (player?.position.x)! >= 5440 {
            if !position5440x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7880x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 8.6)])))
                position5440x = true
            }
        }
        if (player?.position.x)! >= 7880 {
            if !position7880x {
                position7880x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 560 {
            if !position560x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2040x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                position560x = true
            }
        }
        if (player?.position.x)! >= 2040 {
            if !position2040x {
                position2040x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 3960 {
            if !position3960x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5130x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 2.5)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5130x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                position3960x = true
            }
        }
        if (player?.position.x)! >= 5130 {
            if !position5130x {
                position5130x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 1680 {
            if !position1680x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position1680x = true
        }
        //Puddle2
        if (player?.position.x)! >= 1600 {
            if !position1600x {
                spawnPuddlePractileEmitter2()
            }
            position1600x = true
        }
        
        if (player?.position.x)! >= 4080 {
            if !position3600x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position3600x = true
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
        //Skeleton1
        if (player?.position.x)! >= 940 {
            if !position940x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position940x = true
        }
        
        if (player?.position.x)! >= 1940 {
            if !position1940x {
                enemy1?.removeFromParent()
            }
            position1940x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1230 {
            if !position1230x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1230x = true
        }
        
        if (player?.position.x)! >= 2230 {
            if !position2230x {
                enemy2?.removeFromParent()
            }
            position2230x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 5120 {
            if !position5120x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position5120x = true
        }
        
        if (player?.position.x)! >= 6120 {
            if !position6120x {
                enemy3?.removeFromParent()
            }
            position6120x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 5280 {
            if !position5280x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position5280x = true
        }
        
        if (player?.position.x)! >= 6280 {
            if !position6280x {
                enemy4?.removeFromParent()
            }
            position6280x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 8110 {
            if !position8110x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position8110x = true
        }
        if (player?.position.x)! >= 9110 {
            if !position9110x {
                enemy5?.removeFromParent()
            }
            position9110x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 8270 {
            if !position8270x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position8270x = true
        }
        if (player?.position.x)! >= 9270 {
            if !position9270x {
                enemy6?.removeFromParent()
            }
            position9270x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 9680 {
            if !position9680x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position9680x = true
        }
        if (player?.position.x)! >= 10680 {
            if !position10680x {
                enemy7?.removeFromParent()
            }
            position10680x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 10580 {
            if !position10580x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position10580x = true
        }
        if (player?.position.x)! >= 11580 {
            if !position11580x {
                enemy8?.removeFromParent()
            }
            position11580x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 10730 {
            if !position10730x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position10730x = true
        }
        if (player?.position.x)! >= 11730 {
            if !position11730x {
                enemy9?.removeFromParent()
            }
            position11730x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 12060 {
            if !position12060x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position12060x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 12210 {
            if !position12210x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position12210x = true
        }
        //Portal
        if (player?.position.x)! >= 12020 {
            if !position12020x {
                spawnPortalEmitter()
            }
            position12020x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel25")
            
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

