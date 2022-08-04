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
class Level14: GameScene {
    
    var position660x: Bool = false
    var position1660x: Bool = false
    var position1860x: Bool = false
    var position2860x: Bool = false
    var position3120x: Bool = false
    var position4120x: Bool = false
    var position3180x: Bool = false
    var position4180x: Bool = false
    var position6660x: Bool = false
    var position7660x: Bool = false
    var position8700x: Bool = false
    var position8860x: Bool = false
    var position8800x: Bool = false
    var position8720x: Bool = false
    var position1020x: Bool = false
    var position900x: Bool = false
    var position2900x: Bool = false
    var position3260x: Bool = false
    var position6680x: Bool = false
    var position4140x: Bool = false
    var position6690x: Bool = false
    var position4240x: Bool = false
    var position6740x: Bool = false
    var position6000x: Bool = false
    var position7000x: Bool = false
    var position6270x: Bool = false
    var position8270x: Bool = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnPuddlePractileEmitter()
    }
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 6360, y: 400)
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
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 6500, y: 265)
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
            portal.position = CGPoint(x: 6500, y: 270)
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
        if (player?.position.x)! >= 6000 {
            if !position6000x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position7000x == false {
                    self!.spawnTrapBall()
                    self!.spawnPortal()
                    }
                }, SKAction.wait(forDuration: 3.0)])))
                position6000x = true
            }
        }
        if (player?.position.x)! >= 7000 {
            if !position7000x {
                position7000x = true
            }
        }
        //Stone
        if (player?.position.x)! >= 4240 {
            if !position4240x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position6740x == false {
                    self!.spawnStone()
                    }
                }, SKAction.wait(forDuration: 10.5)])))
                position4240x = true
            }
        }
        if (player?.position.x)! >= 6740 {
            if !position6740x {
                position6740x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 1020 {
            if !position1020x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position1020x = true
        }
        //Puddle2
        if (player?.position.x)! >= 900 {
            if !position900x {
                spawnPuddlePractileEmitter2()
            }
            position900x = true
        }
        
        if (player?.position.x)! >= 2900 {
            if !position2900x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position2900x = true
        }
        //Puddle3
        if (player?.position.x)! >= 3260 {
            if !position3260x {
                spawnPuddlePractileEmitter3()
            }
            position3260x = true
        }
        
        if (player?.position.x)! >= 6680 {
            if !position6680x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position6680x = true
        }
        //Puddle4
        if (player?.position.x)! >= 4140 {
            if !position4140x {
                spawnPuddlePractileEmitter4()
            }
            position4140x = true
        }
        
        if (player?.position.x)! >= 6690 {
            if !position6690x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position6690x = true
        }
        //Puddle5
        if (player?.position.x)! >= 6270 {
            if !position6270x {
                spawnPuddlePractileEmitter5()
            }
            position6270x = true
        }
        
        if (player?.position.x)! >= 8270 {
            if !position8270x {
                puddle5?.removeFromParent()
                puddleAnimation5.removeFromParent()
            }
            position8270x = true
        }
        //Skeleton1
        if (player?.position.x)! >= 660 {
            if !position660x {
                spawnSkeleton1()
                stateMachineSkeleton1()
                physicsBodyEnemy1()
            }
            position660x = true
        }
        
        if (player?.position.x)! >= 1610 {
            if !position1660x {
                enemy1?.removeFromParent()
            }
            position1660x = true
        }
        //Skeleton2
        if (player?.position.x)! >= 1860 {
            if !position1860x {
                spawnSkeleton2()
                stateMachineSkeleton2()
                physicsBodyEnemy2()
            }
            position1860x = true
        }
        
        if (player?.position.x)! >= 2840 {
            if !position2860x {
                enemy2?.removeFromParent()
            }
            position2860x = true
        }
        //Skeleton3
        if (player?.position.x)! >= 3120 {
            if !position3120x {
                spawnSkeleton3()
                stateMachineSkeleton3()
                physicsBodyEnemy3()
            }
            position3120x = true
        }
        
        if (player?.position.x)! >= 4120 {
            if !position4120x {
                enemy3?.removeFromParent()
            }
            position4120x = true
        }
        //Skeleton4
        if (player?.position.x)! >= 3180 {
            if !position3180x {
                spawnSkeleton4()
                stateMachineSkeleton4()
                physicsBodyEnemy4()
            }
            position3180x = true
        }
        
        if (player?.position.x)! >= 4180 {
            if !position4180x {
                enemy4?.removeFromParent()
            }
            position4180x = true
        }
        //Skeleton5
        if (player?.position.x)! >= 6660 {
            if !position6660x {
                spawnSkeleton5()
                stateMachineSkeleton5()
                physicsBodyEnemy5()
            }
            position6660x = true
        }
        
        if (player?.position.x)! >= 7660 {
            if !position7660x {
                enemy5?.removeFromParent()
            }
            position7660x = true
        }
        //Skeleton6
        if (player?.position.x)! >= 8700 {
            if !position8700x {
                spawnSkeleton6()
                stateMachineSkeleton6()
                physicsBodyEnemy6()
            }
            position8700x = true
        }
        //Skeleton7
        if (player?.position.x)! >= 8860 {
            if !position8860x {
                spawnSkeleton7()
                stateMachineSkeleton7()
                physicsBodyEnemy7()
            }
            position8860x = true
        }
        //Skeleton8
        if (player?.position.x)! >= 8800 {
            if !position8800x {
                spawnSkeleton8()
                stateMachineSkeleton8()
                physicsBodyEnemy8()
            }
            position8800x = true
        }
        //Portal
        if (player?.position.x)! >= 8720 {
            if !position8720x {
                spawnPortalEmitter()
            }
            position8720x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel14")
            
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

