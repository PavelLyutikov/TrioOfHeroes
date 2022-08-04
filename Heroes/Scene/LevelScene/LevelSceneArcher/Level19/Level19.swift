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
class Level19: GameScene {
    
    var position2340x: Bool = false
    var position3340x: Bool = false
    var position2680x: Bool = false
    var position3680x: Bool = false
    var position5230x: Bool = false
    var position6230x: Bool = false
    var position5640x: Bool = false
    var position6640x: Bool = false
    var position5950x: Bool = false
    var position6950x: Bool = false
    var position9260x: Bool = false
    var position10260x: Bool = false
    var position9930x: Bool = false
    var position650x: Bool = false
    var position2650x: Bool = false
    var position3800x: Bool = false
    var position5800x: Bool = false
    var position7490x: Bool = false
    var position9490x: Bool = false
    var position6170x: Bool = false
    var position9070x: Bool = false
    var position880x: Bool = false
    var position2240x: Bool = false
    var position4700x: Bool = false
    var position5360x: Bool = false
    var position9060x: Bool = false
    var position10410x: Bool = false

    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 2040, y: -100)
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
            portal.position = CGPoint(x: 2055, y: -100)
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
            arrow.position = CGPoint(x: 5210, y: -80)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -18, dy: 0)
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
            portal.position = CGPoint(x: 5225, y: -80)
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
//MARK: - SpanwStone
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.7)
            stone.position = CGPoint(x: 8820, y: 320)
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
        
            Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
                let remove = SKAction.removeFromParent()
                stone.run(SKAction.sequence([remove]))
            }
    }
//MARK: - TrapBall
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 9910, y: 195)
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
            portal.position = CGPoint(x: 9910, y: 200)
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
        if (player?.position.x)! >= 9060 {
            if !position9060x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10410x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                position9060x = true
            }
        }
        if (player?.position.x)! >= 10410 {
            if !position10410x {
                position10410x = true
            }
        }
        //Stone
        if (player?.position.x)! >= 6170 {
            if !position6170x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9070x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 9.2)])))
                position6170x = true
            }
        }
        if (player?.position.x)! >= 9070 {
            if !position9070x {
                position9070x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 880 {
            if !position880x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position2240x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.0)])))
                position880x = true
            }
        }
        if (player?.position.x)! >= 2240 {
            if !position2240x {
                position2240x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 4700 {
            if !position4700x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position5360x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 2.5)])))
                position4700x = true
            }
        }
        if (player?.position.x)! >= 5360 {
            if !position5360x {
                position5360x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 650 {
            if !position650x {
                spawnPuddlePractileEmitter()
            }
            position650x = true
        }
        if (player?.position.x)! >= 2650 {
            if !position2650x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position2650x = true
        }
        //Puddle2
        if (player?.position.x)! >= 3800 {
            if !position3800x {
                spawnPuddlePractileEmitter2()
            }
            position3800x = true
        }
        
        if (player?.position.x)! >= 5800 {
            if !position5800x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position5800x = true
        }
        //Puddle3
        if (player?.position.x)! >= 7490 {
            if !position7490x {
                spawnPuddlePractileEmitter3()
            }
            position7490x = true
        }
        
        if (player?.position.x)! >= 9490 {
            if !position9490x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position9490x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 2340 {
            if !position2340x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position2340x = true
        }
        
        if (player?.position.x)! >= 3340 {
            if !position3340x {
                enemy1?.removeFromParent()
            }
            position3340x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 2680 {
            if !position2680x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position2680x = true
        }
        
        if (player?.position.x)! >= 3680 {
            if !position3680x {
                enemy2?.removeFromParent()
            }
            position3680x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 5230 {
            if !position5230x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position5230x = true
        }
        
        if (player?.position.x)! >= 6230 {
            if !position6230x {
                enemy3?.removeFromParent()
            }
            position6230x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 5640 {
            if !position5640x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position5640x = true
        }
        
        if (player?.position.x)! >= 6640 {
            if !position6640x {
                enemy4?.removeFromParent()
            }
            position6640x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 5950 {
            if !position5950x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position5950x = true
        }
        if (player?.position.x)! >= 6950 {
            if !position6950x {
                enemy5?.removeFromParent()
            }
            position6950x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 9260 {
            if !position9260x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position9260x = true
        }
        if (player?.position.x)! >= 10260 {
            if !position10260x {
                enemy6?.removeFromParent()
            }
            position10260x = true
        }
        //Portal
        if (player?.position.x)! >= 9930 {
            if !position9930x {
                spawnPortalEmitter()
            }
            position9930x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel19")
            
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

