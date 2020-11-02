//
//  GameScene.swift
//  Elon's Adventure
//
//  Created by Mirko Justiniano on 9/22/19.
//  Copyright © 2019 idevcode. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var sound = UserDefaults.standard.bool(forKey: "sound")
    var backgroundMusic = UserDefaults.standard.bool(forKey: "backgroundMusic")
    var menuMusicOn = UserDefaults.standard.bool(forKey: "menuMusicOn")
    var vibration = UserDefaults.standard.bool(forKey: "vibration")
    var walkingSoundAction: Bool = false
    
    var coinGame: Int = 0
    var coinScore: Int = 0
    
    let totalSize = UIScreen.main.bounds.size
    let levelNumber = UserDefaults.standard.integer(forKey: "levelNumber")
    
    //MARK: - UserDefaultsLevelTraversed
        
        let winLevel1 = UserDefaults.standard.bool(forKey: "winLevel1")
        let winLevel2 = UserDefaults.standard.bool(forKey: "winLevel2")
        let winLevel3 = UserDefaults.standard.bool(forKey: "winLevel3")
        let winLevel4 = UserDefaults.standard.bool(forKey: "winLevel4")
        let winLevel5 = UserDefaults.standard.bool(forKey: "winLevel5")
        let winLevel6 = UserDefaults.standard.bool(forKey: "winLevel6")
        let winLevel7 = UserDefaults.standard.bool(forKey: "winLevel7")
        let winLevel8 = UserDefaults.standard.bool(forKey: "winLevel8")
        let winLevel9 = UserDefaults.standard.bool(forKey: "winLevel9")
        let winLevel10 = UserDefaults.standard.bool(forKey: "winLevel10")
        let winLevel11 = UserDefaults.standard.bool(forKey: "winLevel11")
        let winLevel12 = UserDefaults.standard.bool(forKey: "winLevel12")
        let winLevel13 = UserDefaults.standard.bool(forKey: "winLevel13")
        let winLevel14 = UserDefaults.standard.bool(forKey: "winLevel14")
        let winLevel15 = UserDefaults.standard.bool(forKey: "winLevel15")
        let winLevel16 = UserDefaults.standard.bool(forKey: "winLevel16")
        let winLevel17 = UserDefaults.standard.bool(forKey: "winLevel17")
        let winLevel18 = UserDefaults.standard.bool(forKey: "winLevel18")
        let winLevel19 = UserDefaults.standard.bool(forKey: "winLevel19")
        let winLevel20 = UserDefaults.standard.bool(forKey: "winLevel20")
        let winLevel21 = UserDefaults.standard.bool(forKey: "winLevel21")
        let winLevel22 = UserDefaults.standard.bool(forKey: "winLevel22")
        let winLevel23 = UserDefaults.standard.bool(forKey: "winLevel23")
        let winLevel24 = UserDefaults.standard.bool(forKey: "winLevel24")
        let winLevel25 = UserDefaults.standard.bool(forKey: "winLevel25")
        let winLevel26 = UserDefaults.standard.bool(forKey: "winLevel26")
        let winLevel27 = UserDefaults.standard.bool(forKey: "winLevel27")
        let winLevel28 = UserDefaults.standard.bool(forKey: "winLevel28")
        let winLevel29 = UserDefaults.standard.bool(forKey: "winLevel29")
        let winLevel30 = UserDefaults.standard.bool(forKey: "winLevel30")
        let winLevel31 = UserDefaults.standard.bool(forKey: "winLevel31")
        let winLevel32 = UserDefaults.standard.bool(forKey: "winLevel32")
        let winLevel33 = UserDefaults.standard.bool(forKey: "winLevel33")
        let winLevel34 = UserDefaults.standard.bool(forKey: "winLevel34")
        let winLevel35 = UserDefaults.standard.bool(forKey: "winLevel35")
        let winLevel36 = UserDefaults.standard.bool(forKey: "winLevel36")
        let winLevel37 = UserDefaults.standard.bool(forKey: "winLevel37")
        let winLevel38 = UserDefaults.standard.bool(forKey: "winLevel38")
        let winLevel39 = UserDefaults.standard.bool(forKey: "winLevel39")
        let winLevel40 = UserDefaults.standard.bool(forKey: "winLevel40")
        let winLevel41 = UserDefaults.standard.bool(forKey: "winLevel41")
        let winLevel42 = UserDefaults.standard.bool(forKey: "winLevel42")
        let winLevel43 = UserDefaults.standard.bool(forKey: "winLevel43")
        let winLevel44 = UserDefaults.standard.bool(forKey: "winLevel44")
        let winLevel45 = UserDefaults.standard.bool(forKey: "winLevel45")
        let winLevel46 = UserDefaults.standard.bool(forKey: "winLevel46")
        let winLevel47 = UserDefaults.standard.bool(forKey: "winLevel47")
        let winLevel48 = UserDefaults.standard.bool(forKey: "winLevel48")
        let winLevel49 = UserDefaults.standard.bool(forKey: "winLevel49")
        let winLevel50 = UserDefaults.standard.bool(forKey: "winLevel50")
        let winLevel51 = UserDefaults.standard.bool(forKey: "winLevel51")
        let winLevel52 = UserDefaults.standard.bool(forKey: "winLevel52")
        let winLevel53 = UserDefaults.standard.bool(forKey: "winLevel53")
        let winLevel54 = UserDefaults.standard.bool(forKey: "winLevel54")
        let winLevel55 = UserDefaults.standard.bool(forKey: "winLevel55")
        let winLevel56 = UserDefaults.standard.bool(forKey: "winLevel56")
        let winLevel57 = UserDefaults.standard.bool(forKey: "winLevel57")
        let winLevel58 = UserDefaults.standard.bool(forKey: "winLevel58")
        let winLevel59 = UserDefaults.standard.bool(forKey: "winLevel59")
        let winLevel60 = UserDefaults.standard.bool(forKey: "winLevel60")
    //ContactAxePlayer
    var contactAxePlayer: Bool = true
    var contactAxePlayer2: Bool = true
    var contactAxePlayer3: Bool = true
    var contactAxePlayer4: Bool = true
    var contactAxePlayer5: Bool = true
    var contactAxePlayer6: Bool = true
    var contactAxePlayer7: Bool = true
    var contactAxePlayer8: Bool = true
    var contactAxePlayer9: Bool = true
    var contactAxePlayer10: Bool = true
    var contactAxePlayer11: Bool = true
    var contactAxePlayer12: Bool = true
    var contactAxePlayer13: Bool = true
    var contactAxePlayer14: Bool = true
    var contactAxePlayer15: Bool = true
    
    var contactPosition60Player: Bool = false
    var contactPosition30Player: Bool = false
    
    // Nodes
    var player: SKNode?,
        joystick: SKNode?,
        joystickKnob: SKNode?,
        cameraNode: SKCameraNode?,
        shotZone: SKNode?,
        trap: SKNode?,
        box: SKNode?,
        jewel: SKNode?,
        puddle: SKNode?,
        puddle2: SKNode?,
        puddle3: SKNode?,
        puddle4: SKNode?,
        puddle5: SKNode?,
        puddle6: SKNode?,
        enemy1: SKNode?,
        enemy2: SKNode?,
        enemy3: SKNode?,
        enemy4: SKNode?,
        enemy5: SKNode?,
        enemy6: SKNode?,
        enemy7: SKNode?,
        enemy8: SKNode?,
        enemy9: SKNode?,
        enemy10: SKNode?,
        enemy11: SKNode?,
        enemy12: SKNode?,
        enemy13: SKNode?,
        enemy14: SKNode?,
        enemy15: SKNode?,
        torch1: SKNode?,
        torch2: SKNode?,
        torch3: SKNode?,
        torch4: SKNode?,
        torch5: SKNode?,
        torch6: SKNode?,
        torch7: SKNode?,
        torch8: SKNode?,
        torch9: SKNode?,
        torch10: SKNode?,
        torch11: SKNode?,
        torch12: SKNode?,
        torch13: SKNode?,
        torch14: SKNode?,
        torch15: SKNode?,
        torch16: SKNode?,
        torch17: SKNode?,
        torch18: SKNode?,
        torch19: SKNode?,
        torch20: SKNode?

    let bigGoblin = SKSpriteNode(imageNamed: "goblin/6")
    let coin1 = SKSpriteNode(imageNamed: "coin/0")
    let coin2 = SKSpriteNode(imageNamed: "coin/0")
    let coin3 = SKSpriteNode(imageNamed: "coin/0")
    let coin4 = SKSpriteNode(imageNamed: "coin/0")
    let coin5 = SKSpriteNode(imageNamed: "coin/0")
    let coin6 = SKSpriteNode(imageNamed: "coin/0")
    let coin7 = SKSpriteNode(imageNamed: "coin/0")
    let coin8 = SKSpriteNode(imageNamed: "coin/0")
    let coin9 = SKSpriteNode(imageNamed: "coin/0")
    let coin10 = SKSpriteNode(imageNamed: "coin/0")
    let coin11 = SKSpriteNode(imageNamed: "coin/0")
    let coin12 = SKSpriteNode(imageNamed: "coin/0")
    let coin13 = SKSpriteNode(imageNamed: "coin/0")
    let coin14 = SKSpriteNode(imageNamed: "coin/0")
    let coin15 = SKSpriteNode(imageNamed: "coin/0")
    
    var shotButton: SKButton!
    var jumpButton: SKButton!
    var joystickAction = false,
        knobRadius: CGFloat = 50.0
    
    let scoreLabel = SKLabelNode()
    var score = 0
    var rewardIsNotTouched = true
    var shotReady: Bool = true
    var jumpReady: Bool = true
    var heartsArray = [SKSpriteNode]()
    let heartContainer = SKSpriteNode()
    var isHit = false
    var jumpAnimation = false
    
    // Sprite Engine
    var previousTimeInterval: TimeInterval = 0,
        playerIsFacingRight = true
    let playerSpeed = 4.0
    
    // State Player end Enemy
    var playerStateMachine: GKStateMachine!
    var enemyStateMachine: GKStateMachine!
    var enemyStateMachine2: GKStateMachine!
    var enemyStateMachine3: GKStateMachine!
    var enemyStateMachine4: GKStateMachine!
    var enemyStateMachine5: GKStateMachine!
    var enemyStateMachine6: GKStateMachine!
    var enemyStateMachine7: GKStateMachine!
    var enemyStateMachine8: GKStateMachine!
    var enemyStateMachine9: GKStateMachine!
    var enemyStateMachine10: GKStateMachine!
    var enemyStateMachine11: GKStateMachine!
    var enemyStateMachine12: GKStateMachine!
    var enemyStateMachine13: GKStateMachine!
    var enemyStateMachine14: GKStateMachine!
    var enemyStateMachine15: GKStateMachine!
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var pausePanel: SKButton!
        
// MARK: - DidMove
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        if levelNumber >= 1 && levelNumber <= 120 {
            if backgroundMusic == true {
                playBackgroundGameArcherMusic(fileName: "backMusicGameArcher.mp3")
                backgroungMenuMusicPlayer.stop()
            }
        }
        
        if levelNumber >= 1 && levelNumber <= 120 {
            downloadUI()
        }
    }
//MARK: - DownloadUI
    func downloadUI() {
        spawnChildNode()
        shotButtonAction()
        jumpButtonAction()
        spawnPauseButton()
        spawnShotZone()
        spawnLife()
        spawnScore()
        stateMachinePlayer()
        if levelNumber >= 1 && levelNumber <= 30 {
            spawnPortalEmitter()
        } else if levelNumber >= 31 && levelNumber <= 60 {
            spawnPortalRedEmitter()
        }
    }
//MARK: - Pause
    func spawnPausePanel() {
        
        lastUpdateTime = 0.0
        dt = 0.0
        isPaused = true
        
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.joystickKnob?.position = CGPoint(x: 0, y: 0)
        }
        joystick?.alpha = 0
        
        
        jumpButton.removeFromParent()
        shotButton.removeFromParent()
        
        pausePanel = SKButton(imageName: "settingsBack", buttonAction: {
            self.pausePanel.removeFromParent()
            self.isPaused = false
            self.jumpButtonAction()
            self.shotButtonAction()
            self.joystick?.alpha = 1
            
            UserDefaults.standard.set(false, forKey: "BackGround")
            
        })
        pausePanel.position = CGPoint(x: cameraNode!.position.x, y: cameraNode!.position.y - 60)
        pausePanel.setScale(1.0)
        pausePanel.zPosition = 3003
        addChild(pausePanel)
        
        //Label
        let label = SKLabelNode(fontNamed: "Antikvar Shadow")
        label.text = "Pause"
        label.position = CGPoint(x: 0, y: -10)
        label.fontColor = .black
        label.fontSize = 40
        pausePanel.addChild(label)
    }
    
//MARK: - SpawnPauseButton
    func spawnPauseButton() {
        var positionY: CGFloat!
        var positionX: CGFloat!
        var scale: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 115
            positionX = 290
            scale = 0.50
        } else if totalSize.width >= 800 {
            positionY = 130
            positionX = 290
            scale = 0.35
        } else {
            positionY = 160
            positionX = 310
            scale = 0.45
        }
        let pauseButton = SKButton(imageName: "pauseButton", buttonAction: {
            self.spawnPausePanel()
        })
        pauseButton.setScale(scale)
        pauseButton.position = CGPoint(x: CGFloat(positionX), y: CGFloat(positionY))
        pauseButton.zPosition = 3000
        cameraNode?.addChild(pauseButton)
    }
