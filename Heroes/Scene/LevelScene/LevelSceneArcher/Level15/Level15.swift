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
class Level15: GameScene {
    
    var position1x: Bool = false
    var position1000x: Bool = false
    var position320x: Bool = false
    var position1320x: Bool = false
    var position2300x: Bool = false
    var position3300x: Bool = false
    var position2860x: Bool = false
    var position3860x: Bool = false
    var position3200x: Bool = false
    var position4200x: Bool = false
    var position4740x: Bool = false
    var position5740x: Bool = false
    var position5060x: Bool = false
    var position6060x: Bool = false
    var position6080x: Bool = false
    var position7080x: Bool = false
    var position6260x: Bool = false
    var position7260x: Bool = false
    var position7060x: Bool = false
    var position8060x: Bool = false
    var position7340x: Bool = false
    var position8340x: Bool = false
    var position8560x: Bool = false
    var position1610x: Bool = false
    var position540x: Bool = false
    var position2540x: Bool = false
    var position2980x: Bool = false
    var position4980x: Bool = false
    var position4270x: Bool = false
    var position6270x: Bool = false
    var position7920x: Bool = false
    var position8920x: Bool = false
    var position8230x: Bool = false
    var position9230x: Bool = false
    var position8550x: Bool = false
    var position9550x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnPuddlePractileEmitter()
    }
//MARK: - SpawnTrapBall
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 8420, y: 165)
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
            portal.position = CGPoint(x: 8420, y: 170)
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
            stone.position = CGPoint(x: 8730, y: 165)
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
            portal.position = CGPoint(x: 8730, y: 170)
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
            stone.position = CGPoint(x: 9050, y: 165)
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
            portal.position = CGPoint(x: 9050, y: 170)
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
        if (player?.position.x)! >= 7920 {
            if !position7920x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8920x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                position7920x = true
            }
        }
        if (player?.position.x)! >= 8920 {
            if !position8920x {
                position8920x = true
            }
        }
        //TrapBool_2
        if (player?.position.x)! >= 8230 {
            if !position8230x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9230x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                position8230x = true
            }
        }
        if (player?.position.x)! >= 9230 {
            if !position9230x {
                position9230x = true
            }
        }
        //TrapBool_3
        if (player?.position.x)! >= 8550 {
            if !position8550x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9550x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 10.0)])))
                position8550x = true
            }
        }
        if (player?.position.x)! >= 9550 {
            if !position9550x {
                position9550x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 1610 {
            if !position1610x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position1610x = true
        }
        //Puddle2
        if (player?.position.x)! >= 540 {
            if !position540x {
                spawnPuddlePractileEmitter2()
            }
            position540x = true
        }
        
        if (player?.position.x)! >= 2540 {
            if !position2540x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position2540x = true
        }
        //Puddle3
        if (player?.position.x)! >= 2980 {
            if !position2980x {
                spawnPuddlePractileEmitter3()
            }
            position2980x = true
        }
        
        if (player?.position.x)! >= 4980 {
            if !position4980x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position4980x = true
        }
        //Puddle4
        if (player?.position.x)! >= 4270 {
            if !position4270x {
                spawnPuddlePractileEmitter4()
            }
            position4270x = true
        }
        
        if (player?.position.x)! >= 6270 {
            if !position6270x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position6270x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 1 {
            if !position1x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position1x = true
        }
        
        if (player?.position.x)! >= 1000 {
            if !position1000x {
                enemy1?.removeFromParent()
            }
            position1000x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 320 {
            if !position320x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position320x = true
        }
        
        if (player?.position.x)! >= 1320 {
            if !position1320x {
                enemy2?.removeFromParent()
            }
            position1320x = true
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
        if (player?.position.x)! >= 2860 {
            if !position2860x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position2860x = true
        }
        
        if (player?.position.x)! >= 3860 {
            if !position3860x {
                enemy4?.removeFromParent()
            }
            position3860x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 3200 {
            if !position3200x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position3200x = true
        }
        
        if (player?.position.x)! >= 4200 {
            if !position4200x {
                enemy5?.removeFromParent()
            }
            position4200x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 4740 {
            if !position4740x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position4740x = true
        }
        if (player?.position.x)! >= 5740 {
            if !position5740x {
                enemy6?.removeFromParent()
            }
            position5740x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 5060 {
            if !position5060x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position5060x = true
        }
        if (player?.position.x)! >= 6060 {
            if !position6060x {
                enemy7?.removeFromParent()
            }
            position6060x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 6080 {
            if !position6080x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position6080x = true
        }
        if (player?.position.x)! >= 7080 {
            if !position7080x {
                enemy8?.removeFromParent()
            }
            position7080x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 6260 {
            if !position6260x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position6260x = true
        }
        if (player?.position.x)! >= 7260 {
            if !position7260x {
                enemy9?.removeFromParent()
            }
            position7260x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 7060 {
            if !position7060x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position7060x = true
        }
        if (player?.position.x)! >= 8060 {
            if !position8060x {
                enemy10?.removeFromParent()
            }
            position8060x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 7340 {
            if !position7340x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position7340x = true
        }
        if (player?.position.x)! >= 8340 {
            if !position8340x {
                enemy11?.removeFromParent()
            }
            position8340x = true
        }
        //Portal
        if (player?.position.x)! >= 8560 {
            if !position8560x {
                spawnPortalEmitter()
            }
            position8560x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel15")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            let transition = SKTransition.fade(withDuration: 1)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
//            run(Sound.levelUp.action)
        }
    }
}

