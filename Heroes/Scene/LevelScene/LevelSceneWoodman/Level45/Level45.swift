//
//  Level36.swift
//  Elon's Adventure
//
//  Created by mac on 08.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

class Level45: GameScene {
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    var groundAction2_1: SKNode?
    var groundAction2_2: SKNode?
    var groundAction2_3: SKNode?
    var groundAction2_4: SKNode?
    
    var groundAction3_1: SKNode?
    var groundAction3_2: SKNode?
    var groundAction3_3: SKNode?
    var groundAction3_4: SKNode?
    
    var groundFakeAction1: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        groundAction1_1 = childNode(withName: "groundAction1_1")
        groundAction1_2 = childNode(withName: "groundAction1_2")
        groundAction1_3 = childNode(withName: "groundAction1_3")
        groundAction1_4 = childNode(withName: "groundAction1_4")
        
        groundAction2_1 = childNode(withName: "groundAction2_1")
        groundAction2_2 = childNode(withName: "groundAction2_2")
        groundAction2_3 = childNode(withName: "groundAction2_3")
        groundAction2_4 = childNode(withName: "groundAction2_4")
        
        groundAction3_1 = childNode(withName: "groundAction3_1")
        groundAction3_2 = childNode(withName: "groundAction3_2")
        groundAction3_3 = childNode(withName: "groundAction3_3")
        groundAction3_4 = childNode(withName: "groundAction3_4")
        
        groundFakeAction1 = childNode(withName: "groundFakeAction1")
        
        UserDefaults.standard.set(45, forKey: "levelNumber")

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 2.9)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 4.1)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy5()
        }, SKAction.wait(forDuration: 3.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy5()
        }, SKAction.wait(forDuration: 5.1)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 3.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 5.6)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 2.8)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 7.9)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall3()
            self!.spawnPortal3()
        }, SKAction.wait(forDuration: 5.2)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall3()
            self!.spawnPortal3()
        }, SKAction.wait(forDuration: 10.4)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall3()
            self!.spawnPortal3()
        }, SKAction.wait(forDuration: 3.1)])))
        
        spawnPuddlePractileEmitter()
        spawnPuddlePractileEmitter2()
        spawnPuddlePractileEmitter3()
        spawnPuddlePractileEmitter4()
        
        spawnGoblin1()
        spawnGoblin2()
        spawnGoblin3()
        spawnGoblin4()
        spawnGoblin5()
        spawnGoblin6()
        spawnGoblin7()
        spawnGoblin8()
        spawnGoblin9()
        spawnGoblin10()
        spawnGoblin11()
        stateMachineGoblin1()
        stateMachineGoblin2()
        stateMachineGoblin3()
        stateMachineGoblin4()
        stateMachineGoblin5()
        stateMachineGoblin6()
        stateMachineGoblin7()
        stateMachineGoblin8()
        stateMachineGoblin9()
        stateMachineGoblin10()
        stateMachineGoblin11()
        physicsBodyEnemy1()
        physicsBodyEnemy2()
        physicsBodyEnemy3()
        physicsBodyEnemy4()
        physicsBodyEnemy5()
        physicsBodyEnemy6()
        physicsBodyEnemy7()
        physicsBodyEnemy8()
        physicsBodyEnemy9()
        physicsBodyEnemy10()
        physicsBodyEnemy11()
        
        var animationInterval: Int = 0
        
        run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
        animationInterval += 1
            if animationInterval == 10 {
        self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                if self!.contactAxePlayer == true {
                    self!.spawnAxe()
                }
                if self!.contactAxePlayer2 == true {
                    self!.spawnAxe2()
                }
                if self!.contactAxePlayer3 == true {
                    self!.spawnAxe3()
                }
                if self!.contactAxePlayer4 == true {
                    self!.spawnAxe4()
                }
                if self!.contactAxePlayer5 == true {
                    self!.spawnAxe5()
                }
                if self!.contactAxePlayer6 == true {
                    self!.spawnAxe6()
                }
                if self!.contactAxePlayer7 == true {
                    self!.spawnAxe7()
                }
                if self!.contactAxePlayer8 == true {
                    self!.spawnAxe8()
                }
                if self!.contactAxePlayer9 == true {
                    self!.spawnAxe9()
                }
                if self!.contactAxePlayer10 == true {
                    self!.spawnAxe10()
                }
                if self!.contactAxePlayer11 == true {
                    self!.spawnAxe11()
                }
            }, SKAction.wait(forDuration: 2.8)])))
            }
        }, SKAction.wait(forDuration: 0.1)]), count: 10))
        
        spawnTorch1()
        spawnTorch2()
        spawnTorch3()
        spawnTorch4()
        spawnTorch5()
        spawnTorch6()
        spawnTorch7()
        spawnTorch8()
        spawnTorch9()
        spawnTorch10()
        spawnTorch11()
        spawnTorch12()
        spawnTorch13()
        spawnTorch14()
        spawnTorch15()
        spawnTorch16()
        
        actionGround()
        actionGround2()
        actionGround3()
        actionGround4()
    }
//MARK: - SpawnActionGround
    func actionGround() {
        let actionMove = SKAction.moveTo(x: 2480, duration: 4.0)
        let actionMoveBack = SKAction.moveTo(x: 2960, duration: 4.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 2525, duration: 4.0)
        let actionMoveBack2 = SKAction.moveTo(x: 3005, duration: 4.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(x: 7120, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 7870, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 7165, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 7915, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction2_1!.run(SKAction.sequence([repeatAction]))
        groundAction2_2!.run(SKAction.sequence([repeatAction]))
        groundAction2_3!.run(SKAction.sequence([repeatAction2]))
        groundAction2_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround3() {
        let actionMove = SKAction.moveTo(x: 8785, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 8030, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        let actionMove2 = SKAction.moveTo(x: 8830, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 8075, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)
        
        groundAction3_1!.run(SKAction.sequence([repeatAction]))
        groundAction3_2!.run(SKAction.sequence([repeatAction]))
        groundAction3_3!.run(SKAction.sequence([repeatAction2]))
        groundAction3_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround4() {
        let actionMove = SKAction.moveTo(y: 40, duration: 2.0)
        let actionMoveBack = SKAction.moveTo(y: -120, duration: 2.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {

            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 1970, y: -80)
            arrow.zPosition = 30
            addChild(arrow)

            let action = CGVector(dx: -24, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.8)
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
            portal.position = CGPoint(x: 1990, y: -80)
            portal.zPosition = 29
            portal.zRotation = 4.7
            addChild(portal)

            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnArrowEnemy5() {
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 4970, y: -20)
            arrow.zPosition = 30
            addChild(arrow)

            let action = CGVector(dx: -20, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.8)
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
            portal.position = CGPoint(x: 4970, y: -20)
            portal.zPosition = 29
            portal.zRotation = 4.7
            addChild(portal)

            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
//MARK: - PortalEndBall
    func spawnTrapBall1() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 3760, y: 150)
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

        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal1() {

            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 3760, y: 170)
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
            stone.position = CGPoint(x: 10120, y: 150)
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

        Timer.scheduledTimer(withTimeInterval: 10.8, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
    }
    func spawnPortal2() {

            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 10120, y: 170)
            portal.zPosition = 29
            addChild(portal)

            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnTrapBall3() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 15570, y: 150)
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
    func spawnPortal3() {
            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 15570, y: 170)
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
            UserDefaults.standard.set(true, forKey: "winLevel45")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        }
    }
}
