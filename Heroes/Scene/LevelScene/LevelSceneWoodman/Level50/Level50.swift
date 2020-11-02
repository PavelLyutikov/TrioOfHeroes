//
//  Level36.swift
//  Elon's Adventure
//
//  Created by mac on 08.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

class Level50: GameScene {
    
    var groundFakeAction1: SKNode?
    var groundFakeAction2: SKNode?
    var groundFakeAction3: SKNode?
    
    var groundAction1_1: SKNode?
    var groundAction1_2: SKNode?
    var groundAction1_3: SKNode?
    var groundAction1_4: SKNode?
    
    var groundAction2_1: SKNode?
    var groundAction2_2: SKNode?
    var groundAction2_3: SKNode?
    var groundAction2_4: SKNode?
    
    var groundAction3_1: SKNode?
    
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
        
        groundFakeAction1 = childNode(withName: "groundFakeAction1")
        groundFakeAction2 = childNode(withName: "groundFakeAction2")
        groundFakeAction3 = childNode(withName: "groundFakeAction3")
        
        UserDefaults.standard.set(50, forKey: "levelNumber")

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 3.4)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 5.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 11.1)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 4.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 7.3)])))
        
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
        spawnGoblin11()
        spawnGoblin12()
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
        stateMachineGoblin12()
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
        physicsBodyEnemy12()
        
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
                if self!.contactAxePlayer12 == true {
                    self!.spawnAxe12()
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
        spawnTorch17()
        spawnTorch18()
        spawnTorch19()
        
        actionGround1()
        actionGround2()
        actionGround3()
        
        actionTrap1()
        actionTrap2()
        actionTrap3()
    }
//MARK: - SpawnActionGroundEndActionTrap
    func actionGround1() {
        let actionMove = SKAction.moveTo(x: 4000, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 4755, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        let actionMove2 = SKAction.moveTo(x: 4045, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 4800, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)

        groundAction1_1!.run(SKAction.sequence([repeatAction]))
        groundAction1_2!.run(SKAction.sequence([repeatAction]))
        groundAction1_3!.run(SKAction.sequence([repeatAction2]))
        groundAction1_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround2() {
        let actionMove = SKAction.moveTo(x: 5180, duration: 6.0)
        let actionMoveBack = SKAction.moveTo(x: 6015, duration: 6.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        let actionMove2 = SKAction.moveTo(x: 5225, duration: 6.0)
        let actionMoveBack2 = SKAction.moveTo(x: 6060, duration: 6.0)
        let sequence2 = SKAction.sequence([actionMove2, actionMoveBack2])
        let repeatAction2 = SKAction.repeatForever(sequence2)

        groundAction2_1!.run(SKAction.sequence([repeatAction]))
        groundAction2_2!.run(SKAction.sequence([repeatAction]))
        groundAction2_3!.run(SKAction.sequence([repeatAction2]))
        groundAction2_4!.run(SKAction.sequence([repeatAction2]))
    }
    func actionGround3() {
        let actionMove = SKAction.moveTo(x: 8760, duration: 5.0)
        let actionMoveBack = SKAction.moveTo(x: 9400, duration: 5.0)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)

        groundAction3_1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap1() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.8)
        let actionMoveBack = SKAction.moveTo(y: 0, duration: 2.8)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundFakeAction1!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap2() {
        let actionMove = SKAction.moveTo(y: -120, duration: 2.8)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 2.8)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundFakeAction2!.run(SKAction.sequence([repeatAction]))
    }
    func actionTrap3() {
        let actionMove = SKAction.moveTo(y: -120, duration: 3.1)
        let actionMoveBack = SKAction.moveTo(y: 80, duration: 3.1)
        let sequence = SKAction.sequence([actionMove, actionMoveBack])
        let repeatAction = SKAction.repeatForever(sequence)
        
        groundFakeAction3!.run(SKAction.sequence([repeatAction]))
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy2() {
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 10280, y: -80)
            arrow.zPosition = 30
            arrow.zRotation = 3.12
            addChild(arrow)

            let action = CGVector(dx: 25, dy: 0)
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
            portal.position = CGPoint(x: 10260, y: -80)
            portal.zPosition = 29
            portal.zRotation = 1.5
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
            stone.position = CGPoint(x: 7010, y: 150)
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
            portal.position = CGPoint(x: 7010, y: 170)
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
            UserDefaults.standard.set(true, forKey: "winLevel50")
            
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