//MARK: - ChildNode
    func spawnChildNode() {
        player = childNode(withName: "player")
        
        joystick = childNode(withName: "joystick")
        joystickKnob = joystick?.childNode(withName: "knob")
        
        cameraNode = childNode(withName: "cameraNode") as? SKCameraNode
        
        shotZone = childNode(withName: "ShotZone")
        trap = childNode(withName: "trap")
        box = childNode(withName: "box")
        jewel = childNode(withName: "jewel")
        puddle = childNode(withName: "Puddle")
        puddle2 = childNode(withName: "Puddle2")
        puddle3 = childNode(withName: "Puddle3")
        puddle4 = childNode(withName: "Puddle4")
        puddle5 = childNode(withName: "Puddle5")
        puddle6 = childNode(withName: "Puddle6")
        
        if levelNumber >= 36 && levelNumber <= 60 {
            torch1 = childNode(withName: "torch1")
            torch2 = childNode(withName: "torch2")
            torch3 = childNode(withName: "torch3")
            torch4 = childNode(withName: "torch4")
            torch5 = childNode(withName: "torch5")
            torch6 = childNode(withName: "torch6")
            torch7 = childNode(withName: "torch7")
            torch8 = childNode(withName: "torch8")
            torch9 = childNode(withName: "torch9")
            torch10 = childNode(withName: "torch10")
            torch11 = childNode(withName: "torch11")
            torch12 = childNode(withName: "torch12")
            torch13 = childNode(withName: "torch13")
            torch14 = childNode(withName: "torch14")
            torch15 = childNode(withName: "torch15")
            torch16 = childNode(withName: "torch16")
            torch17 = childNode(withName: "torch17")
            torch18 = childNode(withName: "torch18")
            torch19 = childNode(withName: "torch19")
            torch20 = childNode(withName: "torch20")
        }
    }
//MARK: - SpawnGoblin
    func spawnGoblin1() {
        enemy1 = childNode(withName: "goblin1")
    }
    func spawnGoblin2() {
        enemy2 = childNode(withName: "goblin2")
    }
    func spawnGoblin3() {
        enemy3 = childNode(withName: "goblin3")
    }
    func spawnGoblin4() {
        enemy4 = childNode(withName: "goblin4")
    }
    func spawnGoblin5() {
        enemy5 = childNode(withName: "goblin5")
    }
    func spawnGoblin6() {
        enemy6 = childNode(withName: "goblin6")
    }
    func spawnGoblin7() {
        enemy7 = childNode(withName: "goblin7")
    }
    func spawnGoblin8() {
        enemy8 = childNode(withName: "goblin8")
    }
    func spawnGoblin9() {
        enemy9 = childNode(withName: "goblin9")
    }
    func spawnGoblin10() {
        enemy10 = childNode(withName: "goblin10")
    }
    func spawnGoblin11() {
        enemy11 = childNode(withName: "goblin11")
    }
    func spawnGoblin12() {
        enemy12 = childNode(withName: "goblin12")
    }
    func spawnGoblin13() {
        enemy13 = childNode(withName: "goblin13")
    }
    func spawnGoblin14() {
        enemy14 = childNode(withName: "goblin14")
    }
    func spawnGoblin15() {
        enemy15 = childNode(withName: "goblin15")
    }
//MARK: - SpawnSkeleton
    func spawnSkeleton1() {
        enemy1 = childNode(withName: "skeleton")
    }
    func spawnSkeleton2() {
        enemy2 = childNode(withName: "skeleton2")
    }
    func spawnSkeleton3() {
        enemy3 = childNode(withName: "skeleton3")
    }
    func spawnSkeleton4() {
        enemy4 = childNode(withName: "skeleton4")
    }
    func spawnSkeleton5() {
        enemy5 = childNode(withName: "skeleton5")
    }
    func spawnSkeleton6() {
        enemy6 = childNode(withName: "skeleton6")
    }
    func spawnSkeleton7() {
        enemy7 = childNode(withName: "skeleton7")
    }
    func spawnSkeleton8() {
        enemy8 = childNode(withName: "skeleton8")
    }
    func spawnSkeleton9() {
        enemy9 = childNode(withName: "skeleton9")
    }
    func spawnSkeleton10() {
        enemy10 = childNode(withName: "skeleton10")
    }
    func spawnSkeleton11() {
        enemy11 = childNode(withName: "skeleton11")
    }
    func spawnSkeleton12() {
        enemy12 = childNode(withName: "skeleton12")
    }
    func spawnSkeleton13() {
        enemy13 = childNode(withName: "skeleton13")
    }
    func spawnSkeleton14() {
        enemy14 = childNode(withName: "skeleton14")
    }
//MARK: - Life
    func spawnLife() {
           heartContainer.position = CGPoint(x: -300, y: 140)
           heartContainer.zPosition = 5
           cameraNode?.addChild(heartContainer)
           fillHearts(count: 3)
    }
//MARK: SCORE
    func spawnScore() {
        scoreLabel.position = CGPoint(x: 310, y: 400)
        scoreLabel.fontColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        scoreLabel.fontSize = 24
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.text = String(score)
        cameraNode?.addChild(scoreLabel)
    }
//MARK: - SpawnCoin
    //1
    func spawnCoin1() {
            coin1.name = "Coin1"
            coin1.position = CGPoint(x: enemy1!.position.x, y: enemy1!.position.y + 20)
            coin1.setScale(0.3)
            addChild(coin1)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin1.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody1.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation1() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin1.position.x, y: coin1.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //2
    func spawnCoin2() {
            coin2.name = "Coin2"
            coin2.position = CGPoint(x: enemy2!.position.x, y: enemy2!.position.y + 20)
            coin2.setScale(0.3)
            addChild(coin2)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin2.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody2.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation2() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin2.position.x, y: coin2.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //3
    func spawnCoin3() {
            coin3.name = "Coin3"
            coin3.position = CGPoint(x: enemy3!.position.x, y: enemy3!.position.y + 20)
            coin3.setScale(0.3)
            addChild(coin3)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin3.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody3.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation3() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin3.position.x, y: coin3.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //4
    func spawnCoin4() {
            coin4.name = "Coin4"
            coin4.position = CGPoint(x: enemy4!.position.x, y: enemy4!.position.y + 20)
            coin4.setScale(0.3)
            addChild(coin4)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin4.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody4.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation4() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin4.position.x, y: coin4.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //5
    func spawnCoin5() {
            coin5.name = "Coin5"
            coin5.position = CGPoint(x: enemy5!.position.x, y: enemy5!.position.y + 20)
            coin5.setScale(0.3)
            addChild(coin5)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin5.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody5.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation5() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin5.position.x, y: coin5.position.y + 10)
        coinAnim.setScale(0.3)
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //6
    func spawnCoin6() {
            coin6.name = "Coin6"
            coin6.position = CGPoint(x: enemy6!.position.x, y: enemy6!.position.y + 20)
            coin6.setScale(0.3)
            addChild(coin6)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin6.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody6.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation6() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin6.position.x, y: coin6.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //7
    func spawnCoin7() {
            coin7.name = "Coin7"
            coin7.position = CGPoint(x: enemy7!.position.x, y: enemy7!.position.y + 20)
            coin7.setScale(0.3)
            addChild(coin7)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin7.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody7.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation7() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin7.position.x, y: coin7.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //8
    func spawnCoin8() {
            coin8.name = "Coin8"
            coin8.position = CGPoint(x: enemy8!.position.x, y: enemy8!.position.y + 20)
            coin8.setScale(0.3)
            addChild(coin8)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin8.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody8.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation8() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin8.position.x, y: coin8.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //9
    func spawnCoin9() {
            coin9.name = "Coin9"
            coin9.position = CGPoint(x: enemy9!.position.x, y: enemy9!.position.y + 20)
            coin9.setScale(0.3)
            addChild(coin9)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin9.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody9.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation9() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin9.position.x, y: coin9.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //10
    func spawnCoin10() {
            coin10.name = "Coin10"
            coin10.position = CGPoint(x: enemy10!.position.x, y: enemy10!.position.y + 20)
            coin10.setScale(0.3)
            addChild(coin10)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin10.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody10.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation10() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin10.position.x, y: coin10.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //11
    func spawnCoin11() {
            coin11.name = "Coin11"
            coin11.position = CGPoint(x: enemy11!.position.x, y: enemy11!.position.y + 20)
            coin11.setScale(0.3)
            addChild(coin11)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin11.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody11.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation11() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin11.position.x, y: coin11.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //12
    func spawnCoin12() {
            coin12.name = "Coin12"
            coin12.position = CGPoint(x: enemy12!.position.x, y: enemy12!.position.y + 20)
            coin12.setScale(0.3)
            addChild(coin12)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin12.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody12.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation12() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin12.position.x, y: coin12.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //13
    func spawnCoin13() {
            coin13.name = "Coin13"
            coin13.position = CGPoint(x: enemy13!.position.x, y: enemy13!.position.y + 20)
            coin13.setScale(0.3)
            addChild(coin13)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin13.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody13.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation13() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin13.position.x, y: coin13.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //14
    func spawnCoin14() {
            coin14.name = "Coin14"
            coin14.position = CGPoint(x: enemy14!.position.x, y: enemy14!.position.y + 20)
            coin14.setScale(0.3)
            addChild(coin14)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin14.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody14.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation14() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin14.position.x, y: coin14.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
    //15
    func spawnCoin15() {
            coin15.name = "Coin15"
            coin15.position = CGPoint(x: enemy15!.position.x, y: enemy15!.position.y + 20)
            coin15.setScale(0.3)
            addChild(coin15)
        
            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            coin15.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.coinBody15.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
    }
    func coinAnimation15() {
        let coinAnim = SKSpriteNode(imageNamed: "coin/1")
        coinAnim.position = CGPoint(x: coin15.position.x, y: coin15.position.y + 10)
        coinAnim.setScale(0.3)
        coinAnim.zPosition = 3
        addChild(coinAnim)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        let remove = SKAction.removeFromParent()
        
        coinAnim.run(SKAction.sequence([action, remove]))
    }
//MARK: - KillPlayerAnimation
    func spawnAnimationKillArcher() {
            let cloud = SKEmitterNode(fileNamed: "KillArcher.sks")!
            cloud.zPosition = 1
            cloud.position = CGPoint(x: player!.position.x, y: player!.position.y)
            addChild(cloud)
    }
    func spawnAnimationKillWoodman() {
            let cloud = SKEmitterNode(fileNamed: "KillWoodman.sks")!
            cloud.zPosition = 1
            cloud.position = CGPoint(x: player!.position.x, y: player!.position.y)
            addChild(cloud)
    }
//MARK: - StateMachinePlayer
    func stateMachinePlayer() {
        if levelNumber >= 1 && levelNumber <= 30 {
            playerStateMachine = GKStateMachine(states: [
                ShotState(playerNode: player!),
                WalkingState(playerNode: player!),
                IdleState(playerNode: player!),
                LandingState(playerNode: player!),
                StunnedState(playerNode: player!)
            ])
            playerStateMachine.enter(IdleState.self)
        } else if levelNumber >= 31 && levelNumber <= 60 {
            playerStateMachine = GKStateMachine(states: [
                JumpingWoodmanState(playerNode: player!),
                AttackWoodmanState(playerNode: player!),
                WalkingWoodmanState(playerNode: player!),
                IdleWoodmanState(playerNode: player!),
                LandingState(playerNode: player!),
                StunnedState(playerNode: player!)
            ])
            playerStateMachine.enter(IdleWoodmanState.self)
        }
    }
//MARK: - StateMachineSkeleton
    func stateMachineSkeleton1() {
        enemyStateMachine = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy1!),
            LandingEnemyState(enemyNode: enemy1!),
            KillState(enemyNode: enemy1!)
        ])
        enemyStateMachine.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton2() {
        enemyStateMachine2 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy2!),
            LandingEnemyState(enemyNode: enemy2!),
            KillState(enemyNode: enemy2!)
        ])
        enemyStateMachine2.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton3() {
        enemyStateMachine3 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy3!),
            LandingEnemyState(enemyNode: enemy3!),
            KillState(enemyNode: enemy3!)
        ])
        enemyStateMachine3.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton4() {
        enemyStateMachine4 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy4!),
            LandingEnemyState(enemyNode: enemy4!),
            KillState(enemyNode: enemy4!)
        ])
        enemyStateMachine4.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton5() {
        enemyStateMachine5 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy5!),
            LandingEnemyState(enemyNode: enemy5!),
            KillState(enemyNode: enemy5!)
        ])
        enemyStateMachine5.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton6() {
        enemyStateMachine6 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy6!),
            LandingEnemyState(enemyNode: enemy6!),
            KillState(enemyNode: enemy6!)
        ])
        enemyStateMachine6.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton7() {
        enemyStateMachine7 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy7!),
            LandingEnemyState(enemyNode: enemy7!),
            KillState(enemyNode: enemy7!)
        ])
        enemyStateMachine7.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton8() {
        enemyStateMachine8 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy8!),
            LandingEnemyState(enemyNode: enemy8!),
            KillState(enemyNode: enemy8!)
        ])
        enemyStateMachine8.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton9() {
        enemyStateMachine9 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy9!),
            LandingEnemyState(enemyNode: enemy9!),
            KillState(enemyNode: enemy9!)
        ])
        enemyStateMachine9.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton10() {
        enemyStateMachine10 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy10!),
            LandingEnemyState(enemyNode: enemy10!),
            KillState(enemyNode: enemy10!)
        ])
        enemyStateMachine10.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton11() {
        enemyStateMachine11 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy11!),
            LandingEnemyState(enemyNode: enemy11!),
            KillState(enemyNode: enemy11!)
        ])
        enemyStateMachine11.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton12() {
        enemyStateMachine12 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy12!),
            LandingEnemyState(enemyNode: enemy12!),
            KillState(enemyNode: enemy12!)
        ])
        enemyStateMachine12.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton13() {
        enemyStateMachine13 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy13!),
            LandingEnemyState(enemyNode: enemy13!),
            KillState(enemyNode: enemy13!)
        ])
        enemyStateMachine13.enter(WalkingEnemyState.self)
    }
    func stateMachineSkeleton14() {
        enemyStateMachine14 = GKStateMachine(states: [
            WalkingEnemyState(enemyNode: enemy14!),
            LandingEnemyState(enemyNode: enemy14!),
            KillState(enemyNode: enemy14!)
        ])
        enemyStateMachine14.enter(WalkingEnemyState.self)
    }
