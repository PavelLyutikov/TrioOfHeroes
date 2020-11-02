//
//  Level10.swift
//  Elon's Adventure
//
//  Created by mac on 20.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

class Level21: GameScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        UserDefaults.standard.set(21, forKey: "levelNumber")
       
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 2.3)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall()
            self!.spawnPortal()
        }, SKAction.wait(forDuration: 5.6)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 4.6)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 4.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnStone()
        }, SKAction.wait(forDuration: 18.7)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy3()
        }, SKAction.wait(forDuration: 2.1)])))

        spawnPuddlePractileEmitter()
        spawnPuddlePractileEmitter2()
        spawnPuddlePractileEmitter3()
        
        spawnSkeleton1()
        spawnSkeleton2()
        spawnSkeleton3()
        spawnSkeleton4()
        spawnSkeleton5()
        spawnSkeleton6()
        stateMachineSkeleton1()
        stateMachineSkeleton2()
        stateMachineSkeleton3()
        stateMachineSkeleton4()
        stateMachineSkeleton5()
        stateMachineSkeleton6()
        physicsBodyEnemy1()
        physicsBodyEnemy2()
        physicsBodyEnemy3()
        physicsBodyEnemy4()
        physicsBodyEnemy5()
        physicsBodyEnemy6()
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 4150, y: -100)
            arrow.zPosition = 30
            arrow.zRotation = 3.12
            addChild(arrow)
        
            let action = CGVector(dx: 40, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.7)
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([impulse, remove]))
        
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask
            
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        
        
            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
        portal.setScale(0.6)
            portal.position = CGPoint(x: 4130, y: -100)
            portal.zPosition = 29
            portal.zRotation = 1.5
            addChild(portal)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnArrowEnemy2() {

            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 6710, y: -60)
            arrow.zPosition = 30
//            arrow.zRotation = 3.12

            addChild(arrow)

            let action = CGVector(dx: -40, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.0)
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([impulse, remove]))

            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false


            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
        portal.setScale(0.6)
            portal.position = CGPoint(x: 6730, y: -60)
            portal.zPosition = 29
            portal.zRotation = -1.6
            addChild(portal)

            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnArrowEnemy3() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 10850, y: -50)
            arrow.zPosition = 30
//            arrow.zRotation = 3.12
            addChild(arrow)
        
            let action = CGVector(dx: -40, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.0)
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([impulse, remove]))
        
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask
            
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        
        
            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 10870, y: -50)
            portal.zPosition = 1.5
            portal.zRotation = 4.7
            addChild(portal)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
//MARK: - SpanwStone
    func spawnStone() {
            let stone = SKSpriteNode(imageNamed: "stone")
            stone.name = "Stone"
            stone.setScale(0.7)
            stone.position = CGPoint(x: 9840, y: 320)
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
//MARK: - PortalEndBall
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 3140, y: 150)
            stone.zPosition = 30
            addChild(stone)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 30)
            stone.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask
            
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal() {
        
            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 3140, y: 170)
            portal.zPosition = 29
            addChild(portal)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnTrapBall2() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 7700, y: 150)
            stone.zPosition = 30
            addChild(stone)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 30)
            stone.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask
            
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal2() {
        
            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 7700, y: 170)
            portal.zPosition = 29
            addChild(portal)
        
            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
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
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel21")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        }
    }
}

