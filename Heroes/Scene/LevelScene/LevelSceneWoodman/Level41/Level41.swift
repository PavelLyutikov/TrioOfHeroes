//
//  Level36.swift
//  Elon's Adventure
//
//  Created by mac on 08.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class Level41: GameScene {
    
    var position1790x: Bool = false
    var position2890x: Bool = false
    var position2610x: Bool = false
    var position3710x: Bool = false
    var position3330x: Bool = false
    var position4430x: Bool = false
    var position3770x: Bool = false
    var position4870x: Bool = false
    var position4810x: Bool = false
    var position5910x: Bool = false
    var position6750x: Bool = false
    var position7850x: Bool = false
    var position7310x: Bool = false
    var position8410x: Bool = false
    var position9120x: Bool = false
    var position10220x: Bool = false
    var position9490x: Bool = false
    var position10590x: Bool = false
    var position13170x: Bool = false
    var position14270x: Bool = false
    var position14190x: Bool = false
    var position15290x: Bool = false
    var position15850x: Bool = false
    var position990x: Bool = false
    var position4250x: Bool = false
    var position6250x: Bool = false
    var position10440x: Bool = false
    var position12440x: Bool = false
    var position11880x: Bool = false
    var position13880x: Bool = false
    var position15860x: Bool = false
    var position9680x: Bool = false
    var position10880x: Bool = false
    var position2680x: Bool = false
    var position3460x: Bool = false
    var position15420x: Bool = false
    var position15980x: Bool = false

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        spawnPuddlePractileEmitter()
        
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
    }
//MARK: - SpawnArrowEnemy
    func spawnArrowEnemy() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 10750, y: -150)
            arrow.zPosition = 30
            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: -25, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.8)
            let groupArrow = SKAction.group([actionArrow, impulse])
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([groupArrow, remove]))
        
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask
        
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.4)
            portal.position = CGPoint(x: 10765, y: -150)
            portal.zPosition = 2
            portal.zRotation = 4.7
            addChild(portal)
            
            var textures: [SKTexture] = []
                    for i in 1...13 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.06)

            let appearZoom = SKAction.scale(to: 1.1, duration: 0.4)
            let disappear = SKAction.scale(to: 0.2, duration: 0.2)
            let group = SKAction.group([actionPortal, appearZoom])
            let removeArrow = SKAction.removeFromParent()

            portal.run(SKAction.sequence([group, removeArrow]))
        
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            portal.run(SKAction.sequence([disappear]))
            }
    }
    func spawnArrowEnemy2() {
        
            let arrow = SKSpriteNode(imageNamed: "magicBall")
            arrow.name = "ArrowEnemy"
            arrow.setScale(0.75)
            arrow.position = CGPoint(x: 2760, y: -40)
            arrow.zPosition = 30
            arrow.zRotation = 3.12

            addChild(arrow)
        
            var texturesArrow: [SKTexture] = []
                    for i in 1...8 {
                        texturesArrow.append(SKTexture(imageNamed: "fireBoolAnimation/\(i)"))
                    }

            let actionArrow = SKAction.animate(with: texturesArrow, timePerFrame: 0.02)
        
            let action = CGVector(dx: 27, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.6)
            let groupArrow = SKAction.group([actionArrow, impulse])
            let remove = SKAction.removeFromParent()
            arrow.run(SKAction.sequence([groupArrow, remove]))
        
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "magicBall"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.killing.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask
        
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.4)
            portal.position = CGPoint(x: 2745, y: -40)
            portal.zPosition = 2
            portal.zRotation = 1.5
            addChild(portal)
            
            var textures: [SKTexture] = []
                    for i in 1...13 {
                        textures.append(SKTexture(imageNamed: "portalAnimation/\(i)"))
                    }

            let actionPortal = SKAction.animate(with: textures, timePerFrame: 0.06)

            let appearZoom = SKAction.scale(to: 1.1, duration: 0.4)
            let disappear = SKAction.scale(to: 0.2, duration: 0.2)
            let group = SKAction.group([actionPortal, appearZoom])
            let removeArrow = SKAction.removeFromParent()

            portal.run(SKAction.sequence([group, removeArrow]))
        
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            portal.run(SKAction.sequence([disappear]))
            }
    }
