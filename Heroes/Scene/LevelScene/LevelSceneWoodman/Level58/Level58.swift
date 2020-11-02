//
//  Level36.swift
//  Elon's Adventure
//
//  Created by mac on 08.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

class Level58: GameScene {
    
    var trapAction1: SKNode?
    var trapAction2: SKNode?
    var trapAction3: SKNode?
    var trapAction4: SKNode?
    var trapAction5: SKNode?
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        trapAction1 = childNode(withName: "trapAction1")
        trapAction2 = childNode(withName: "trapAction2")
        trapAction3 = childNode(withName: "trapAction3")
        trapAction4 = childNode(withName: "trapAction4")
        trapAction5 = childNode(withName: "trapAction5")

        groundAction1_1 = childNode(withName: "groundAction1_1")
        groundAction1_2 = childNode(withName: "groundAction1_2")
        groundAction1_3 = childNode(withName: "groundAction1_3")
        groundAction1_4 = childNode(withName: "groundAction1_4")
        
        UserDefaults.standard.set(58, forKey: "levelNumber")
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnStone()
        }, SKAction.wait(forDuration: 11.9)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 4.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 5.1)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 10.2)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 5.5)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 3.7)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 4.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 6.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 3.4)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 5.6)])))
        
        spawnPuddlePractileEmitter()
        
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
        
        actionGround1()

        actionTrap1()
        actionTrap2()
        actionTrap3()
        actionTrap4()
        actionTrap5()
    }
//MARK: - SpawnStone
func spawnStone() {
        let stone = SKSpriteNode(imageNamed: "stone")
        stone.name = "Stone"
        stone.setScale(0.6)
        stone.position = CGPoint(x: 8600, y: 320)
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

        Timer.scheduledTimer(withTimeInterval: 12.0, repeats: false) { (timer) in
            let remove = SKAction.removeFromParent()
            stone.run(SKAction.sequence([remove]))
        }
}
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {

        let actionMove = SKAction.moveTo(x: 5440, duration: 12.0)
        let actionMoveBack = SKAction.moveTo(x: 6595, duration: 12.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        let actionMove2 = SKAction.moveTo(x: 5485, duration: 12.0)
        let actionMoveBack2 = SKAction.moveTo(x: 6640, duration: 12.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)

        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -200, duration: 2.5)
        let actionMoveBack = SKAction.moveTo(y: -110, duration: 1.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.7)
        let actionMoveBack = SKAction.moveTo(y: -75, duration: 1.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -160, duration: 3.3)
        let actionMoveBack = SKAction.moveTo(y: -75, duration: 0.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction3!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap4() {
        let actionMove = SKAction.moveTo(y: -90, duration: 1.5)
        let actionMoveBack = SKAction.moveTo(y: -160, duration: 2.5)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction4!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap5() {
        let actionMove = SKAction.moveTo(y: -160, duration: 0.9)
        let actionMoveBack = SKAction.moveTo(y: -90, duration: 2.1)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        trapAction5!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {

            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 3240, y: 20)
            arrow.zPosition = 30
//            arrow.zRotation = 3.12
            addChild(arrow)

            let action = CGVector(dx: -35, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.3)
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
            portal.position = CGPoint(x: 3260, y: 20)
            portal.zPosition = 29
            portal.zRotation = 4.7
            addChild(portal)

            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnArrowEnemy2() {

            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 6780, y: -20)
            arrow.zPosition = 30
//            arrow.zRotation = 3.12
            addChild(arrow)

            let action = CGVector(dx: -40, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 2.6)
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
            portal.position = CGPoint(x: 6800, y: -20)
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
            stone.position = CGPoint(x: 1590, y: 150)
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
    func spawnPortal1() {

            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 1590, y: 170)
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
            stone.position = CGPoint(x: 13690, y: 150)
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
            portal.position = CGPoint(x: 13690, y: 170)
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
            UserDefaults.standard.set(true, forKey: "winLevel58")
            
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