//MARK: - StateMachineGoblin
    func stateMachineGoblin1() {
        enemyStateMachine = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy1!),
            KillGoblinState(enemyNode: enemy1!)
        ])
        enemyStateMachine.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin2() {
        enemyStateMachine2 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy2!),
            KillGoblinState(enemyNode: enemy2!)
        ])
        enemyStateMachine2.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin3() {
        enemyStateMachine3 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy3!),
            KillGoblinState(enemyNode: enemy3!)
        ])
        enemyStateMachine3.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin4() {
        enemyStateMachine4 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy4!),
            KillGoblinState(enemyNode: enemy4!)
        ])
        enemyStateMachine4.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin5() {
        enemyStateMachine5 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy5!),
            KillGoblinState(enemyNode: enemy5!)
        ])
        enemyStateMachine5.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin6() {
        enemyStateMachine6 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy6!),
            KillGoblinState(enemyNode: enemy6!)
        ])
        enemyStateMachine6.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin7() {
        enemyStateMachine7 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy7!),
            KillGoblinState(enemyNode: enemy7!)
        ])
        enemyStateMachine7.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin8() {
        enemyStateMachine8 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy8!),
            KillGoblinState(enemyNode: enemy8!)
        ])
        enemyStateMachine8.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin9() {
        enemyStateMachine9 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy9!),
            KillGoblinState(enemyNode: enemy9!)
        ])
        enemyStateMachine9.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin10() {
        enemyStateMachine10 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy10!),
            KillGoblinState(enemyNode: enemy10!)
        ])
        enemyStateMachine10.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin11() {
        enemyStateMachine11 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy11!),
            KillGoblinState(enemyNode: enemy11!)
        ])
        enemyStateMachine11.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin12() {
        enemyStateMachine12 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy12!),
            KillGoblinState(enemyNode: enemy12!)
        ])
        enemyStateMachine12.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin13() {
        enemyStateMachine13 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy13!),
            KillGoblinState(enemyNode: enemy13!)
        ])
        enemyStateMachine13.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin14() {
        enemyStateMachine14 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy14!),
            KillGoblinState(enemyNode: enemy14!)
        ])
        enemyStateMachine14.enter(AttackGoblinState.self)
    }
    func stateMachineGoblin15() {
        enemyStateMachine15 = GKStateMachine(states: [
            AttackGoblinState(enemyNode: enemy15!),
            KillGoblinState(enemyNode: enemy15!)
        ])
        enemyStateMachine15.enter(AttackGoblinState.self)
    }
//MARK: - ShotZone
        func spawnShotZone() {
    //ShotZoneRight
            let shotBox = SKSpriteNode(imageNamed: "box")
            shotBox.xScale = 0.1
            shotBox.yScale = 0.8
            shotBox.position = CGPoint(x: CGFloat(400), y: CGFloat(0))
            shotBox.zPosition = 70
            shotBox.alpha = 0.3
            cameraNode?.addChild(shotBox)
            
            let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 300))
            shotBox.physicsBody = physicsBody
            
            physicsBody.categoryBitMask = Collision.Masks.shotZone.bitmask
            physicsBody.collisionBitMask = Collision.Masks.arrowBody.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.arrowBody.bitmask
            physicsBody.fieldBitMask = Collision.Masks.arrowBody.bitmask
            
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
            physicsBody.isDynamic = false
                    
    //ShotZoneLeft
            let shotBoxLeft = SKSpriteNode(imageNamed: "box")
            shotBoxLeft.xScale = 0.1
            shotBoxLeft.yScale = 0.8
            shotBoxLeft.position = CGPoint(x: CGFloat(-400), y: CGFloat(0))
            shotBoxLeft.zPosition = 70
            shotBoxLeft.alpha = 0.3
            cameraNode?.addChild(shotBoxLeft)
            
            let physicsBodyLeft = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 300))
            shotBoxLeft.physicsBody = physicsBodyLeft
            
            physicsBodyLeft.categoryBitMask = Collision.Masks.shotZone.bitmask
            physicsBodyLeft.collisionBitMask = Collision.Masks.arrowBody.bitmask
            physicsBodyLeft.contactTestBitMask = Collision.Masks.arrowBody.bitmask
            physicsBodyLeft.fieldBitMask = Collision.Masks.arrowBody.bitmask
            
            physicsBodyLeft.affectedByGravity = false
            physicsBodyLeft.allowsRotation = false
            physicsBodyLeft.isDynamic = false
        }
