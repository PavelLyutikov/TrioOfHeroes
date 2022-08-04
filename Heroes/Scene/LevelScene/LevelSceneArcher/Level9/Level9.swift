//
//  Level9.swift
//  Elon's Adventure
//
//  Created by mac on 20.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level9: GameScene {
    
    var position1000x: Bool = false
    var position2000x: Bool = false
    var position1360x: Bool = false
    var position2360x: Bool = false
    var position4740x: Bool = false
    var position5740x: Bool = false
    var position5000x: Bool = false
    var position6000x: Bool = false
    var position5300x: Bool = false
    var position5840x: Bool = false
    var position6840x: Bool = false
    var position6300x: Bool = false
    var position6240x: Bool = false
    var position7240x: Bool = false
    var position7050x: Bool = false
    var position8050x: Bool = false
    var position8560x: Bool = false
    var position8860x: Bool = false
    var position8780x: Bool = false
    var position1920x: Bool = false
    var position4480x: Bool = false
    var position7200x: Bool = false
    var position8200x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 7700, y: 255)
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
            portal.position = CGPoint(x: 7700, y: 260)
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
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 4250, y: 380)
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
        
            Timer.scheduledTimer(withTimeInterval: 13.0, repeats: false) { (timer) in
                let remove = SKAction.removeFromParent()
                stone.run(SKAction.sequence([remove]))
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
        
        //Stone
        if (player?.position.x)! >= 1920 {
            if !position1920x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position4480x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 6.0)])))
                position1920x = true
            }
        }
                
        if (player?.position.x)! >= 4480 {
            if !position4480x {
                position4480x = true
            }
        }
        //TrapPortal_1
        if (player?.position.x)! >= 7200 {
            if !position7200x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position8200x == false {
                    self!.spawnPortal()
                    self!.spawnTrapBall()
                    }
                }, SKAction.wait(forDuration: 4.0)])))
                position7200x = true
            }
        }
                
        if (player?.position.x)! >= 8200 {
            if !position8200x {
                position8200x = true
            }
        }
        //Skeleton1
        if (player?.position.x)! >= 1000 {
            if !position1000x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position1000x = true
        }
        
        if (player?.position.x)! >= 2000 {
            if !position2000x {
                enemy1?.removeFromParent()
            }
            position2000x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1360 {
            if !position1360x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1360x = true
        }
        
        if (player?.position.x)! >= 2360 {
            if !position2360x {
                enemy2?.removeFromParent()
            }
            position2360x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 4740 {
            if !position4740x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position4740x = true
        }
        
        if (player?.position.x)! >= 5740 {
            if !position5740x {
                enemy3?.removeFromParent()
            }
            position5740x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 5000 {
            if !position5000x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position5000x = true
        }
        
        if (player?.position.x)! >= 6000 {
            if !position6000x {
                enemy4?.removeFromParent()
            }
            position6000x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 5300 {
            if !position5300x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position5300x = true
        }
        
        if (player?.position.x)! >= 6300 {
            if !position6300x {
                enemy5?.removeFromParent()
            }
            position6300x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 5840 {
            if !position5840x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position5840x = true
        }
        
        if (player?.position.x)! >= 6840 {
            if !position6840x {
                enemy6?.removeFromParent()
            }
            position6840x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 6240 {
            if !position6240x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position6240x = true
        }
        
        if (player?.position.x)! >= 7240 {
            if !position7240x {
                enemy7?.removeFromParent()
            }
            position7240x = true
        }
        
        //Skeleton8
        if (player?.position.x)! >= 7050 {
            if !position7050x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position7050x = true
        }
        if (player?.position.x)! >= 8050 {
            if !position8050x {
                enemy8?.removeFromParent()
            }
            position8050x = true
        }
        //Skeleton9
        if (player?.position.x)! >= 8560 {
            if !position8560x {
                spawnSkeleton9()
                stateMachineSkeleton9()
                physicsBodyEnemy9()
            }
            position8560x = true
        }
        //Skeleton10
        if (player?.position.x)! >= 8860 {
            if !position8860x {
                spawnSkeleton10()
                stateMachineSkeleton10()
                physicsBodyEnemy10()
            }
            position8860x = true
        }
        //Portal
        if (player?.position.x)! >= 8780 {
            if !position8780x {
                spawnPortalEmitter()
            }
            position8780x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel9")
            
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
