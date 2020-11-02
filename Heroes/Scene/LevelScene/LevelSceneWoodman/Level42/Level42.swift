//
//  Level36.swift
//  Elon's Adventure
//
//  Created by mac on 08.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

class Level42: GameScene {
    
    var groundMove1: SKNode?
    var groundMove2: SKNode?
    var groundMove3: SKNode?
    var groundMove4: SKNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        groundMove1 = childNode(withName: "groundMove1")
        groundMove2 = childNode(withName: "groundMove2")
        groundMove3 = childNode(withName: "groundMove3")
        groundMove4 = childNode(withName: "groundMove4")
        
        UserDefaults.standard.set(42, forKey: "levelNumber")
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 2.8)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 6.3)])))
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy()
        }, SKAction.wait(forDuration: 10.4)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 2.8)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 5.5)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy2()
        }, SKAction.wait(forDuration: 8.8)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy3()
        }, SKAction.wait(forDuration: 9.7)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy3()
        }, SKAction.wait(forDuration: 6.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy3()
        }, SKAction.wait(forDuration: 2.8)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy4()
        }, SKAction.wait(forDuration: 6.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy4()
        }, SKAction.wait(forDuration: 8.8)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnArrowEnemy4()
        }, SKAction.wait(forDuration: 3.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 4.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall1()
            self!.spawnPortal1()
        }, SKAction.wait(forDuration: 7.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 9.3)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 4.2)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall2()
            self!.spawnPortal2()
        }, SKAction.wait(forDuration: 5.1)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall3()
            self!.spawnPortal3()
        }, SKAction.wait(forDuration: 6.1)])))

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
            self!.spawnTrapBall3()
            self!.spawnPortal3()
        }, SKAction.wait(forDuration: 3.5)])))
        
        spawnPuddlePractileEmitter()
        spawnPuddlePractileEmitter2()
        
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
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {

            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 1530, y: -20)
            arrow.zPosition = 30
            addChild(arrow)

            let action = CGVector(dx: -26, dy: 0)
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
            portal.position = CGPoint(x: 1550, y: -20)
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
            arrow.position = CGPoint(x: 1720, y: -60)
            arrow.zPosition = 30
            arrow.zRotation = 3.12
            addChild(arrow)

            let action = CGVector(dx: 30, dy: 0)
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
            portal.position = CGPoint(x: 1700, y: -60)
            portal.zPosition = 29
            portal.zRotation = 1.5
            addChild(portal)

            let appear = SKAction.scale(to: 1.3, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnArrowEnemy3() {

        let arrow = SKSpriteNode(imageNamed: "magicBall")
        arrow.name = "ArrowEnemy"
        arrow.setScale(0.75)
        arrow.position = CGPoint(x: 2760, y: -40)
        arrow.zPosition = 30
        arrow.zRotation = 3.12
        addChild(arrow)

        let action = CGVector(dx: 20, dy: 0)
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
        portal.position = CGPoint(x: 2760, y: -40)
        portal.zPosition = 29
        portal.zRotation = 1.5
        addChild(portal)

        let appear = SKAction.scale(to: 1.3, duration: 0.2)
        let disappear = SKAction.scale(to: 0, duration: 0.5)

        portal.run(SKAction.sequence([appear, disappear]))
    }
    func spawnArrowEnemy4() {
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 10440, y: -90)
            arrow.zPosition = 30
            arrow.zRotation = 3.12
            addChild(arrow)

            let action = CGVector(dx: 31, dy: 0)
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
            portal.position = CGPoint(x: 10420, y: -90)
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
            stone.position = CGPoint(x: 4470, y: 150)
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
            portal.position = CGPoint(x: 4470, y: 170)
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
            stone.position = CGPoint(x: 6980, y: 150)
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
    func spawnPortal2() {

            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 6980, y: 170)
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
            stone.position = CGPoint(x: 15240, y: 150)
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
            portal.position = CGPoint(x: 15240, y: 170)
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
            UserDefaults.standard.set(true, forKey: "winLevel42")
            
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