//MARK: - PortalEndBall
    func spawnTrapBall1() {
            let stone = SKSpriteNode(imageNamed: "trapBall")
            stone.name = "Ball"
            stone.setScale(0.1)
            stone.position = CGPoint(x: 15820, y: 215)
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
    func spawnPortal1() {
        
            let portal = SKSpriteNode(imageNamed: "portalAnimation/1")
            portal.name = "Portal"
            portal.setScale(0.6)
            portal.position = CGPoint(x: 15820, y: 220)
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
//MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        //TrapBall_1
        if (player?.position.x)! >= 15420 {
            if !position15420x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position15980x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 7.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position15980x == false {
                    self!.spawnTrapBall1()
                    self!.spawnPortal1()
                    }
                }, SKAction.wait(forDuration: 4.3)])))
                position15420x = true
            }
        }
        if (player?.position.x)! >= 15980 {
            if !position15980x {
                position15980x = true
            }
        }
        //FireBool_1
        if (player?.position.x)! >= 9680 {
            if !position9680x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10880x == false {
                    self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10880x == false {
                        self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 6.3)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position10880x == false {
                        self!.spawnArrowEnemy()
                    }
                }, SKAction.wait(forDuration: 10.4)])))
                position9680x = true
            }
        }
        if (player?.position.x)! >= 10880 {
            if !position10880x {
                position10880x = true
            }
        }
        //FireBool_2
        if (player?.position.x)! >= 2680 {
            if !position2680x {
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3460x == false {
                    self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 2.8)])))
                run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                    if self!.position3460x == false {
                        self!.spawnArrowEnemy2()
                    }
                }, SKAction.wait(forDuration: 5.5)])))
                position2680x = true
            }
        }
        if (player?.position.x)! >= 3460 {
            if !position3460x {
                position3460x = true
            }
        }
        //Puddle1
        if (player?.position.x)! >= 990 {
            if !position990x {
                puddle?.removeFromParent()
                puddleAnimation.removeFromParent()
            }
            position990x = true
        }
        //Puddle2
        if (player?.position.x)! >= 4250 {
            if !position4250x {
                spawnPuddlePractileEmitter2()
            }
            position4250x = true
        }
        if (player?.position.x)! >= 6250 {
            if !position6250x {
                puddle2?.removeFromParent()
                puddleAnimation2.removeFromParent()
            }
            position6250x = true
        }
        //Puddle3
        if (player?.position.x)! >= 10440 {
            if !position10440x {
                spawnPuddlePractileEmitter3()
            }
            position10440x = true
        }
        if (player?.position.x)! >= 12440 {
            if !position12440x {
                puddle3?.removeFromParent()
                puddleAnimation3.removeFromParent()
            }
            position12440x = true
        }
        //Puddle4
        if (player?.position.x)! >= 11880 {
            if !position11880x {
                spawnPuddlePractileEmitter4()
            }
            position11880x = true
        }
        if (player?.position.x)! >= 13880 {
            if !position13880x {
                puddle4?.removeFromParent()
                puddleAnimation4.removeFromParent()
            }
            position13880x = true
        }
        //Goblin1
        if (player?.position.x)! >= 1790 {
            if !position1790x {
                spawnGoblin1()
                stateMachineGoblin1()
                physicsBodyEnemy1()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer == true {
                            self!.spawnAxe()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position1790x = true
        }
        if (player?.position.x)! >= 2890 {
            if !position2890x {
                enemy1?.removeFromParent()
                contactAxePlayer = false
            }
            position2890x = true
        }
        //Goblin2
        if (player?.position.x)! >= 2610 {
            if !position2610x {
                spawnGoblin2()
                stateMachineGoblin2()
                physicsBodyEnemy2()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer2 == true {
                            self!.spawnAxe2()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position2610x = true
        }
        if (player?.position.x)! >= 3710 {
            if !position3710x {
                enemy2?.removeFromParent()
                contactAxePlayer2 = false
            }
            position3710x = true
        }
        //Goblin3
        if (player?.position.x)! >= 3330 {
            if !position3330x {
                spawnGoblin3()
                stateMachineGoblin3()
                physicsBodyEnemy3()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer3 == true {
                            self!.spawnAxe3()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position3330x = true
        }
        if (player?.position.x)! >= 4430 {
            if !position4430x {
                enemy3?.removeFromParent()
                contactAxePlayer3 = false
            }
            position4430x = true
        }
        //Goblin4
        if (player?.position.x)! >= 3770 {
            if !position3770x {
                spawnGoblin4()
                stateMachineGoblin4()
                physicsBodyEnemy4()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer4 == true {
                            self!.spawnAxe4()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position3770x = true
        }
        if (player?.position.x)! >= 4870 {
            if !position4870x {
                enemy4?.removeFromParent()
                contactAxePlayer4 = false
            }
            position4870x = true
        }
        //Goblin5
        if (player?.position.x)! >= 4810 {
            if !position4810x {
                spawnGoblin5()
                stateMachineGoblin5()
                physicsBodyEnemy5()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer5 == true {
                            self!.spawnAxe5()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position4810x = true
        }
        if (player?.position.x)! >= 5910 {
            if !position5910x {
                enemy5?.removeFromParent()
                contactAxePlayer5 = false
            }
            position5910x = true
        }
        //Goblin6
        if (player?.position.x)! >= 6750 {
            if !position6750x {
                spawnGoblin6()
                stateMachineGoblin6()
                physicsBodyEnemy6()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer6 == true {
                            self!.spawnAxe6()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position6750x = true
        }
        if (player?.position.x)! >= 7850 {
            if !position7850x {
                enemy6?.removeFromParent()
                contactAxePlayer6 = false
            }
            position7850x = true
        }
        //Goblin7
        if (player?.position.x)! >= 7310 {
            if !position7310x {
                spawnGoblin7()
                stateMachineGoblin7()
                physicsBodyEnemy7()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer7 == true {
                            self!.spawnAxe7()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position7310x = true
        }
        if (player?.position.x)! >= 8410 {
            if !position8410x {
                enemy7?.removeFromParent()
                contactAxePlayer7 = false
            }
            position8410x = true
        }
        //Goblin8
        if (player?.position.x)! >= 9120 {
            if !position9120x {
                spawnGoblin8()
                stateMachineGoblin8()
                physicsBodyEnemy8()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer8 == true {
                            self!.spawnAxe8()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position9120x = true
        }
        if (player?.position.x)! >= 10220 {
            if !position10220x {
                enemy8?.removeFromParent()
                contactAxePlayer8 = false
            }
            position10220x = true
        }
        //Goblin9
        if (player?.position.x)! >= 9490 {
            if !position9490x {
                spawnGoblin9()
                stateMachineGoblin9()
                physicsBodyEnemy9()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer9 == true {
                            self!.spawnAxe9()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position9490x = true
        }
        if (player?.position.x)! >= 10590 {
            if !position10590x {
                enemy9?.removeFromParent()
                contactAxePlayer9 = false
            }
            position10590x = true
        }
        //Goblin10
        if (player?.position.x)! >= 13170 {
            if !position13170x {
                spawnGoblin10()
                stateMachineGoblin10()
                physicsBodyEnemy10()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer10 == true {
                            self!.spawnAxe10()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position13170x = true
        }
        if (player?.position.x)! >= 14270 {
            if !position14270x {
                enemy10?.removeFromParent()
                contactAxePlayer10 = false
            }
            position14270x = true
        }
        //Goblin11
        if (player?.position.x)! >= 14190 {
            if !position14190x {
                spawnGoblin11()
                stateMachineGoblin11()
                physicsBodyEnemy11()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer11 == true {
                            self!.spawnAxe11()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position14190x = true
        }
        if (player?.position.x)! >= 15290 {
            if !position15290x {
                enemy11?.removeFromParent()
                contactAxePlayer11 = false
            }
            position15290x = true
        }
        //Goblin12
        if (player?.position.x)! >= 15850 {
            if !position15850x {
                spawnGoblin12()
                stateMachineGoblin12()
                physicsBodyEnemy12()
                
                var animationInterval: Int = 0
                    
                run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
                animationInterval += 1
                    if animationInterval == 10 {
                self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        if self!.contactAxePlayer12 == true {
                            self!.spawnAxe12()
                        }
                    }, SKAction.wait(forDuration: 2.8)])))
                    }
                }, SKAction.wait(forDuration: 0.1)]), count: 10))
            }
            position15850x = true
        }
        
        //Portal
        if (player?.position.x)! >= 15860 {
            if !position15860x {
                spawnPortalRedEmitter()
            }
            position15860x = true
        }
        
        if score >= 1 {
            UserDefaults.standard.set(true, forKey: "winLevel41")
            
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
