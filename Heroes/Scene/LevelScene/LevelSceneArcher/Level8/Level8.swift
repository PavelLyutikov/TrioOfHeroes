//
//  Level8.swift
//  Elon's Adventure
//
//  Created by mac on 20.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level8: GameScene {
    
    var position500x: Bool = false
    var position1500x: Bool = false
    var position2220x: Bool = false
    var position3220x: Bool = false
    var position3720x: Bool = false
    var position4720x: Bool = false
    var position4100x: Bool = false
    var position5100x: Bool = false
    var position4740x: Bool = false
    var position5740x: Bool = false
    var position4980x: Bool = false
    var position5980x: Bool = false
    var position5300x: Bool = false
    var position6300x: Bool = false
    var position5700x: Bool = false
    var position6700x: Bool = false
    var position6410x: Bool = false
    var position7410x: Bool = false
    var position6860x: Bool = false
    var position7860x: Bool = false
    var position7580x: Bool = false
    var position8580x: Bool = false
    var position8700x: Bool = false
    var position8650x: Bool = false
    var position650x: Bool = false
    var position1650x: Bool = false
    var position2650x: Bool = false
    var position3650x: Bool = false
    var position8040x: Bool = false
    var position9040x: Bool = false
    
    let rain = SKEmitterNode(fileNamed: "RainLevel8.sks")!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnRainEmitter()
    }
    
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 1150, y: 165)
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
            portal.position = CGPoint(x: 1150, y: 170)
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
            stone.position = CGPoint(x: 3130, y: 135)
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
            portal.position = CGPoint(x: 3130, y: 140)
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
            stone.position = CGPoint(x: 8540, y: 165)
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
            portal.position = CGPoint(x: 8540, y: 170)
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
        
        rain.position = CGPoint(x: 4800, y: cameraNode!.position.y + 170)
        
        //TrapPortal_1
        if (player?.position.x)! >= 650 {
            if !position650x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position1650x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                position650x = true
            }
        }
                
        if (player?.position.x)! >= 1650 {
            if !position1650x {
                position1650x = true
            }
        }
        //TrapPortal_2
        if (player?.position.x)! >= 2650 {
            if !position2650x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3650x == false {
                    self!.spawnTrapBall2()
                    self!.spawnPortal2()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                position2650x = true
            }
        }
                
        if (player?.position.x)! >= 3650 {
            if !position3650x {
                position3650x = true
            }
        }
        //TrapPortal_3
        if (player?.position.x)! >= 8040 {
            if !position8040x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position9040x == false {
                    self!.spawnTrapBall3()
                    self!.spawnPortal3()
                    }
                }, SKAction.wait(forDuration: 3.5)])))
                position8040x = true
            }
        }
                
        if (player?.position.x)! >= 9040 {
            if !position9040x {
                position9040x = true
            }
        }
        //Skeleton1
        if (player?.position.x)! >= 500 {
            if !position500x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position500x = true
        }
        
        if (player?.position.x)! >= 1500 {
            if !position1500x {
                enemy1?.removeFromParent()
            }
            position1500x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 2220 {
            if !position2220x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position2220x = true
        }
        
        if (player?.position.x)! >= 3220 {
            if !position3220x {
                enemy2?.removeFromParent()
            }
            position3220x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 3720 {
            if !position3720x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position3720x = true
        }
        
        if (player?.position.x)! >= 4720 {
            if !position4720x {
                enemy3?.removeFromParent()
            }
            position4720x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 4100 {
            if !position4100x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position4100x = true
        }
        
        if (player?.position.x)! >= 5100 {
            if !position5100x {
                enemy4?.removeFromParent()
            }
            position5100x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 4740 {
            if !position4740x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position4740x = true
        }
        
        if (player?.position.x)! >= 5740 {
            if !position5740x {
                enemy5?.removeFromParent()
            }
            position5740x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 4980 {
            if !position4980x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position4980x = true
        }
        
        if (player?.position.x)! >= 5980 {
            if !position5980x {
                enemy6?.removeFromParent()
            }
            position5980x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 5300 {
            if !position5300x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position5300x = true
        }
        
        if (player?.position.x)! >= 6300 {
            if !position6300x {
                enemy7?.removeFromParent()
            }
            position6300x = true
        }
        
        //Skeleton8
        if (player?.position.x)! >= 5700 {
            if !position5700x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position5700x = true
        }
        if (player?.position.x)! >= 6700 {
            if !position6700x {
                enemy8?.removeFromParent()
            }
            position6700x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 6410 {
            if !position6410x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position6410x = true
        }
        if (player?.position.x)! >= 7410 {
            if !position7410x {
                enemy9?.removeFromParent()
            }
            position7410x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 6860 {
            if !position6860x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position6860x = true
        }
        if (player?.position.x)! >= 7860 {
            if !position7860x {
                enemy10?.removeFromParent()
            }
            position7860x = true
        }
        //Skeleton11
        if (player?.position.x)! >= 7580 {
            if !position7580x {
                spawnSkeleton11()
                stateMachineSkeleton11()
                physicsBodyEnemy11()
            }
            position7580x = true
        }
        if (player?.position.x)! >= 8580 {
            if !position8580x {
                enemy11?.removeFromParent()
            }
            position7860x = true
        }
        //Skeleton12
        if (player?.position.x)! >= 8700 {
            if !position8700x {
                spawnSkeleton12()
                stateMachineSkeleton12()
                physicsBodyEnemy12()
            }
            position8700x = true
        }
        //Portal
        if (player?.position.x)! >= 8650 {
            if !position8650x {
                spawnPortalEmitter()
            }
            position8650x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel8")
            
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