//MARK: - PhysicsBodySkeleton
    func physicsBodyEnemy1() {
        enemy1?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody1.bitmask
        enemy1?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy1?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy1?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy2() {
        enemy2?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody2.bitmask
        enemy2?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy2?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy2?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy3() {
        enemy3?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody3.bitmask
        enemy3?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy3?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy3?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy4() {
        enemy4?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody4.bitmask
        enemy4?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy4?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy4?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy5() {
        enemy5?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody5.bitmask
        enemy5?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy5?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy5?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy6() {
        enemy6?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody6.bitmask
        enemy6?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy6?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy6?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy7() {
        enemy7?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody7.bitmask
        enemy7?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy7?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy7?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy8() {
        enemy8?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody8.bitmask
        enemy8?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy8?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy8?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy9() {
        enemy9?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody9.bitmask
        enemy9?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy9?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy9?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy10() {
        enemy10?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody10.bitmask
        enemy10?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy10?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy10?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy11() {
        enemy11?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody11.bitmask
        enemy11?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy11?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy11?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy12() {
        enemy12?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody12.bitmask
        enemy12?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy12?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy12?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy13() {
        enemy13?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody13.bitmask
        enemy13?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy13?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy13?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy14() {
        enemy14?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody14.bitmask
        enemy14?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy14?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy14?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
    func physicsBodyEnemy15() {
        enemy15?.physicsBody?.categoryBitMask = Collision.Masks.enemyBody15.bitmask
        enemy15?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy15?.physicsBody?.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
        enemy15?.physicsBody?.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
    }
//MARK: PuddlePractileEmitter
    func spawnPortalEmitter() {
        let pud1 = SKEmitterNode(fileNamed: "Portal.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: jewel!.position.x, y: jewel!.position.y)
        addChild(pud1)
    }
    func spawnPortalRedEmitter() {
        let pud1 = SKEmitterNode(fileNamed: "PortalRed.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: jewel!.position.x, y: jewel!.position.y)
        addChild(pud1)
    }
    func spawnPuddlePractileEmitter() {
        let pud1 = SKEmitterNode(fileNamed: "Puddle.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: puddle!.position.x, y: puddle!.position.y + 10)
        addChild(pud1)
    }
    func spawnPuddlePractileEmitter2() {
        let pud2 = SKEmitterNode(fileNamed: "Puddle.sks")!
        pud2.zPosition = 1
        pud2.position = CGPoint(x: puddle2!.position.x, y: puddle2!.position.y + 10)
        addChild(pud2)
    }
    func spawnPuddlePractileEmitter3() {
        let pud3 = SKEmitterNode(fileNamed: "Puddle.sks")!
        pud3.zPosition = 1
        pud3.position = CGPoint(x: puddle3!.position.x, y: puddle3!.position.y + 10)
        addChild(pud3)
    }
    func spawnPuddlePractileEmitter4() {
        let pud4 = SKEmitterNode(fileNamed: "Puddle.sks")!
        pud4.zPosition = 1
        pud4.position = CGPoint(x: puddle4!.position.x, y: puddle4!.position.y + 10)
        addChild(pud4)
    }
    func spawnPuddlePractileEmitter5() {
        let pud5 = SKEmitterNode(fileNamed: "Puddle.sks")!
        pud5.zPosition = 1
        pud5.position = CGPoint(x: puddle5!.position.x, y: puddle5!.position.y + 10)
        addChild(pud5)
    }
    func spawnPuddlePractileEmitter6() {
        let pud1 = SKEmitterNode(fileNamed: "Puddle.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: puddle6!.position.x, y: puddle6!.position.y + 10)
        addChild(pud1)
    }
//MARK: KillSmokeSkeleton
    func spawnKillSmokeEnemy1() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy1!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy2() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy2!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy3() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy3!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy4() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy4!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy5() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy5!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy6() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy6!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy7() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy7!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy8() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy8!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy9() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy9!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy10() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy10!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy11() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy11!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy12() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy12!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy13() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy13!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy14() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy14!.position
        addChild(smoke)
    }
    func spawnKillSmokeEnemy15() {
        let smoke = SKEmitterNode(fileNamed: "KillSkeleton.sks")!
        smoke.zPosition = 100
        smoke.position = enemy15!.position
        addChild(smoke)
    }
//MARK: - ShotButtonAction
    func shotButtonAction() {
        var positionY: CGFloat!
        var positionX: CGFloat!
        var scale: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 115
            positionX = 290
            scale = 0.50
        } else if totalSize.width >= 800 {
            positionY = -130
            positionX = 290
            scale = 0.35
        } else {
            positionY = -160
            positionX = 310
            scale = 0.45
        }
        shotButton = SKButton(imageName: "shotButton", buttonAction: {
            
            if self.shotReady == true {
                
                self.shotReady = false
                
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                self.shotReady = true
            }
                
            if self.levelNumber >= 1 && self.levelNumber <= 30 {
                if self.sound == true {
                   self.run(Sound.arrow.action)
                }
                self.spawnArrow()
                self.playerStateMachine.enter(ShotState.self)
            } else if self.levelNumber >= 31 && self.levelNumber <= 60 {
                if self.sound == true {
                   self.run(Sound.arrow.action)
                }
                self.spawnAxeWoodman()
                self.playerStateMachine.enter(AttackWoodmanState.self)
            }
                
            }
            
        })
        shotButton.setScale(scale)
        shotButton.position = CGPoint(x: CGFloat(positionX), y: CGFloat(positionY))
        shotButton.zPosition = 3000
        cameraNode?.addChild(shotButton)
    }
 //MARK: - JumpButtonAction
    func jumpButtonAction() {
        var positionY: CGFloat!
        var positionX: CGFloat!
        var scale: CGFloat!
        if totalSize.width >= 1000 {
            positionY = -160
            positionX = 200
            scale = 0.45
        } else if totalSize.width >= 800 {
            positionY = -130
            positionX = 200
            scale = 0.35
        } else {
            positionY = -160
            positionX = 200
            scale = 0.45
        }
        jumpButton = SKButton(imageName: "jumpButton", buttonAction: {
            if self.jumpReady == true {
                
                if self.sound == true {
                    self.run(Sound.jump.action)
                }
                self.player!.run(.applyForce(CGVector(dx: 0, dy: 240), duration: 0.1))
                let jumpAction = SKAction.applyImpulse(CGVector(dx: 0, dy: 35), duration: 0.1)
                self.player!.run(jumpAction)
                
                self.jumpReady = false
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                    self.jumpReady = true
                }
                if self.levelNumber >= 1 && self.levelNumber <= 30 {
                    var textures: [SKTexture] = []
                    for i in 0...10 {
                        textures.append(SKTexture(imageNamed: "jump/\(i)"))
                    }

                           let shotAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
                    self.player!.run(SKAction.sequence([shotAnimation]))
//                    self.playerStateMachine.enter(JumpingState.self)
                } else if self.levelNumber >= 31 && self.levelNumber <= 60 {
                    var textures: [SKTexture] = []
                    for i in 0...4 {
                        textures.append(SKTexture(imageNamed: "woodmanJump/\(i)"))
                    }

                    let shotAnimation = SKAction.animate(with: textures, timePerFrame: 0.25)
                    self.player!.run(SKAction.sequence([shotAnimation]))
//                    self.playerStateMachine.enter(JumpingWoodmanState.self)
                }
                
            }
        })
        jumpButton.setScale(scale)
        jumpButton.position = CGPoint(x: CGFloat(positionX), y: CGFloat(positionY))
        jumpButton.zPosition = 3000
        cameraNode?.addChild(jumpButton)
    }
//MARK: - SpawnAxeGoblin
        //1
        func spawnAxe() {
            let axe  = SKSpriteNode(imageNamed: "axe")
            axe.name = "Axe"
            axe.setScale(0.5)
            axe.position = CGPoint(x: enemy1!.position.x - 20, y: enemy1!.position.y - 5)
            axe.zPosition = 1
            addChild(axe)
            
            let action = CGVector(dx: -3, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.2)
            let rotate = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group = SKAction.group([impulse,rotate])
            let remove = SKAction.removeFromParent()
            let sequence = SKAction.sequence([group, remove])
            axe.run(SKAction.sequence([sequence]))
            
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe.size)
            axe.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.axe.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        }
        //2
        func spawnAxe2() {
            let axe2  = SKSpriteNode(imageNamed: "axe")
            axe2.name = "Axe2"
            axe2.setScale(0.5)
            axe2.position = CGPoint(x: enemy2!.position.x - 20, y: enemy2!.position.y - 5)
            axe2.zPosition = 1
            addChild(axe2)
            
            let action2 = CGVector(dx: -3, dy: 0)
            let impulse2 = SKAction.applyImpulse(action2, duration: 1.2)
            let rotate2 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group2 = SKAction.group([impulse2,rotate2])
            let remove2 = SKAction.removeFromParent()
            let sequence2 = SKAction.sequence([group2, remove2])
            axe2.run(SKAction.sequence([sequence2]))
            
            let physicsBody2 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe2.size)
            axe2.physicsBody = physicsBody2
            physicsBody2.categoryBitMask = Collision.Masks.axe2.bitmask
            physicsBody2.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody2.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody2.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody2.affectedByGravity = false
            physicsBody2.allowsRotation = false
        }
        //3
        func spawnAxe3() {
            let axe3  = SKSpriteNode(imageNamed: "axe")
            axe3.name = "Axe3"
            axe3.setScale(0.5)
            axe3.position = CGPoint(x: enemy3!.position.x - 20, y: enemy3!.position.y - 5)
            axe3.zPosition = 1
            addChild(axe3)
            
            let action3 = CGVector(dx: -3, dy: 0)
            let impulse3 = SKAction.applyImpulse(action3, duration: 1.2)
            let rotate3 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group3 = SKAction.group([impulse3,rotate3])
            let remove3 = SKAction.removeFromParent()
            let sequence3 = SKAction.sequence([group3, remove3])
            axe3.run(SKAction.sequence([sequence3]))
            
            let physicsBody3 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe3.size)
            axe3.physicsBody = physicsBody3
            physicsBody3.categoryBitMask = Collision.Masks.axe3.bitmask
            physicsBody3.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody3.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody3.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody3.affectedByGravity = false
            physicsBody3.allowsRotation = false
        }
        //4
        func spawnAxe4() {
            let axe4  = SKSpriteNode(imageNamed: "axe")
            axe4.name = "Axe4"
            axe4.setScale(0.5)
            axe4.position = CGPoint(x: enemy4!.position.x - 20, y: enemy4!.position.y - 5)
            axe4.zPosition = 1
            addChild(axe4)
            
            let action4 = CGVector(dx: -3, dy: 0)
            let impulse4 = SKAction.applyImpulse(action4, duration: 1.2)
            let rotate4 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group4 = SKAction.group([impulse4,rotate4])
            let remove4 = SKAction.removeFromParent()
            let sequence4 = SKAction.sequence([group4, remove4])
            axe4.run(SKAction.sequence([sequence4]))
            
            let physicsBody4 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe4.size)
            axe4.physicsBody = physicsBody4
            physicsBody4.categoryBitMask = Collision.Masks.axe4.bitmask
            physicsBody4.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody4.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody4.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody4.affectedByGravity = false
            physicsBody4.allowsRotation = false
        }
        //5
        func spawnAxe5() {
            let axe5  = SKSpriteNode(imageNamed: "axe")
            axe5.name = "Axe5"
            axe5.setScale(0.5)
            axe5.position = CGPoint(x: enemy5!.position.x - 20, y: enemy5!.position.y - 5)
            axe5.zPosition = 1
            addChild(axe5)
            
            let action5 = CGVector(dx: -3, dy: 0)
            let impulse5 = SKAction.applyImpulse(action5, duration: 1.2)
            let rotate5 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group5 = SKAction.group([impulse5,rotate5])
            let remove5 = SKAction.removeFromParent()
            let sequence5 = SKAction.sequence([group5, remove5])
            axe5.run(SKAction.sequence([sequence5]))
            
            let physicsBody5 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe5.size)
            axe5.physicsBody = physicsBody5
            physicsBody5.categoryBitMask = Collision.Masks.axe5.bitmask
            physicsBody5.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody5.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody5.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody5.affectedByGravity = false
            physicsBody5.allowsRotation = false
        }
        //6
        func spawnAxe6() {
            let axe6  = SKSpriteNode(imageNamed: "axe")
            axe6.name = "Axe6"
            axe6.setScale(0.5)
            axe6.position = CGPoint(x: enemy6!.position.x - 20, y: enemy6!.position.y - 5)
            axe6.zPosition = 1
            addChild(axe6)
            
            let action6 = CGVector(dx: -3, dy: 0)
            let impulse6 = SKAction.applyImpulse(action6, duration: 1.2)
            let rotate6 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group6 = SKAction.group([impulse6,rotate6])
            let remove6 = SKAction.removeFromParent()
            let sequence6 = SKAction.sequence([group6, remove6])
            axe6.run(SKAction.sequence([sequence6]))
            
            let physicsBody6 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe6.size)
            axe6.physicsBody = physicsBody6
            physicsBody6.categoryBitMask = Collision.Masks.axe6.bitmask
            physicsBody6.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody6.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody6.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody6.affectedByGravity = false
            physicsBody6.allowsRotation = false
        }
        //7
        func spawnAxe7() {
            let axe7  = SKSpriteNode(imageNamed: "axe")
            axe7.name = "Axe7"
            axe7.setScale(0.5)
            axe7.position = CGPoint(x: enemy7!.position.x - 20, y: enemy7!.position.y - 5)
            axe7.zPosition = 1
            addChild(axe7)
            
            let action7 = CGVector(dx: -3, dy: 0)
            let impulse7 = SKAction.applyImpulse(action7, duration: 1.2)
            let rotate7 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group7 = SKAction.group([impulse7,rotate7])
            let remove7 = SKAction.removeFromParent()
            let sequence7 = SKAction.sequence([group7, remove7])
            axe7.run(SKAction.sequence([sequence7]))
            
            let physicsBody7 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe7.size)
            axe7.physicsBody = physicsBody7
            physicsBody7.categoryBitMask = Collision.Masks.axe7.bitmask
            physicsBody7.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody7.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody7.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody7.affectedByGravity = false
            physicsBody7.allowsRotation = false
        }
        //8
        func spawnAxe8() {
            let axe8  = SKSpriteNode(imageNamed: "axe")
            axe8.name = "Axe8"
            axe8.setScale(0.5)
            axe8.position = CGPoint(x: enemy8!.position.x - 20, y: enemy8!.position.y - 5)
            axe8.zPosition = 1
            addChild(axe8)
            
            let action8 = CGVector(dx: -3, dy: 0)
            let impulse8 = SKAction.applyImpulse(action8, duration: 1.2)
            let rotate8 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group8 = SKAction.group([impulse8,rotate8])
            let remove8 = SKAction.removeFromParent()
            let sequence8 = SKAction.sequence([group8, remove8])
            axe8.run(SKAction.sequence([sequence8]))
            
            let physicsBody8 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe8.size)
            axe8.physicsBody = physicsBody8
            physicsBody8.categoryBitMask = Collision.Masks.axe8.bitmask
            physicsBody8.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody8.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody8.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody8.affectedByGravity = false
            physicsBody8.allowsRotation = false
        }
        //9
        func spawnAxe9() {
            let axe9  = SKSpriteNode(imageNamed: "axe")
            axe9.name = "Axe9"
            axe9.setScale(0.5)
            axe9.position = CGPoint(x: enemy9!.position.x - 20, y: enemy9!.position.y - 5)
            axe9.zPosition = 1
            addChild(axe9)
            
            let action9 = CGVector(dx: -3, dy: 0)
            let impulse9 = SKAction.applyImpulse(action9, duration: 1.2)
            let rotate9 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group9 = SKAction.group([impulse9,rotate9])
            let remove9 = SKAction.removeFromParent()
            let sequence9 = SKAction.sequence([group9, remove9])
            axe9.run(SKAction.sequence([sequence9]))
            
            let physicsBody9 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe9.size)
            axe9.physicsBody = physicsBody9
            physicsBody9.categoryBitMask = Collision.Masks.axe9.bitmask
            physicsBody9.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody9.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody9.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody9.affectedByGravity = false
            physicsBody9.allowsRotation = false
        }
        //10
        func spawnAxe10() {
            let axe10  = SKSpriteNode(imageNamed: "axe")
            axe10.name = "Axe10"
            axe10.setScale(0.5)
            axe10.position = CGPoint(x: enemy10!.position.x - 20, y: enemy10!.position.y - 5)
            axe10.zPosition = 1
            addChild(axe10)
            
            let action10 = CGVector(dx: -3, dy: 0)
            let impulse10 = SKAction.applyImpulse(action10, duration: 1.2)
            let rotate10 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group10 = SKAction.group([impulse10,rotate10])
            let remove10 = SKAction.removeFromParent()
            let sequence10 = SKAction.sequence([group10, remove10])
            axe10.run(SKAction.sequence([sequence10]))
            
            let physicsBody10 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe10.size)
            axe10.physicsBody = physicsBody10
            physicsBody10.categoryBitMask = Collision.Masks.axe10.bitmask
            physicsBody10.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody10.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody10.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody10.affectedByGravity = false
            physicsBody10.allowsRotation = false
        }
        //11
        func spawnAxe11() {
            let axe11  = SKSpriteNode(imageNamed: "axe")
            axe11.name = "Axe11"
            axe11.setScale(0.5)
            axe11.position = CGPoint(x: enemy11!.position.x - 20, y: enemy11!.position.y - 5)
            axe11.zPosition = 1
            addChild(axe11)
            
            let action11 = CGVector(dx: -3, dy: 0)
            let impulse11 = SKAction.applyImpulse(action11, duration: 1.2)
            let rotate11 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group11 = SKAction.group([impulse11,rotate11])
            let remove11 = SKAction.removeFromParent()
            let sequence11 = SKAction.sequence([group11, remove11])
            axe11.run(SKAction.sequence([sequence11]))
            
            let physicsBody11 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe11.size)
            axe11.physicsBody = physicsBody11
            physicsBody11.categoryBitMask = Collision.Masks.axe11.bitmask
            physicsBody11.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody11.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody11.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody11.affectedByGravity = false
            physicsBody11.allowsRotation = false
        }
        //12
        func spawnAxe12() {
            let axe12  = SKSpriteNode(imageNamed: "axe")
            axe12.name = "Axe12"
            axe12.setScale(0.5)
            axe12.position = CGPoint(x: enemy12!.position.x - 20, y: enemy12!.position.y - 5)
            axe12.zPosition = 1
            addChild(axe12)
            
            let action12 = CGVector(dx: -3, dy: 0)
            let impulse12 = SKAction.applyImpulse(action12, duration: 1.2)
            let rotate12 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group12 = SKAction.group([impulse12,rotate12])
            let remove12 = SKAction.removeFromParent()
            let sequence12 = SKAction.sequence([group12, remove12])
            axe12.run(SKAction.sequence([sequence12]))
            
            let physicsBody12 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe12.size)
            axe12.physicsBody = physicsBody12
            physicsBody12.categoryBitMask = Collision.Masks.axe12.bitmask
            physicsBody12.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody12.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody12.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody12.affectedByGravity = false
            physicsBody12.allowsRotation = false
        }
        //13
        func spawnAxe13() {
            let axe13  = SKSpriteNode(imageNamed: "axe")
            axe13.name = "Axe13"
            axe13.setScale(0.5)
            axe13.position = CGPoint(x: enemy13!.position.x - 20, y: enemy13!.position.y - 5)
            axe13.zPosition = 1
            addChild(axe13)
            
            let action13 = CGVector(dx: -3, dy: 0)
            let impulse13 = SKAction.applyImpulse(action13, duration: 1.2)
            let rotate13 = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group13 = SKAction.group([impulse13,rotate13])
            let remove13 = SKAction.removeFromParent()
            let sequence13 = SKAction.sequence([group13, remove13])
            axe13.run(SKAction.sequence([sequence13]))
            
            let physicsBody13 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe13.size)
            axe13.physicsBody = physicsBody13
            physicsBody13.categoryBitMask = Collision.Masks.axe13.bitmask
            physicsBody13.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody13.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody13.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody13.affectedByGravity = false
            physicsBody13.allowsRotation = false
        }
        //14
        func spawnAxe14() {
           let axe14  = SKSpriteNode(imageNamed: "axe")
           axe14.name = "Axe14"
           axe14.setScale(0.5)
           axe14.position = CGPoint(x: enemy14!.position.x - 20, y: enemy14!.position.y - 5)
           axe14.zPosition = 1
           addChild(axe14)
           
           let action14 = CGVector(dx: -3, dy: 0)
           let impulse14 = SKAction.applyImpulse(action14, duration: 1.2)
           let rotate14 = SKAction.rotate(byAngle: 10, duration: 1.4)
           let group14 = SKAction.group([impulse14,rotate14])
           let remove14 = SKAction.removeFromParent()
           let sequence14 = SKAction.sequence([group14, remove14])
           axe14.run(SKAction.sequence([sequence14]))
           
           let physicsBody14 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe14.size)
           axe14.physicsBody = physicsBody14
           physicsBody14.categoryBitMask = Collision.Masks.axe14.bitmask
           physicsBody14.collisionBitMask = Collision.Masks.player.bitmask
           physicsBody14.contactTestBitMask = Collision.Masks.player.bitmask
           physicsBody14.fieldBitMask = Collision.Masks.player.bitmask

           physicsBody14.affectedByGravity = false
           physicsBody14.allowsRotation = false
       }
        //15
        func spawnAxe15() {
           let axe15  = SKSpriteNode(imageNamed: "axe")
           axe15.name = "Axe15"
           axe15.setScale(0.5)
           axe15.position = CGPoint(x: enemy15!.position.x - 20, y: enemy15!.position.y - 5)
           axe15.zPosition = 1
           addChild(axe15)
           
           let action15 = CGVector(dx: -3, dy: 0)
           let impulse15 = SKAction.applyImpulse(action15, duration: 1.2)
           let rotate15 = SKAction.rotate(byAngle: 10, duration: 1.4)
           let group15 = SKAction.group([impulse15,rotate15])
           let remove15 = SKAction.removeFromParent()
           let sequence15 = SKAction.sequence([group15, remove15])
           axe15.run(SKAction.sequence([sequence15]))
           
           let physicsBody15 = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe15.size)
           axe15.physicsBody = physicsBody15
           physicsBody15.categoryBitMask = Collision.Masks.axe15.bitmask
           physicsBody15.collisionBitMask = Collision.Masks.player.bitmask
           physicsBody15.contactTestBitMask = Collision.Masks.player.bitmask
           physicsBody15.fieldBitMask = Collision.Masks.player.bitmask

           physicsBody15.affectedByGravity = false
           physicsBody15.allowsRotation = false
       }
