//
//  Level11.swift
//  Elon's Adventure
//
//  Created by mac on 22.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

class Level11: GameScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
            run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                self!.spawnPortal()
                self!.spawnTrapBall()
            }, SKAction.wait(forDuration: 4.0)])))
        
        UserDefaults.standard.set(11, forKey: "levelNumber")
        spawnPuddlePractileEmitter()
        spawnPuddlePractileEmitter2()
        
        spawnSkeleton1()
        spawnSkeleton2()
        spawnSkeleton3()
        spawnSkeleton4()
        spawnSkeleton5()
        spawnSkeleton6()
        spawnSkeleton7()
        spawnSkeleton8()
        stateMachineSkeleton1()
        stateMachineSkeleton2()
        stateMachineSkeleton3()
        stateMachineSkeleton4()
        stateMachineSkeleton5()
        stateMachineSkeleton6()
        stateMachineSkeleton7()
        stateMachineSkeleton8()
        physicsBodyEnemy1()
        physicsBodyEnemy2()
        physicsBodyEnemy3()
        physicsBodyEnemy4()
        physicsBodyEnemy5()
        physicsBodyEnemy6()
        physicsBodyEnemy7()
        physicsBodyEnemy8()
    }
    func spawnTrapBall() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.6)
            stone.position = CGPoint(x: 6290, y: 150)
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
            portal.position = CGPoint(x: 6290, y: 170)
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
            UserDefaults.standard.set(true, forKey: "winLevel11")
            
            if backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
//            run(Sound.levelUp.action)
        }
    }
}

