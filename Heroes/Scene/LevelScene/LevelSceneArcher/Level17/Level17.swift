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
class Level17: GameScene {
    
    var position740x: Bool = false
    var position650x: Bool = false
    var position2650x: Bool = false
    var position7090x: Bool = false
    var position9090x: Bool = false
    var position8530x: Bool = false
    var position750x: Bool = false
    var position1750x: Bool = false
    var position870x: Bool = false
    var position1870x: Bool = false
    var position2300x: Bool = false
    var position3300x: Bool = false
    var position2880x: Bool = false
    var position3880x: Bool = false
    var position3050x: Bool = false
    var position4050x: Bool = false
    var position7150x: Bool = false
    var position8150x: Bool = false
    var position7380x: Bool = false
    var position8380x: Bool = false
    var position8280x: Bool = false
    var position9280x: Bool = false
    var position8470x: Bool = false
    var position9470x: Bool = false
    var position9890x: Bool = false
    var position9710x: Bool = false
    var position9000x: Bool = false
    var position10000x: Bool = false
    var position9330x: Bool = false
    var position10330x: Bool = false
    var position3200x: Bool = false
    var position7300x: Bool = false

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnPuddlePractileEmitter()
    }
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 9500, y: 165)
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
            portal.position = CGPoint(x: 9500, y: 170)
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
            stone.position = CGPoint(x: 9830, y: 205)
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
            portal.position = CGPoint(x: 9830, y: 210)
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
            stone.position = CGPoint(x: 6960, y: 275)
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
        
        Timer.scheduledTimer(withTimeInterval: 13.0, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal3() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 6960, y: 280)
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
        if (player?.position.x)! >= 9000 {
            if !position9000x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10000x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 2.0)])))
                position9000x = true
            }
        }
        if (player?.position.x)! >= 10000 {
            if !position10000x {
                position10000x = true
            }
        }
        //TrapBool_2
        if (player?.position.x)! >= 9330 {
            if !position9330x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10330x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 5.3)])))
                position9330x = true
            }
        }
        if (player?.position.x)! >= 10330 {
            if !position10330x {
                position10330x = true
            }
        }
        //TrapBool_3
        if (player?.position.x)! >= 3200 {
            if !position3200x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7300x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 6.0)])))
                position3200x = true
            }
        }
        if (player?.position.x)! >= 7300 {
            if !position7300x {
                position7300x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 740 {
            if !position740x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position740x = true
        }
        //Puddle2
        if (player?.position.x)! >= 650 {
            if !position650x {
                spawnPuddlePractileEmitter2()
            }
            position650x = true
        }
        
        if (player?.position.x)! >= 2650 {
            if !position2650x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position2650x = true
        }
        //Puddle3
        if (player?.position.x)! >= 7090 {
            if !position7090x {
                spawnPuddlePractileEmitter3()
            }
            position7090x = true
        }
        
        if (player?.position.x)! >= 9090 {
            if !position9090x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position9090x = true
        }
        //Puddle4
        if (player?.position.x)! >= 8530 {
            if !position8530x {
                spawnPuddlePractileEmitter4()
            }
            position8530x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 750 {
            if !position750x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position750x = true
        }
        
        if (player?.position.x)! >= 1750 {
            if !position1750x {
                enemy1?.removeFromParent()
            }
            position1750x = true
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
        if (player?.position.x)! >= 2300 {
            if !position2300x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position2300x = true
        }
        
        if (player?.position.x)! >= 3300 {
            if !position3300x {
                enemy3?.removeFromParent()
            }
            position3300x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 2880 {
            if !position2880x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position2880x = true
        }
        
        if (player?.position.x)! >= 3880 {
            if !position3880x {
                enemy4?.removeFromParent()
            }
            position3880x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 3050 {
            if !position3050x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position3050x = true
        }
        
        if (player?.position.x)! >= 4050 {
            if !position4050x {
                enemy5?.removeFromParent()
            }
            position4050x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 7150 {
            if !position7150x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position7150x = true
        }
        if (player?.position.x)! >= 8150 {
            if !position8150x {
                enemy6?.removeFromParent()
            }
            position8150x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 7380 {
            if !position7380x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position7380x = true
        }
        if (player?.position.x)! >= 8380 {
            if !position8380x {
                enemy7?.removeFromParent()
            }
            position8380x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 8280 {
            if !position8280x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position8280x = true
        }
        if (player?.position.x)! >= 9280 {
            if !position9280x {
                enemy8?.removeFromParent()
            }
            position9280x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 8470 {
            if !position8470x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position8470x = true
        }
        if (player?.position.x)! >= 9470 {
            if !position9470x {
                enemy9?.removeFromParent()
            }
            position9470x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 9890 {
            if !position9890x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position9890x = true
        }
        //Portal
        if (player?.position.x)! >= 9710 {
            if !position9710x {
                spawnPortalEmitter()
            }
            position9710x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel17")
            
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