//MARK: - SpawnAxeWoodman
    func spawnAxeWoodman() {
            var rotationBullet: CGFloat!
            var positionBullet: CGFloat!
            guard let joystickKnob = joystickKnob else { return }
            let xPosition = Double(joystickKnob.position.x)
            let movingRight = xPosition >= 0
            let movingLeft = xPosition < 0
            
            if movingLeft {
                positionBullet = -20
                rotationBullet = 3.12
            } else if movingRight {
                positionBullet = 20
                rotationBullet = 0
            }
        
            let axe = SKSpriteNode(imageNamed: "axeWoodman2")
            axe.name = "Arrow"
            axe.setScale(0.45)
            axe.position = CGPoint(x: player!.position.x + positionBullet, y: player!.position.y - 2)
            axe.zPosition = 30
            axe.zRotation = rotationBullet

            addChild(axe)

            if movingLeft {
                let action = CGVector(dx: -90, dy: 0)
                let impulse = SKAction.applyImpulse(action, duration: 4.0)
                let rotate = SKAction.rotate(byAngle: 10, duration: 1.4)
                let group = SKAction.group([impulse,rotate])
                axe.run(SKAction.sequence([group]))
            } else if movingRight {
                let action = CGVector(dx: 90, dy: 0)
                let impulse = SKAction.applyImpulse(action, duration: 4.0)
                let rotate = SKAction.rotate(byAngle: -10, duration: 1.4)
                let group = SKAction.group([impulse,rotate])
                axe.run(SKAction.sequence([group]))
            }
        
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "axeWoodman2"), size: axe.size)
            axe.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.arrowBody.bitmask
            physicsBody.collisionBitMask = Collision.Masks.enemyBody1.bitmask | Collision.Masks.enemyBody2.bitmask | Collision.Masks.enemyBody3.bitmask | Collision.Masks.enemyBody4.bitmask | Collision.Masks.enemyBody5.bitmask | Collision.Masks.enemyBody6.bitmask | Collision.Masks.enemyBody7.bitmask | Collision.Masks.enemyBody8.bitmask | Collision.Masks.enemyBody9.bitmask | Collision.Masks.enemyBody10.bitmask | Collision.Masks.enemyBody11.bitmask | Collision.Masks.enemyBody12.bitmask | Collision.Masks.enemyBody13.bitmask | Collision.Masks.enemyBody14.bitmask | Collision.Masks.enemyBody15.bitmask | Collision.Masks.shotZone.bitmask | Collision.Masks.ground.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.enemyBody1.bitmask | Collision.Masks.enemyBody2.bitmask | Collision.Masks.enemyBody3.bitmask | Collision.Masks.enemyBody4.bitmask | Collision.Masks.enemyBody5.bitmask | Collision.Masks.enemyBody6.bitmask | Collision.Masks.enemyBody7.bitmask | Collision.Masks.enemyBody8.bitmask | Collision.Masks.enemyBody9.bitmask | Collision.Masks.enemyBody10.bitmask | Collision.Masks.enemyBody11.bitmask | Collision.Masks.enemyBody12.bitmask | Collision.Masks.enemyBody13.bitmask | Collision.Masks.enemyBody14.bitmask | Collision.Masks.enemyBody15.bitmask | Collision.Masks.shotZone.bitmask | Collision.Masks.ground.bitmask
            physicsBody.fieldBitMask = Collision.Masks.enemyBody1.bitmask | Collision.Masks.enemyBody2.bitmask | Collision.Masks.enemyBody3.bitmask | Collision.Masks.enemyBody4.bitmask | Collision.Masks.enemyBody5.bitmask | Collision.Masks.enemyBody6.bitmask | Collision.Masks.enemyBody7.bitmask | Collision.Masks.enemyBody8.bitmask | Collision.Masks.enemyBody9.bitmask | Collision.Masks.enemyBody10.bitmask | Collision.Masks.enemyBody11.bitmask | Collision.Masks.enemyBody12.bitmask | Collision.Masks.enemyBody13.bitmask | Collision.Masks.enemyBody14.bitmask | Collision.Masks.enemyBody15.bitmask | Collision.Masks.shotZone.bitmask | Collision.Masks.ground.bitmask
            
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
    }
//MARK: - SpawnArrow
    func spawnArrow() {
            var rotationBullet: CGFloat!
            var positionBullet: CGFloat!
            guard let joystickKnob = joystickKnob else { return }
            let xPosition = Double(joystickKnob.position.x)
            let movingRight = xPosition >= 0
            let movingLeft = xPosition < 0
            
            if movingLeft {
                positionBullet = -20
                rotationBullet = 3.12
            } else if movingRight {
                positionBullet = 20
                rotationBullet = 0
            }
        
            let arrow = SKSpriteNode(imageNamed: "bullet")
            arrow.name = "Arrow"
            arrow.setScale(1.0)
            arrow.position = CGPoint(x: player!.position.x + positionBullet, y: player!.position.y - 2)
            arrow.zPosition = 30
            arrow.zRotation = rotationBullet

            addChild(arrow)

            if movingLeft {
                let action = CGVector(dx: -400, dy: 0)
                arrow.run(SKAction.applyImpulse(action, duration: 2.0))
            } else if movingRight {
                let action = CGVector(dx: 400, dy: 0)
                arrow.run(SKAction.applyImpulse(action, duration: 2.0))
            }
        
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "bullet"), size: arrow.size)
            arrow.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.arrowBody.bitmask
            physicsBody.collisionBitMask = Collision.Masks.enemyBody1.bitmask | Collision.Masks.enemyBody2.bitmask | Collision.Masks.enemyBody3.bitmask | Collision.Masks.enemyBody4.bitmask | Collision.Masks.enemyBody5.bitmask | Collision.Masks.enemyBody6.bitmask | Collision.Masks.enemyBody7.bitmask | Collision.Masks.enemyBody8.bitmask | Collision.Masks.enemyBody9.bitmask | Collision.Masks.enemyBody10.bitmask | Collision.Masks.enemyBody11.bitmask | Collision.Masks.enemyBody12.bitmask | Collision.Masks.enemyBody13.bitmask | Collision.Masks.enemyBody14.bitmask | Collision.Masks.enemyBody15.bitmask | Collision.Masks.shotZone.bitmask | Collision.Masks.ground.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.enemyBody1.bitmask | Collision.Masks.enemyBody2.bitmask | Collision.Masks.enemyBody3.bitmask | Collision.Masks.enemyBody4.bitmask | Collision.Masks.enemyBody5.bitmask | Collision.Masks.enemyBody6.bitmask | Collision.Masks.enemyBody7.bitmask | Collision.Masks.enemyBody8.bitmask | Collision.Masks.enemyBody9.bitmask | Collision.Masks.enemyBody10.bitmask | Collision.Masks.enemyBody11.bitmask | Collision.Masks.enemyBody12.bitmask | Collision.Masks.enemyBody13.bitmask | Collision.Masks.enemyBody14.bitmask | Collision.Masks.enemyBody15.bitmask | Collision.Masks.shotZone.bitmask | Collision.Masks.ground.bitmask
            physicsBody.fieldBitMask = Collision.Masks.enemyBody1.bitmask | Collision.Masks.enemyBody2.bitmask | Collision.Masks.enemyBody3.bitmask | Collision.Masks.enemyBody4.bitmask | Collision.Masks.enemyBody5.bitmask | Collision.Masks.enemyBody6.bitmask | Collision.Masks.enemyBody7.bitmask | Collision.Masks.enemyBody8.bitmask | Collision.Masks.enemyBody9.bitmask | Collision.Masks.enemyBody10.bitmask | Collision.Masks.enemyBody11.bitmask | Collision.Masks.enemyBody12.bitmask | Collision.Masks.enemyBody13.bitmask | Collision.Masks.enemyBody14.bitmask | Collision.Masks.enemyBody15.bitmask | Collision.Masks.shotZone.bitmask | Collision.Masks.ground.bitmask
            
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
    }
//MARK: - SaveCoin
    func setCoin() {
        
        let totalCoinDefault = UserDefaults.standard
        coinGame = totalCoinDefault.integer(forKey: "Totalcoin")

        if coinScore > 0 {
            coinGame += coinScore
            totalCoinDefault.setValue(coinGame, forKey: "Totalcoin")
            totalCoinDefault.synchronize()
            coinScore = 0
        }
    }
//MARK: - PlayerLoseHeart
    func playerLoseHeart() {
        let blinkTimes = 5.0
        let duration = 1.0
        let blinkAction = SKAction.customAction(withDuration: duration) { node, elapsedTime in
            let slice = duration / blinkTimes
            let remainder = Double(elapsedTime).truncatingRemainder(dividingBy: slice)
            node.isHidden = remainder > slice / 2
        }
        let setHidden = SKAction.run() { [weak self] in
            self?.player!.isHidden = false
        }
        player?.run(SKAction.sequence([blinkAction, setHidden]))
    }
}
// MARK:- Touches
extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            if let joystickKnob = joystickKnob {
                let location = touch.location(in: joystick!)
                joystickAction = joystickKnob.frame.contains(location)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let joystick = joystick else { return }
        guard let joystickKnob = joystickKnob else { return }
        if !joystickAction { return }
        for touch in touches {
            let position = touch.location(in: joystick)
            let length = sqrt(pow(position.y, 2) + pow(position.x, 2))
            let angle = atan2(position.y, position.x)
            
            if knobRadius > length {
                joystickKnob.position = position
            } else {
                joystickKnob.position = CGPoint(x: cos(angle) * knobRadius, y: sin(angle) * knobRadius)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            
            if levelNumber >= 1 && levelNumber <= 120 {
                let xJoystickCoordinate = touch.location(in: joystick!).x
                let xLimit: CGFloat = 200.0
    //            let faceAction: SKAction!
                var sizeX: CGFloat!
                if levelNumber >= 1 && levelNumber <= 30 {
                    sizeX = 1.4
                } else if levelNumber >= 31 && levelNumber <= 60{
                    sizeX = 0.147
                }
                
                if xJoystickCoordinate > -xLimit && xJoystickCoordinate < xLimit {
                    resetKnobPosition()
                    let faceMovement = SKAction.scaleX(to: sizeX, duration: 0)
                    let faceAction = SKAction.sequence([faceMovement])
                    player!.run(faceAction)
                }
            }
            
        }
    }
}

// MARK:- Actions
extension GameScene {
    
    func resetKnobPosition() {
        let initialPoint = CGPoint(x: 0, y: 0)
        let moveBack = SKAction.move(to: initialPoint, duration: 0.1)
        moveBack.timingMode = .linear
        joystickKnob?.run(moveBack)
        joystickAction = false
    }
    
    func rewardTouch() {
        setCoin()
        score += 1
        scoreLabel.text = String(score)
        
        UserDefaults.standard.set(0, forKey: "levelNumber")
    }
    
    func fillHearts(count: Int) {
        for index in 1...count {
            let heart = SKSpriteNode(imageNamed: "heart")
            let xPosition = heart.size.width * CGFloat(index - 1)
            heart.position = CGPoint(x: xPosition, y: 0)
            heartsArray.append(heart)
            heartContainer.addChild(heart)
        }
    }
    
    func loseHeart() {
        if isHit {
            
            let lastElementIndex = heartsArray.count - 1
            if heartsArray.indices.contains(lastElementIndex - 1) {
                let lastHeart = heartsArray[lastElementIndex]
                lastHeart.removeFromParent()
                heartsArray.remove(at: lastElementIndex)
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    self.isHit = false
                }
            } else {
                player?.removeFromParent()
                if levelNumber >= 1 && levelNumber <= 30 {
                    spawnAnimationKillArcher()
                    
                } else if levelNumber >= 31 && levelNumber <= 60 {
                    spawnAnimationKillWoodman()
                }
                
                heartContainer.removeFromParent()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    self.dying()
                    self.gameOver()
                }
                
            }
        }
    }
    func loseHeartThree() {
        if isHit {
            let lastElementIndex = heartsArray.count - 3
            if heartsArray.indices.contains(lastElementIndex - 3) {
                let lastHeart = heartsArray[lastElementIndex]
                lastHeart.removeFromParent()
                heartsArray.remove(at: lastElementIndex)
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    self.isHit = false
                }
            } else {
                heartContainer.removeFromParent()
                dying()
                gameOver()
            }
        }
    }
    
//    func invincible() {
//        player?.physicsBody?.categoryBitMask = 0
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
//            self.player?.physicsBody?.categoryBitMask = 2
//        }
//    }
    
    func dying() {
        let die = SKAction.move(to: CGPoint(x: -300, y: 0), duration: 0.1)
        player?.run(die)
        self.removeAllActions()
        fillHearts(count: 3)
    }
    
    func gameOver() {
        
        UserDefaults.standard.set(0, forKey: "levelNumber")
        
        let scene = GameOver(fileNamed: "GameOver")
        self.view?.presentScene(scene)
        self.removeAllActions()
    }
}

// MARK:- Game Loop
extension GameScene {
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - previousTimeInterval
        previousTimeInterval = currentTime
        
        rewardIsNotTouched = true
        
        var positionY: CGFloat!
        var positionX: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 115
            positionX = 270
        } else if totalSize.width >= 800 {
            positionY = 90
            positionX = 270
        } else {
            positionY = 115
            positionX = 270

        }
        
        // Camera
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            self.cameraNode?.position.x = self.player!.position.x
        }
        
//        cameraNode?.position.y = player!.position.y
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            self.joystick?.position.y = (self.cameraNode!.position.y) - positionY
            self.joystick?.position.x = (self.cameraNode!.position.x) - positionX
        }
        
        
        // Player Movement
        guard let joystickKnob = joystickKnob else { return }
        guard let player = player else { return }
        let xPosition = Double(joystickKnob.position.x)
        let positivePosition = xPosition < 0 ? -xPosition : xPosition
        
        
        if floor(positivePosition) != 0 {
            if levelNumber >= 1 && levelNumber <= 30 {
                if jumpReady == true {
                    playerStateMachine.enter(WalkingState.self)
                }
            } else if levelNumber >= 31 && levelNumber <= 60 {
                playerStateMachine.enter(WalkingWoodmanState.self)
            }
            
        } else {
            if levelNumber >= 1 && levelNumber <= 30 {
                 playerStateMachine.enter(IdleState.self)
            } else if levelNumber >= 31 && levelNumber <= 60 {
                playerStateMachine.enter(IdleWoodmanState.self)
            }
            
        }
        
        let displacement = CGVector(dx: deltaTime * xPosition * playerSpeed, dy: 0)
        let move = SKAction.move(by: displacement, duration: 0)
        
        var sizeX: CGFloat!
        var sizeX2: CGFloat!
        if levelNumber >= 1 && levelNumber <= 30 {
            sizeX = -1.4
            sizeX2 = 1.4
        } else if levelNumber >= 31 && levelNumber <= 60 {
            sizeX = -0.147
            sizeX2 = 0.147
        }
        let faceAction: SKAction!
        let movingRight = xPosition > 0
        let movingLeft = xPosition < 0
        if movingLeft && playerIsFacingRight {
            playerIsFacingRight = false
            let faceMovement = SKAction.scaleX(to: sizeX, duration: 0)
            faceAction = SKAction.sequence([move, faceMovement])
        } else if movingRight && !playerIsFacingRight {
            playerIsFacingRight = true
            let faceMovement = SKAction.scaleX(to: sizeX2, duration: 0)
            faceAction = SKAction.sequence([move, faceMovement])
        } else {
            faceAction = move
        }
        
        player.run(faceAction)
    }
}

// MARK:- Collision
extension GameScene: SKPhysicsContactDelegate {
    
    struct Collision {
        enum Masks: Int {
            case killing, player, reward, ground, arrowBody, trap, enemyBody1, enemyBody2, enemyBody3, enemyBody4, enemyBody5, enemyBody6, enemyBody7, enemyBody8, enemyBody9, enemyBody10, enemyBody11, enemyBody12, enemyBody13, enemyBody14, enemyBody15, bones, box, shotZone, axe, axe2, axe3, axe4, axe5, axe6, axe7, axe8, axe9, axe10, axe11, axe12, axe13, axe14, axe15, bigAxe, bigSkeleton, bigGoblin, positionEndLevel30, positionEndLevel60, coinBody1, coinBody2, coinBody3, coinBody4, coinBody5, coinBody6, coinBody7, coinBody8, coinBody9, coinBody10, coinBody11, coinBody12, coinBody13, coinBody14, coinBody15
            var bitmask: UInt32 { return 1 << self.rawValue }
        }
        
        let masks: (first: UInt32, second: UInt32)
        
        func matches(_ first: Masks, _ second: Masks) -> Bool {
            return (first.bitmask == masks.first && second.bitmask == masks.second) ||
            (first.bitmask == masks.second && second.bitmask == masks.first)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = Collision(masks: (first: contact.bodyA.categoryBitMask, second: contact.bodyB.categoryBitMask))

// Player/Trap
        if collision.matches(.player, .killing) {
            if contact.bodyA.node?.name == "ArrowEnemy", let arrow = contact.bodyA.node {
                arrow.removeFromParent()
                if levelNumber >= 1 && levelNumber <= 30 {
                    spawnAnimationKillArcher()
                    if sound == true {
                        run(Sound.male.action)
                    }
                } else if levelNumber >= 31 && levelNumber <= 60 {
                    spawnAnimationKillWoodman()
                }
                player?.removeFromParent()
                heartContainer.removeFromParent()
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                    self.isHit = true
                    self.loseHeartThree()
                    self.playerStateMachine.enter(StunnedState.self)
                }
            }
            if contact.bodyB.node?.name == "ArrowEnemy", let arrow = contact.bodyB.node {
                arrow.removeFromParent()
            }
            if levelNumber >= 1 && levelNumber <= 30 {
                spawnAnimationKillArcher()
                if sound == true {
                    run(Sound.male.action)
                }
            } else if levelNumber >= 31 && levelNumber <= 60 {
                spawnAnimationKillWoodman()
            }
            player?.removeFromParent()
            heartContainer.removeFromParent()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                self.isHit = true
                self.loseHeartThree()
                self.playerStateMachine.enter(StunnedState.self)
            }
            
        }
        
// Player/Skeleton
        if collision.matches(.player, .enemyBody1) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody2) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody3) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody4) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody5) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody6) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody7) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody8) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody9) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody10) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody11) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody12) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody13) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody14) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        if collision.matches(.player, .enemyBody15) {
            isHit = true
            loseHeart()
            playerLoseHeart()
            if sound == true {
                run(Sound.male.action)
            }
        }
        
// Player/Ground
        if collision.matches(.player, .ground) {
            playerStateMachine.enter(LandingState.self)
        }

// Player/Reward
        if collision.matches(.player, .reward) {
            if contact.bodyA.node?.name == "jewel" {
                if levelNumber == 59 {
                    
                } else {
                    run(Sound.teleport.action)
                    player!.removeFromParent()
                }
                
            } else if contact.bodyB.node?.name == "jewel" {
                if levelNumber == 59 {
                    
                } else {
                    run(Sound.teleport.action)
                    player!.removeFromParent()
                }
            }
            
            if rewardIsNotTouched {
                rewardTouch()
                rewardIsNotTouched = false
            }
        }
        
// Arrow/Ground/ShotZone
            if collision.matches(.shotZone, .arrowBody) {
                if contact.bodyA.node?.name == "Arrow", let arrow = contact.bodyA.node {
                    arrow.removeFromParent()
                }
                if contact.bodyB.node?.name == "Arrow", let arrow = contact.bodyB.node {
                    arrow.removeFromParent()
                }
            }
        
            if collision.matches(.ground, .arrowBody) {
                    if contact.bodyA.node?.name == "Arrow", let arrow = contact.bodyA.node {
                        arrow.removeFromParent()
                    }
                    if contact.bodyB.node?.name == "Arrow", let arrow = contact.bodyB.node {
                        arrow.removeFromParent()
                    }
                }
// PlayerAxe
        //1
            if collision.matches(.player, .axe) {
                    if contact.bodyA.node?.name == "Axe" {
                        contact.bodyA.node?.removeFromParent()
                        
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                        
                    } else if contact.bodyB.node?.name == "Axe" {
                        contact.bodyB.node?.removeFromParent()
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                    }
            }
        //2
        if collision.matches(.player, .axe2) {
                if contact.bodyA.node?.name == "Axe2" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe2" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //3
            if collision.matches(.player, .axe3) {
                    if contact.bodyA.node?.name == "Axe3" {
                        contact.bodyA.node?.removeFromParent()
                        
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                        
                    } else if contact.bodyB.node?.name == "Axe3" {
                        contact.bodyB.node?.removeFromParent()
                        
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                    }
            }
        //4
        if collision.matches(.player, .axe4) {
                if contact.bodyA.node?.name == "Axe4" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe4" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //5
        if collision.matches(.player, .axe5) {
                if contact.bodyA.node?.name == "Axe5" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe5" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //6
            if collision.matches(.player, .axe6) {
                    if contact.bodyA.node?.name == "Axe6" {
                        contact.bodyA.node?.removeFromParent()
                        
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                        
                    } else if contact.bodyB.node?.name == "Axe6" {
                        contact.bodyB.node?.removeFromParent()
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                    }
            }
        //7
        if collision.matches(.player, .axe7) {
                if contact.bodyA.node?.name == "Axe7" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe7" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //8
        if collision.matches(.player, .axe8) {
                if contact.bodyA.node?.name == "Axe8" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe8" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //9
            if collision.matches(.player, .axe9) {
                    if contact.bodyA.node?.name == "Axe9" {
                        contact.bodyA.node?.removeFromParent()
                        
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                        
                    } else if contact.bodyB.node?.name == "Axe9" {
                        contact.bodyB.node?.removeFromParent()
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                    }
            }
        //10
        if collision.matches(.player, .axe10) {
                if contact.bodyA.node?.name == "Axe10" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe10" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //11
        if collision.matches(.player, .axe11) {
                if contact.bodyA.node?.name == "Axe11" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe11" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //12
            if collision.matches(.player, .axe12) {
                    if contact.bodyA.node?.name == "Axe12" {
                        contact.bodyA.node?.removeFromParent()
                        
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                        
                    } else if contact.bodyB.node?.name == "Axe12" {
                        contact.bodyB.node?.removeFromParent()
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                    }
            }
        //13
        if collision.matches(.player, .axe13) {
                if contact.bodyA.node?.name == "Axe13" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe13" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //14
        if collision.matches(.player, .axe14) {
                if contact.bodyA.node?.name == "Axe14" {
                    contact.bodyA.node?.removeFromParent()
                    
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                    
                } else if contact.bodyB.node?.name == "Axe14" {
                    contact.bodyB.node?.removeFromParent()
                    isHit = true
                    loseHeart()
                    playerLoseHeart()
                    
                    if sound == true {
                        run(Sound.maleWoodman.action)
                    }
                }
        }
        //15
            if collision.matches(.player, .axe15) {
                    if contact.bodyA.node?.name == "Axe15" {
                        contact.bodyA.node?.removeFromParent()
                        
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                        
                    } else if contact.bodyB.node?.name == "Axe15" {
                        contact.bodyB.node?.removeFromParent()
                        isHit = true
                        loseHeart()
                        playerLoseHeart()
                        
                        if sound == true {
                            run(Sound.maleWoodman.action)
                        }
                    }
            }
// Coin/Player
            //1
            if collision.matches(.player, .coinBody1) {
                    if contact.bodyA.node?.name == "Coin1" {
                        coin1.removeFromParent()
                        coinAnimation1()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin1" {
                        coin1.removeFromParent()
                        coinAnimation1()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //2
            if collision.matches(.player, .coinBody2) {
                    if contact.bodyA.node?.name == "Coin2" {
                        coin2.removeFromParent()
                        coinAnimation2()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin2" {
                        coin2.removeFromParent()
                        coinAnimation2()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //3
            if collision.matches(.player, .coinBody3) {
                if contact.bodyA.node?.name == "Coin3" {
                    coin3.removeFromParent()
                    coinAnimation3()
                    if sound == true {
                        run(Sound.coins.action)
                    }
                    coinScore += 5
                } else if contact.bodyB.node?.name == "Coin3" {
                    coin3.removeFromParent()
                    coinAnimation3()
                    if sound == true {
                        run(Sound.coins.action)
                    }
                    coinScore += 5
                }
            //4
            if collision.matches(.player, .coinBody4) {
                    if contact.bodyA.node?.name == "Coin4" {
                        coin4.removeFromParent()
                        coinAnimation4()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin4" {
                        coin4.removeFromParent()
                        coinAnimation4()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //5
            if collision.matches(.player, .coinBody5) {
                    if contact.bodyA.node?.name == "Coin5" {
                        coin5.removeFromParent()
                        coinAnimation5()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin5" {
                        coin5.removeFromParent()
                        coinAnimation5()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //6
            if collision.matches(.player, .coinBody6) {
                    if contact.bodyA.node?.name == "Coin6" {
                        coin6.removeFromParent()
                        coinAnimation6()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin6" {
                        coin6.removeFromParent()
                        coinAnimation6()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //7
            if collision.matches(.player, .coinBody7) {
                    if contact.bodyA.node?.name == "Coin7" {
                        coin7.removeFromParent()
                        coinAnimation7()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin7" {
                        coin7.removeFromParent()
                        coinAnimation7()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //8
            if collision.matches(.player, .coinBody8) {
                    if contact.bodyA.node?.name == "Coin8" {
                        coin8.removeFromParent()
                        coinAnimation8()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin8" {
                        coin8.removeFromParent()
                        coinAnimation8()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //9
            if collision.matches(.player, .coinBody9) {
                    if contact.bodyA.node?.name == "Coin9" {
                        coin9.removeFromParent()
                        coinAnimation9()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin9" {
                        coin9.removeFromParent()
                        coinAnimation9()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //10
            if collision.matches(.player, .coinBody10) {
                    if contact.bodyA.node?.name == "Coin10" {
                        coin10.removeFromParent()
                        coinAnimation10()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin10" {
                        coin10.removeFromParent()
                        coinAnimation10()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //11
            if collision.matches(.player, .coinBody11) {
                    if contact.bodyA.node?.name == "Coin11" {
                        coin11.removeFromParent()
                        coinAnimation11()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin11" {
                        coin11.removeFromParent()
                        coinAnimation11()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //12
            if collision.matches(.player, .coinBody12) {
                    if contact.bodyA.node?.name == "Coin12" {
                        coin12.removeFromParent()
                        coinAnimation12()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin12" {
                        coin12.removeFromParent()
                        coinAnimation12()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //13
            if collision.matches(.player, .coinBody13) {
                    if contact.bodyA.node?.name == "Coin13" {
                        coin13.removeFromParent()
                        coinAnimation13()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin13" {
                        coin13.removeFromParent()
                        coinAnimation13()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //14
            if collision.matches(.player, .coinBody14) {
                    if contact.bodyA.node?.name == "Coin14" {
                        coin14.removeFromParent()
                        coinAnimation14()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin14" {
                        coin14.removeFromParent()
                        coinAnimation14()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
            //15
            if collision.matches(.player, .coinBody15) {
                    if contact.bodyA.node?.name == "Coin15" {
                        coin15.removeFromParent()
                        coinAnimation15()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    } else if contact.bodyB.node?.name == "Coin15" {
                        coin15.removeFromParent()
                        coinAnimation15()
                        if sound == true {
                            run(Sound.coins.action)
                        }
                        coinScore += 5
                    }
            }
        }
// Enemy/Arrow
            if collision.matches(.enemyBody1, .arrowBody) {
                    if contact.bodyA.node?.name == "Arrow" {
                        contact.bodyA.node?.removeFromParent()
                        enemy1?.removeAllActions()
                        contactAxePlayer = false
                        enemyStateMachine.enter(KillState.self)
                        enemyStateMachine.enter(KillGoblinState.self)
                        spawnKillSmokeEnemy1()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin1()
                        }
                    } else if contact.bodyB.node?.name == "Arrow" {
                        contact.bodyB.node?.removeFromParent()
                        enemy1?.removeAllActions()
                        contactAxePlayer = false
                        enemyStateMachine.enter(KillState.self)
                        enemyStateMachine.enter(KillGoblinState.self)
                        spawnKillSmokeEnemy1()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin1()
                        }
                    }
            }
            
            if collision.matches(.enemyBody2, .arrowBody) {
                    if contact.bodyA.node?.name == "Arrow" {
                        contact.bodyA.node?.removeFromParent()
                        enemy2?.removeAllActions()
                        contactAxePlayer2 = false
                        enemyStateMachine2.enter(KillGoblinState.self)
                        enemyStateMachine2.enter(KillState.self)
                        spawnKillSmokeEnemy2()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin2()
                        }
                    } else if contact.bodyB.node?.name == "Arrow" {
                        contact.bodyB.node?.removeFromParent()
                        enemy2?.removeAllActions()
                        contactAxePlayer2 = false
                        enemyStateMachine2.enter(KillGoblinState.self)
                        enemyStateMachine2.enter(KillState.self)
                        spawnKillSmokeEnemy2()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin2()
                        }
                }
            }
            
            if collision.matches(.enemyBody3, .arrowBody) {
                    if contact.bodyA.node?.name == "Arrow" {
                        contact.bodyA.node?.removeFromParent()
                        enemy3?.removeAllActions()
                        contactAxePlayer3 = false
                        enemyStateMachine3.enter(KillGoblinState.self)
                        enemyStateMachine3.enter(KillState.self)
                        spawnKillSmokeEnemy3()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin3()
                        }
                    } else if contact.bodyB.node?.name == "Arrow" {
                        contact.bodyB.node?.removeFromParent()
                        enemy3?.removeAllActions()
                        contactAxePlayer3 = false
                        enemyStateMachine3.enter(KillGoblinState.self)
                        enemyStateMachine3.enter(KillState.self)
                        spawnKillSmokeEnemy3()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin3()
                        }
                    }
            }

            if collision.matches(.enemyBody4, .arrowBody) {
                    if contact.bodyA.node?.name == "Arrow" {
                        contact.bodyA.node?.removeFromParent()
                        enemy4?.removeAllActions()
                        contactAxePlayer4 = false
                        enemyStateMachine4.enter(KillGoblinState.self)
                        enemyStateMachine4.enter(KillState.self)
                        spawnKillSmokeEnemy4()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin4()
                        }
                    } else if contact.bodyB.node?.name == "Arrow" {
                        contact.bodyB.node?.removeFromParent()
                        enemy4?.removeAllActions()
                        contactAxePlayer4 = false
                        enemyStateMachine4.enter(KillGoblinState.self)
                        enemyStateMachine4.enter(KillState.self)
                        spawnKillSmokeEnemy4()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin4()
                        }
                    }
            }
        
            if collision.matches(.enemyBody5, .arrowBody) {
                       if contact.bodyA.node?.name == "Arrow" {
                           contact.bodyA.node?.removeFromParent()
                           enemy5?.removeAllActions()
                           contactAxePlayer5 = false
                           enemyStateMachine5.enter(KillState.self)
                           enemyStateMachine5.enter(KillGoblinState.self)
                           spawnKillSmokeEnemy5()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin5()
                        }
                       } else if contact.bodyB.node?.name == "Arrow" {
                           contact.bodyB.node?.removeFromParent()
                           enemy5?.removeAllActions()
                           contactAxePlayer5 = false
                           enemyStateMachine5.enter(KillState.self)
                           enemyStateMachine5.enter(KillGoblinState.self)
                           spawnKillSmokeEnemy5()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin5()
                        }
                       }
               }
               
               if collision.matches(.enemyBody6, .arrowBody) {
                       if contact.bodyA.node?.name == "Arrow" {
                           contact.bodyA.node?.removeFromParent()
                           enemy6?.removeAllActions()
                           contactAxePlayer6 = false
                           enemyStateMachine6.enter(KillGoblinState.self)
                           enemyStateMachine6.enter(KillState.self)
                           spawnKillSmokeEnemy6()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin6()
                        }
                       } else if contact.bodyB.node?.name == "Arrow" {
                           contact.bodyB.node?.removeFromParent()
                           enemy6?.removeAllActions()
                           contactAxePlayer6 = false
                           enemyStateMachine6.enter(KillGoblinState.self)
                           enemyStateMachine6.enter(KillState.self)
                           spawnKillSmokeEnemy6()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin6()
                        }
                   }
               }
               
               if collision.matches(.enemyBody7, .arrowBody) {
                       if contact.bodyA.node?.name == "Arrow" {
                           contact.bodyA.node?.removeFromParent()
                           enemy7?.removeAllActions()
                           contactAxePlayer7 = false
                           enemyStateMachine7.enter(KillGoblinState.self)
                           enemyStateMachine7.enter(KillState.self)
                           spawnKillSmokeEnemy7()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin7()
                        }
                       } else if contact.bodyB.node?.name == "Arrow" {
                           contact.bodyB.node?.removeFromParent()
                           enemy7?.removeAllActions()
                           contactAxePlayer7 = false
                           enemyStateMachine7.enter(KillGoblinState.self)
                           enemyStateMachine7.enter(KillState.self)
                           spawnKillSmokeEnemy7()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin7()
                        }
                       }
               }

               if collision.matches(.enemyBody8, .arrowBody) {
                       if contact.bodyA.node?.name == "Arrow" {
                           contact.bodyA.node?.removeFromParent()
                           enemy8?.removeAllActions()
                           contactAxePlayer8 = false
                           enemyStateMachine8.enter(KillGoblinState.self)
                           enemyStateMachine8.enter(KillState.self)
                           spawnKillSmokeEnemy8()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin8()
                        }
                       } else if contact.bodyB.node?.name == "Arrow" {
                           contact.bodyB.node?.removeFromParent()
                           enemy8?.removeAllActions()
                           contactAxePlayer8 = false
                           enemyStateMachine8.enter(KillGoblinState.self)
                           enemyStateMachine8.enter(KillState.self)
                           spawnKillSmokeEnemy8()
                        if sound == true && levelNumber <= 30 {
                            self.run(Sound.killSkeleton.action)
                            self.run(Sound.arrowKill.action)
                        } else if sound == true && levelNumber >= 31 {
                            self.run(Sound.goblinKill.action)
                        }
                        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                            self.spawnCoin8()
                        }
                       }
               }
        
                if collision.matches(.enemyBody9, .arrowBody) {
                           if contact.bodyA.node?.name == "Arrow" {
                               contact.bodyA.node?.removeFromParent()
                               enemy9?.removeAllActions()
                               contactAxePlayer9 = false
                               enemyStateMachine9.enter(KillGoblinState.self)
                               enemyStateMachine9.enter(KillState.self)
                               spawnKillSmokeEnemy9()
                            if sound == true && levelNumber <= 30 {
                                self.run(Sound.killSkeleton.action)
                                self.run(Sound.arrowKill.action)
                            } else if sound == true && levelNumber >= 31 {
                                self.run(Sound.goblinKill.action)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                self.spawnCoin9()
                            }
                           } else if contact.bodyB.node?.name == "Arrow" {
                               contact.bodyB.node?.removeFromParent()
                               enemy9?.removeAllActions()
                               contactAxePlayer9 = false
                               enemyStateMachine9.enter(KillGoblinState.self)
                               enemyStateMachine9.enter(KillState.self)
                               spawnKillSmokeEnemy9()
                            if sound == true && levelNumber <= 30 {
                                self.run(Sound.killSkeleton.action)
                                self.run(Sound.arrowKill.action)
                            } else if sound == true && levelNumber >= 31 {
                                self.run(Sound.goblinKill.action)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                self.spawnCoin9()
                            }
                       }
                   }
                   
                   if collision.matches(.enemyBody10, .arrowBody) {
                           if contact.bodyA.node?.name == "Arrow" {
                               contact.bodyA.node?.removeFromParent()
                               enemy10?.removeAllActions()
                               contactAxePlayer10 = false
                               enemyStateMachine10.enter(KillGoblinState.self)
                               enemyStateMachine10.enter(KillState.self)
                               spawnKillSmokeEnemy10()
                            if sound == true && levelNumber <= 30 {
                                self.run(Sound.killSkeleton.action)
                                self.run(Sound.arrowKill.action)
                            } else if sound == true && levelNumber >= 31 {
                                self.run(Sound.goblinKill.action)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                self.spawnCoin10()
                            }
                           } else if contact.bodyB.node?.name == "Arrow" {
                               contact.bodyB.node?.removeFromParent()
                               enemy10?.removeAllActions()
                               contactAxePlayer10 = false
                               enemyStateMachine10.enter(KillGoblinState.self)
                               enemyStateMachine10.enter(KillState.self)
                               spawnKillSmokeEnemy10()
                            if sound == true && levelNumber <= 30 {
                                self.run(Sound.killSkeleton.action)
                                self.run(Sound.arrowKill.action)
                            } else if sound == true && levelNumber >= 31 {
                                self.run(Sound.goblinKill.action)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                self.spawnCoin10()
                            }
                           }
                   }

                   if collision.matches(.enemyBody11, .arrowBody) {
                           if contact.bodyA.node?.name == "Arrow" {
                               contact.bodyA.node?.removeFromParent()
                               enemy11?.removeAllActions()
                               contactAxePlayer11 = false
                               enemyStateMachine11.enter(KillGoblinState.self)
                               enemyStateMachine11.enter(KillState.self)
                               spawnKillSmokeEnemy11()
                            if sound == true && levelNumber <= 30 {
                                self.run(Sound.killSkeleton.action)
                                self.run(Sound.arrowKill.action)
                            } else if sound == true && levelNumber >= 31 {
                                self.run(Sound.goblinKill.action)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                self.spawnCoin11()
                            }
                           } else if contact.bodyB.node?.name == "Arrow" {
                               contact.bodyB.node?.removeFromParent()
                               enemy11?.removeAllActions()
                               contactAxePlayer11 = false
                               enemyStateMachine11.enter(KillGoblinState.self)
                               enemyStateMachine11.enter(KillState.self)
                               spawnKillSmokeEnemy11()
                            if sound == true && levelNumber <= 30 {
                                self.run(Sound.killSkeleton.action)
                                self.run(Sound.arrowKill.action)
                            } else if sound == true && levelNumber >= 31 {
                                self.run(Sound.goblinKill.action)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                self.spawnCoin11()
                            }
                           }
                   }
                   
                   if collision.matches(.enemyBody12, .arrowBody) {
                              if contact.bodyA.node?.name == "Arrow" {
                                  contact.bodyA.node?.removeFromParent()
                                  enemy12?.removeAllActions()
                                  contactAxePlayer12 = false
                                  enemyStateMachine12.enter(KillState.self)
                                  enemyStateMachine12.enter(KillGoblinState.self)
                                  spawnKillSmokeEnemy12()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin12()
                                }
                              } else if contact.bodyB.node?.name == "Arrow" {
                                  contact.bodyB.node?.removeFromParent()
                                  enemy12?.removeAllActions()
                                  contactAxePlayer12 = false
                                  enemyStateMachine12.enter(KillState.self)
                                  enemyStateMachine12.enter(KillGoblinState.self)
                                  spawnKillSmokeEnemy12()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin12()
                                }
                              }
                      }
                      
                      if collision.matches(.enemyBody13, .arrowBody) {
                              if contact.bodyA.node?.name == "Arrow" {
                                  contact.bodyA.node?.removeFromParent()
                                  enemy13?.removeAllActions()
                                  contactAxePlayer13 = false
                                  enemyStateMachine13.enter(KillGoblinState.self)
                                  enemyStateMachine13.enter(KillState.self)
                                  spawnKillSmokeEnemy13()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin13()
                                }
                              } else if contact.bodyB.node?.name == "Arrow" {
                                  contact.bodyB.node?.removeFromParent()
                                  enemy13?.removeAllActions()
                                  contactAxePlayer13 = false
                                  enemyStateMachine13.enter(KillGoblinState.self)
                                  enemyStateMachine13.enter(KillState.self)
                                  spawnKillSmokeEnemy13()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin13()
                                }
                          }
                      }
                      
                      if collision.matches(.enemyBody14, .arrowBody) {
                              if contact.bodyA.node?.name == "Arrow" {
                                  contact.bodyA.node?.removeFromParent()
                                  enemy14?.removeAllActions()
                                  contactAxePlayer14 = false
                                  enemyStateMachine14.enter(KillGoblinState.self)
                                  enemyStateMachine14.enter(KillState.self)
                                  spawnKillSmokeEnemy14()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin14()
                                }
                              } else if contact.bodyB.node?.name == "Arrow" {
                                  contact.bodyB.node?.removeFromParent()
                                  enemy14?.removeAllActions()
                                  contactAxePlayer14 = false
                                  enemyStateMachine14.enter(KillGoblinState.self)
                                  enemyStateMachine14.enter(KillState.self)
                                  spawnKillSmokeEnemy14()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin14()
                                }
                              }
                      }

                      if collision.matches(.enemyBody15, .arrowBody) {
                              if contact.bodyA.node?.name == "Arrow" {
                                  contact.bodyA.node?.removeFromParent()
                                  enemy15?.removeAllActions()
                                  contactAxePlayer15 = false
                                  enemyStateMachine15.enter(KillGoblinState.self)
                                  enemyStateMachine15.enter(KillState.self)
                                  spawnKillSmokeEnemy15()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin15()
                                }
                              } else if contact.bodyB.node?.name == "Arrow" {
                                  contact.bodyB.node?.removeFromParent()
                                  enemy15?.removeAllActions()
                                  contactAxePlayer15 = false
                                  enemyStateMachine15.enter(KillGoblinState.self)
                                  enemyStateMachine15.enter(KillState.self)
                                  spawnKillSmokeEnemy15()
                                if sound == true && levelNumber <= 30 {
                                    self.run(Sound.killSkeleton.action)
                                    self.run(Sound.arrowKill.action)
                                } else if sound == true && levelNumber >= 31 {
                                    self.run(Sound.goblinKill.action)
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                                    self.spawnCoin15()
                                }
                              }
                      }
// Big/Skeleton
                    if collision.matches(.bigSkeleton, .player) {
                            if contact.bodyA.node?.name == "BigSkeleton" {
                                score += 1
                            } else if contact.bodyB.node?.name == "BigSkeleton" {
                                score += 1
                            }
                    }
                    if collision.matches(.positionEndLevel30, .player) {
                            if contact.bodyA.node?.name == "positionEndLevel30" {
                                
                                if contactPosition30Player == false {
                                    spawnBigSkeleton()
                                }
                                contactPosition30Player = true
                            } else if contact.bodyB.node?.name == "positionEndLevel30" {
                                
                                if contactPosition30Player == false {
                                    spawnBigSkeleton()
                                }
                                contactPosition30Player = true
                            }
                    }
//Big/Goblin
                    if collision.matches(.bigGoblin, .player) {
                            if contact.bodyA.node?.name == "BigGoblin" {
                                score += 1
                            } else if contact.bodyB.node?.name == "BigGoblin" {
                                score += 1
                            }
                    }
                    if collision.matches(.bigAxe, .player) {
                            if contact.bodyA.node?.name == "BigAxe" {
                                contact.bodyA.node?.removeFromParent()
                                score += 1
                                player?.removeFromParent()
                                spawnAnimationKillWoodman()
                            } else if contact.bodyB.node?.name == "BigAxe" {
                                contact.bodyB.node?.removeFromParent()
                                score += 1
                                player?.removeFromParent()
                                spawnAnimationKillWoodman()
                            }
                    }
                    if collision.matches(.positionEndLevel60, .player) {
                            if contact.bodyA.node?.name == "positionEndLevel60" {
                                
                                if contactPosition60Player == false {
                                    spawnBigGoblin()
                                    actionBigAxe()
                                }
                                contactPosition60Player = true
                            } else if contact.bodyB.node?.name == "positionEndLevel60" {
                                if contactPosition60Player == false {
                                    
                                    spawnBigGoblin()
                                    actionBigAxe()
                                }
                                contactPosition60Player = true
                            }
                    }
    }
}
extension GameScene {
// MARK:- CaveFireTorch
    func spawnTorch1() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch1!.position.x, y: torch1!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch2() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch2!.position.x, y: torch2!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch3() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch3!.position.x, y: torch3!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch4() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch4!.position.x, y: torch4!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch5() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch5!.position.x, y: torch5!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch6() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch6!.position.x, y: torch6!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch7() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch7!.position.x, y: torch7!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch8() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch8!.position.x, y: torch8!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch9() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch9!.position.x, y: torch9!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch10() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch10!.position.x, y: torch10!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch11() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch11!.position.x, y: torch11!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch12() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch12!.position.x, y: torch12!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch13() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch13!.position.x, y: torch13!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch14() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch14!.position.x, y: torch14!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch15() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch15!.position.x, y: torch15!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch16() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch16!.position.x, y: torch16!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch17() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch17!.position.x, y: torch17!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch18() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch18!.position.x, y: torch18!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch19() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch19!.position.x, y: torch19!.position.y + 20)
        addChild(pud1)
    }
    func spawnTorch20() {
        let pud1 = SKEmitterNode(fileNamed: "FireTorch.sks")!
        pud1.zPosition = 1
        pud1.position = CGPoint(x: torch20!.position.x, y: torch20!.position.y + 20)
        addChild(pud1)
    }
    
// MARK:- ButtonBigSkeleton
        func spawnPositionLevel30() {
            let position = SKSpriteNode(imageNamed: "box")
            position.name = "positionEndLevel30"
            position.xScale = 0.8
            position.yScale = 0.1
            position.alpha = 0
            position.position = CGPoint(x: CGFloat(14080), y: CGFloat(-20))
            addChild(position)
            
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "box"), size: position.size)
            position.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.positionEndLevel30.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask
            
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        }
//MARK: - SpawnBigSkeleton
        func spawnBigSkeleton() {
            let skeleton = SKSpriteNode(imageNamed: "skeleton/0")
            skeleton.name = "BigSkeleton"
            skeleton.xScale = 0.75
            skeleton.yScale = 0.7
            skeleton.zPosition = 30
            skeleton.position = CGPoint(x: CGFloat(15040), y: CGFloat(160))
            addChild(skeleton)
            
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "skeleton/0"), size: skeleton.size)
            skeleton.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.bigSkeleton.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
            
            var textures: [SKTexture] = []
            for i in 0...9 {
                textures.append(SKTexture(imageNamed: "skeleton/\(i)"))
            }

            let animation = SKAction.animate(with: textures, timePerFrame: 0.1)
            let repeatAnimation = SKAction.repeat(animation, count: 100)
            skeleton.run(SKAction.sequence([repeatAnimation]))
            
            
            let walkAction = SKAction.applyImpulse(CGVector(dx: 100, dy: 0), duration: 0.5)
            let repeatWalk = SKAction.repeat(walkAction, count: 81)
            
            let scaleX = SKAction.scaleX(to: -0.2, duration: 0.001)
            let scaleXPlus = SKAction.scaleX(to: 0.2, duration: 0.001)
            
            let walkActionBack = SKAction.applyImpulse(CGVector(dx: -100, dy: 0), duration: 0.5)
            let repeatWalkBack = SKAction.repeat(walkActionBack, count: 81)

            let groupAction = SKAction.sequence([repeatWalk, scaleX, repeatWalkBack, scaleXPlus])
            let fullRepeat = SKAction.repeatForever(groupAction)
            skeleton.run(SKAction.sequence([fullRepeat]))
        }
// MARK:- ButtonBigGoblin
        func spawnPositionLevel60() {
            let position = SKSpriteNode(imageNamed: "box")
            position.name = "positionEndLevel60"
            position.xScale = 0.8
            position.yScale = 0.1
            position.zRotation = 0.1
            position.alpha = 0
            position.position = CGPoint(x: CGFloat(18650), y: CGFloat(-110))
            addChild(position)
            
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "box"), size: position.size)
            position.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.positionEndLevel60.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask
            
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        }
//MARK: - SpawnBigGoblin
        func spawnBigGoblin() {
//            let bigGoblin = SKSpriteNode(imageNamed: "goblin/6")
            bigGoblin.name = "BigGoblin"
            bigGoblin.xScale = -0.75
            bigGoblin.yScale = 0.7
            bigGoblin.zPosition = 30
            bigGoblin.position = CGPoint(x: CGFloat(18880), y: CGFloat(160))
            addChild(bigGoblin)
            
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "goblin/6"), size: bigGoblin.size)
            bigGoblin.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.bigGoblin.bitmask
            physicsBody.collisionBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.ground.bitmask | Collision.Masks.player.bitmask
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = false
            
            var textures: [SKTexture] = []
            for i in 6...34 {
                textures.append(SKTexture(imageNamed: "goblin/\(i)"))
            }

            let animation = SKAction.animate(with: textures, timePerFrame: 0.1)
            let repeatAnimation = SKAction.repeat(animation, count: 100)
            bigGoblin.run(SKAction.sequence([repeatAnimation]))
            
            
            let portal = SKSpriteNode(imageNamed: "portal2")
            portal.name = "Portal"
            portal.setScale(1.0)
            portal.position = CGPoint(x: 18880, y: 170)
            portal.zPosition = 29
            addChild(portal)

            let appear = SKAction.scale(to: 2.0, duration: 0.2)
            let disappear = SKAction.scale(to: 0, duration: 0.5)

            portal.run(SKAction.sequence([appear, disappear]))
        }
        func spawnBigAxe() {
            let axe  = SKSpriteNode(imageNamed: "axe")
            axe.name = "BigAxe"
            axe.setScale(1.0)
            axe.position = CGPoint(x: bigGoblin.position.x - 20, y: bigGoblin.position.y - 5)
            axe.zPosition = 1
            addChild(axe)
            
            let action = CGVector(dx: -30, dy: 0)
            let impulse = SKAction.applyImpulse(action, duration: 1.2)
            let rotate = SKAction.rotate(byAngle: 10, duration: 1.4)
            let group = SKAction.group([impulse,rotate])
            let remove = SKAction.removeFromParent()
            let sequence = SKAction.sequence([group, remove])
            axe.run(SKAction.sequence([sequence]))
            
            let physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "axe"), size: axe.size)
            axe.physicsBody = physicsBody
            physicsBody.categoryBitMask = Collision.Masks.bigAxe.bitmask
            physicsBody.collisionBitMask = Collision.Masks.player.bitmask
            physicsBody.contactTestBitMask = Collision.Masks.player.bitmask
            physicsBody.fieldBitMask = Collision.Masks.player.bitmask

            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
        }
        func actionBigAxe() {
            var animationInterval2: Int = 0
            
            run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
            animationInterval2 += 1
                if animationInterval2 == 10 {
            self!.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(){ [weak self] in
                        self!.spawnBigAxe()
                }, SKAction.wait(forDuration: 2.8)])))
                }
            }, SKAction.wait(forDuration: 0.1)]), count: 10))
        }
}

