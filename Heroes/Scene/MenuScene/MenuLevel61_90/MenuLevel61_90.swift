//
//  MenuLevel1_30.swift
//  Trio Of Heroes
//
//  Created by mac on 28.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit
import SpriteKit

@available(iOS 11.0, *)
class MenuLevel61_90: GameScene {
    
    let centreView = UIView()
    var screenLoad: Bool = false
    
    override func didMove(to view: SKView) {
        
        if backgroundMusic == true {
            if menuMusicOn == false {
                playBackgroundMenuMusic(fileName: "backMusicMenu.mp3")
                
                UserDefaults.standard.set(true, forKey: "menuMusicOn")
            }
        }
        
        if noMoreBonusJump == true {
            spawnNotificationNoMoreBonus()
            UserDefaults.standard.set(false, forKey: "noMoreBonusHeart")
            UserDefaults.standard.set(false, forKey: "noMoreBonus2Heart")
        } else {
            if noMoreBonusHeart == true {
                spawnNotificationNoMoreBonus()
            }
            if noMoreBonus2Heart == true {
                spawnNotificationNoMoreBonus()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            self.screenLoad = true
        }
        
        spawnBackground()
        closeButton()
        spawnLevelButton()
        spawnArrowUI()
        swipe()
        labenInTheWork()
    }

//MARK: - Swipe
    func swipe() {
        centreView.backgroundColor = UIColor.clear
        centreView.frame = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        self.view?.addSubview(centreView)
        
        let swipeLeft = UISwipeGestureRecognizer()
        let swipeRight = UISwipeGestureRecognizer()
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        self.centreView.addGestureRecognizer(swipeRight)
        self.centreView.addGestureRecognizer(swipeLeft)
        
        swipeLeft.addTarget(self, action: #selector(swipe(sender:)))
        swipeRight.addTarget(self, action: #selector(swipe(sender:)))
    }
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            upLeft()
        case .right:
            upRight()
        default:
            print("")
        }
    }
    
    func upRight() {
        if screenLoad == true {
//            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
        let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
        
        let transition = SKTransition.push(with: .right, duration: 1.0)
        scene!.scaleMode = .aspectFill
        self.view?.presentScene(scene!, transition: transition)
//            }
        centreView.isHidden = true
        }
    }
    func upLeft() {
        
    }
//MARK: - NoMoreBonusJump
    func spawnNotificationNoMoreBonus() {
        let backPanel = SKSpriteNode(imageNamed: "windowBackground")
        backPanel.zPosition = 15
        backPanel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backPanel.xScale = 0.6
        backPanel.yScale = 0.6
        backPanel.alpha = 0
        addChild(backPanel)
        
        let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
        let Increase = SKAction.scale(to: 0.8, duration: 0.2)
        let group = SKAction.group([alphaTo, Increase])
        backPanel.run(SKAction.sequence([group]))
        
        let backgroundPanel = SKSpriteNode(imageNamed: "dialogueBackgroundBlack")
        backgroundPanel.zPosition = 14
        backgroundPanel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundPanel.xScale = 15
        backgroundPanel.yScale = 15
        backgroundPanel.alpha = 0.1
        backPanel.addChild(backgroundPanel)
        
        //Close
        var closeButton: SKButton!
        closeButton = SKButton(imageName: "cancelWhite", buttonAction: {
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            
            let appear = SKAction.scale(to: 0.9, duration: 0.2)
            
            let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let reduce = SKAction.scale(to: 0.6, duration: 0.3)
            let group = SKAction.group([alphaTo, reduce])
            let remove = SKAction.removeFromParent()
            
            backPanel.run(SKAction.sequence([appear, group, remove]))
        })
        closeButton.position = CGPoint(x: CGFloat(200), y: CGFloat(100))
        closeButton.zPosition = 16
        closeButton.setScale(0.5)
        backPanel.addChild(closeButton)
        
        let labelNoMoreJump = SKLabelNode(fontNamed: "Antikvar Shadow")
        labelNoMoreJump.position = CGPoint(x: CGFloat(0), y: CGFloat(20))
        labelNoMoreJump.zPosition = 16
        labelNoMoreJump.fontColor = .white
        labelNoMoreJump.fontSize = 35
        labelNoMoreJump.text = NSLocalizedString("Упс... бонус закончился!", comment: "Упс... бонус закончился!")
        backPanel.addChild(labelNoMoreJump)
        
        //ButtonBonusJump
        if noMoreBonusJump == true {
            
            UserDefaults.standard.set(false, forKey: "noMoreBonusJump")
            
        let buyAnotherBonusButton = SKButton(imageName: "bonusJumpButtonTable", buttonAction: {
            
            let totalCoinDefault = UserDefaults.standard
            self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
            
             if self.coinGame >= 1200 && self.bonusJumpScore <= 0 {
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
                
                self.spawnActionBuyJumpBonus()
                
                let totalCoinDefault = UserDefaults.standard
                self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
                
                self.coinGame -= 1200
                totalCoinDefault.setValue(self.coinGame, forKey: "Totalcoin")
                totalCoinDefault.synchronize()
                
                UserDefaults.standard.set(true, forKey: "bonusJump")
                UserDefaults.standard.set(5, forKey: "bonusJumpScore")
                self.bonusJumpScore = 5
                
                backPanel.removeFromParent()
            } else {
                if self.sound == true {
                    self.run(Sound.close.action)
                }
            }
        })
        buyAnotherBonusButton.position = CGPoint(x: CGFloat(0), y: CGFloat(-60))
        buyAnotherBonusButton.setScale(0.4)
        buyAnotherBonusButton.zPosition = 16
        backPanel.addChild(buyAnotherBonusButton)
        let scoreBonusJumpLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
         scoreBonusJumpLabel.position = CGPoint(x: CGFloat(-30), y: CGFloat(-140))
         scoreBonusJumpLabel.text = "1200"
         scoreBonusJumpLabel.zPosition = 17
         scoreBonusJumpLabel.fontColor = .white
         scoreBonusJumpLabel.fontSize = 60
        buyAnotherBonusButton.addChild(scoreBonusJumpLabel)
        let imageScoreBonusJumpLabel = SKSpriteNode(imageNamed: "coin/21")
         imageScoreBonusJumpLabel.position = CGPoint(x: CGFloat(50), y: CGFloat(0))
         imageScoreBonusJumpLabel.setScale(1.4)
         imageScoreBonusJumpLabel.zPosition = 17
        buyAnotherBonusButton.addChild(imageScoreBonusJumpLabel)
        } else {
        
        //ButtonBonusHeart
        if noMoreBonusHeart == true {
            UserDefaults.standard.set(false, forKey: "noMoreBonusHeart")
        let buyAnotherBonusButton = SKButton(imageName: "bonusButtonHeartTable", buttonAction: {
            
            let totalCoinDefault = UserDefaults.standard
            self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
            
             if self.coinGame >= 800 && self.bonusHeartScore <= 0 {
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
                self.spawnActionBuyHeartBonus()
                
                let totalCoinDefault = UserDefaults.standard
                self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
                
                self.coinGame -= 800
                totalCoinDefault.setValue(self.coinGame, forKey: "Totalcoin")
                totalCoinDefault.synchronize()
                
                 UserDefaults.standard.set(true, forKey: "bonusHeart")
                 UserDefaults.standard.set(5, forKey: "bonusHeartScore")
                 self.bonusHeartScore = 5
                
                 if self.bonus2HeartScore >= 1 {
                     UserDefaults.standard.set(false, forKey: "bonus2Heart")
                     UserDefaults.standard.set(0, forKey: "bonus2HeartScore")
                     self.bonus2HeartScore = 0
                 }
                backPanel.removeFromParent()
            } else {
                if self.sound == true {
                    self.run(Sound.close.action)
                }
            }
            
        })
        buyAnotherBonusButton.position = CGPoint(x: CGFloat(0), y: CGFloat(-60))
        buyAnotherBonusButton.setScale(0.4)
        buyAnotherBonusButton.zPosition = 16
        backPanel.addChild(buyAnotherBonusButton)
        let scoreBonus4HeartLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
         scoreBonus4HeartLabel.position = CGPoint(x: CGFloat(-30), y: CGFloat(-140))
         scoreBonus4HeartLabel.text = "800"
         scoreBonus4HeartLabel.zPosition = 17
         scoreBonus4HeartLabel.fontColor = .white
         scoreBonus4HeartLabel.fontSize = 60
        buyAnotherBonusButton.addChild(scoreBonus4HeartLabel)
        let imageScoreBonus4HeartLabel = SKSpriteNode(imageNamed: "coin/21")
         imageScoreBonus4HeartLabel.position = CGPoint(x: CGFloat(50), y: CGFloat(0))
         imageScoreBonus4HeartLabel.setScale(1.4)
         imageScoreBonus4HeartLabel.zPosition = 17
        buyAnotherBonusButton.addChild(imageScoreBonus4HeartLabel)
        }
        
        //ButtonBonus2Heart
        if noMoreBonus2Heart == true {
            UserDefaults.standard.set(false, forKey: "noMoreBonus2Heart")
        let buyAnotherBonusButton = SKButton(imageName: "bonusButton2HeartTable", buttonAction: {
            
            let totalCoinDefault = UserDefaults.standard
            self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
            
             if self.coinGame >= 1000 && self.bonus2HeartScore <= 0 {
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
                
                self.spawnActionBuy2HeartBonus()
                
                let totalCoinDefault = UserDefaults.standard
                self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
                
                self.coinGame -= 1000
                totalCoinDefault.setValue(self.coinGame, forKey: "Totalcoin")
                totalCoinDefault.synchronize()
                
                 UserDefaults.standard.set(true, forKey: "bonus2Heart")
                 UserDefaults.standard.set(5, forKey: "bonus2HeartScore")
                 self.bonus2HeartScore = 5
             
                 if self.bonusHeartScore >= 1 {
                     UserDefaults.standard.set(false, forKey: "bonusHeart")
                     UserDefaults.standard.set(0, forKey: "bonusHeartScore")
                     self.bonusHeartScore = 0
                 }
                backPanel.removeFromParent()
                
            } else {
                if self.sound == true {
                    self.run(Sound.close.action)
                }
            }
            
        })
        buyAnotherBonusButton.position = CGPoint(x: CGFloat(0), y: CGFloat(-60))
        buyAnotherBonusButton.setScale(0.4)
        buyAnotherBonusButton.zPosition = 16
        backPanel.addChild(buyAnotherBonusButton)
        let scoreBonus5HeartLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
         scoreBonus5HeartLabel.position = CGPoint(x: CGFloat(-30), y: CGFloat(-140))
         scoreBonus5HeartLabel.text = "1000"
         scoreBonus5HeartLabel.zPosition = 17
         scoreBonus5HeartLabel.fontColor = .white
         scoreBonus5HeartLabel.fontSize = 60
        buyAnotherBonusButton.addChild(scoreBonus5HeartLabel)
        let imageScoreBonus5HeartLabel = SKSpriteNode(imageNamed: "coin/21")
         imageScoreBonus5HeartLabel.position = CGPoint(x: CGFloat(50), y: CGFloat(0))
         imageScoreBonus5HeartLabel.setScale(1.4)
         imageScoreBonus5HeartLabel.zPosition = 17
        buyAnotherBonusButton.addChild(imageScoreBonus5HeartLabel)
            }
        }
    }
    //MARK: - ActionBuyBonus
        func spawnActionBuyJumpBonus() {
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.bonus.action)
                }
            }
            
            let image = SKSpriteNode(imageNamed: "imageBonusJump")
            image.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            image.zPosition = 300
            image.setScale(0.1)
            addChild(image)
            
            let appear = SKAction.scale(to: 1.0, duration: 1.2)

            let leftWiggle = SKAction.rotate(byAngle: 18.86, duration: 0.5)
            
            let group = SKAction.group([leftWiggle, appear])

            let disappear = SKAction.scale(to: 0, duration: 0.5)
            let removeFromParent = SKAction.removeFromParent()
            let actions = [group, disappear, removeFromParent]
            image.run(SKAction.sequence(actions))
        }
        func spawnActionBuyHeartBonus() {
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.bonus.action)
                }
            }
            
            let image = SKSpriteNode(imageNamed: "imageBonusHeart")
            image.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            image.zPosition = 300
            image.setScale(0.1)
            addChild(image)
            
            let appear = SKAction.scale(to: 1.0, duration: 1.2)

            let leftWiggle = SKAction.rotate(byAngle: 18.86, duration: 0.5)
            
            let group = SKAction.group([leftWiggle, appear])

            let disappear = SKAction.scale(to: 0, duration: 0.5)
            let removeFromParent = SKAction.removeFromParent()
            let actions = [group, disappear, removeFromParent]
            image.run(SKAction.sequence(actions))
        }
        func spawnActionBuy2HeartBonus() {
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.bonus.action)
                }
            }
            
            let image = SKSpriteNode(imageNamed: "imageBonus2Heart")
            image.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            image.zPosition = 300
            image.setScale(0.1)
            addChild(image)
            
            let appear = SKAction.scale(to: 1.0, duration: 1.2)

            let leftWiggle = SKAction.rotate(byAngle: 18.87, duration: 0.5)
            
            let group = SKAction.group([leftWiggle, appear])

            let disappear = SKAction.scale(to: 0, duration: 0.5)
            let removeFromParent = SKAction.removeFromParent()
            let actions = [group, disappear, removeFromParent]
            image.run(SKAction.sequence(actions))
        }
//MARK: - Background
    func spawnBackground() {
        
        var size: CGFloat!
        if totalSize.width >= 1000 {
            size = 0.9
        } else if totalSize.width >= 800 {
            size = 0.9
        } else {
            size = 1.02
        }
        
            let background = SKSpriteNode(imageNamed: "snowBackgroundLevel")
            background.setScale(size)
            background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            background.zPosition = 0
            addChild(background)
    }
//MARK: - CloseButton
        func closeButton() {
            
            var positionX: CGFloat!
            var positionY: CGFloat!
             if totalSize.width >= 800 {
                positionX = 330
                positionY = 140
            } else {
                positionX = 340
                positionY = 180
            }
            
            let close = SKButton(imageName: "cancelWhite", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                let scene = MenuScene(fileNamed: "MenuScene")
                let transation = SKTransition.fade(withDuration: 1.0)
                
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
            })
            close.setScale(0.5)
            close.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY + positionY)
            close.zPosition = 11
            addChild(close)
        }
//MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        if levelNumber >= 1 && levelNumber <= 90 {
        centreView.isHidden = true
        }
    }
//MARK: - ArrowNextScreen
        func spawnArrowUI() {
            
            var positionX: CGFloat!
            var positionY: CGFloat!
             if totalSize.width >= 800 {
                positionX = 340
                positionY = 140
            } else {
                positionX = 340
                positionY = 180
            }
            
            let arrow2 = SKSpriteNode(imageNamed: "arrowNext")
            arrow2.setScale(-0.8)
            arrow2.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY - positionY)
            arrow2.zPosition = 11
            arrow2.alpha = 0.5
            addChild(arrow2)
        }
    func labenInTheWork() {
        
        let panelBuyCoin = SKSpriteNode(imageNamed: "windowBackground")
        panelBuyCoin.zPosition = 15
        panelBuyCoin.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        panelBuyCoin.xScale = 0.4
        panelBuyCoin.yScale = 0.4
        panelBuyCoin.alpha = 1
        addChild(panelBuyCoin)
        
        switch Locale.current.languageCode {
        case "ru":
        let lbl = SKLabelNode(fontNamed: "Antikvar Shadow")
        lbl.position = CGPoint(x: CGFloat(0), y: CGFloat(-15))
        lbl.text = "в работе"
        lbl.zPosition = 40
        lbl.fontColor = .white
        lbl.fontSize = 80
            panelBuyCoin.addChild(lbl)
        default:
        let lbl = SKLabelNode(fontNamed: "Antikvar Shadow")
        lbl.position = CGPoint(x: CGFloat(0), y: CGFloat(-15))
        lbl.text = "in the work"
        lbl.zPosition = 40
        lbl.fontColor = .white
        lbl.fontSize = 80
            panelBuyCoin.addChild(lbl)
        }
    }
//MARK: - ButtonLevel_Screen > 800
        func spawnLevelButton() {
            
            if totalSize.width >= 800 {
            //1
                if winLevel60 == true {
                if winLevel61 == false {
                    let level1 = SKButton(imageName: "buttonLevel", buttonAction: {
                        if self.sound == true {
                            self.run(Sound.close.action)
                        }
                    })
                    level1.setScale(0.35)
                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
                    level1.zPosition = 11
                    addChild(level1)
//                    let level1 = SKButton(imageName: "buttonLevel/61", buttonAction: {
//
//                        if self.sound == true {
//                            self.run(Sound.pop.action)
//                        }
//
//                            UserDefaults.standard.set(61, forKey: "levelNumber")
//
//                            let scene = Level61(fileNamed: "Level61")
//                            let transation = SKTransition.fade(withDuration: 1.0)
//
//                            scene!.scaleMode = .aspectFill
//                            self.view?.presentScene(scene!, transition: transation)
//                            self.centreView.removeFromSuperview()
//
//                    })
//                    level1.setScale(0.35)
//                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
//                    level1.zPosition = 11
//                    addChild(level1)
                } else if winLevel61 == true {
                    let level1 = SKButton(imageName: "buttonLevelWin/61", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(61, forKey: "levelNumber")
                        
                        let scene = Level61(fileNamed: "Level61")
                        let transation = SKTransition.fade(withDuration: 1.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level1.setScale(0.35)
                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
                    level1.zPosition = 11
                    addChild(level1)
                    
                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level1.position.x, y: level1.position.y - 5)
                    addChild(cloud)
                }
                } else if winLevel60 == false {
                    let level1 = SKButton(imageName: "buttonLevel", buttonAction: {
                        if self.sound == true {
                            self.run(Sound.close.action)
                        }
                    })
                    level1.setScale(0.35)
                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
                    level1.zPosition = 11
                    addChild(level1)
                }
            
            
            //2
            if winLevel61 == true {
                if winLevel62 == false {
                let level2 = SKButton(imageName: "buttonLevel/62", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(62, forKey: "levelNumber")
//
//                        let scene = Level62(fileNamed: "Level62")
//                        let transation = SKTransition.fade(withDuration: 21.00)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level2.setScale(0.35)
                level2.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY + 100)
                level2.zPosition = 11
                addChild(level2)
                } else if winLevel62 == true {
                    let level2 = SKButton(imageName: "buttonLevelWin/62", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(62, forKey: "levelNumber")
//
//                        let scene = Level62(fileNamed: "Level62")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level2.setScale(0.35)
                    level2.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY + 100)
                    level2.zPosition = 11
                    addChild(level2)
                    
                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level2.position.x, y: level2.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel61 == false {
                let level2 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level2.setScale(0.35)
                level2.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY + 100)
                level2.zPosition = 11
                addChild(level2)
            }
            
            //3
            if winLevel62 == true {
                if winLevel63 == false {
                let level3 = SKButton(imageName: "buttonLevel/63", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(63, forKey: "levelNumber")
//
//                    let scene = Level63(fileNamed: "Level63")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level3.setScale(0.35)
                level3.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 100)
                level3.zPosition = 11
                addChild(level3)
                } else if winLevel63 == true {
                let level3 = SKButton(imageName: "buttonLevelWin/63", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(63, forKey: "levelNumber")
//
//                    let scene = Level63(fileNamed: "Level63")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level3.setScale(0.35)
                level3.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 100)
                level3.zPosition = 11
                addChild(level3)
                    
                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level3.position.x, y: level3.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel62 == false {
                let level3 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level3.setScale(0.35)
                level3.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 100)
                level3.zPosition = 11
                addChild(level3)
            }
            
            //4
            if winLevel63 == true {
                if winLevel64 == false {
                let level4 = SKButton(imageName: "buttonLevel/64", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(64, forKey: "levelNumber")
//
//                        let scene = Level64(fileNamed: "Level64")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level4.setScale(0.35)
                level4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 100)
                level4.zPosition = 11
                addChild(level4)
                } else if winLevel64 == true {
                    let level4 = SKButton(imageName: "buttonLevelWin/64", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(64, forKey: "levelNumber")
//
//                        let scene = Level64(fileNamed: "Level64")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level4.setScale(0.35)
                    level4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 100)
                    level4.zPosition = 11
                    addChild(level4)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level4.position.x, y: level4.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel63 == false {
                let level4 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level4.setScale(0.35)
                level4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 100)
                level4.zPosition = 11
                addChild(level4)
            }


            //5
            if winLevel64 == true {
                if winLevel65 == false {
                let level5 = SKButton(imageName: "buttonLevel/65", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(65, forKey: "levelNumber")
//
//                        let scene = Level65(fileNamed: "Level65")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                        
                    
                })
                level5.setScale(0.35)
                level5.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY + 100)
                level5.zPosition = 11
                addChild(level5)
                } else if winLevel65 == true {
                    let level5 = SKButton(imageName: "buttonLevelWin/65", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(65, forKey: "levelNumber")
//
//                        let scene = Level65(fileNamed: "Level65")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level5.setScale(0.35)
                    level5.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY + 100)
                    level5.zPosition = 11
                    addChild(level5)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level5.position.x, y: level5.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel64 == false {
                let level5 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level5.setScale(0.35)
                level5.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY + 100)
                level5.zPosition = 11
                addChild(level5)
            }


            //6
            if winLevel65 == true {
                if winLevel66 == false {
                let level6 = SKButton(imageName: "buttonLevel/66", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(66, forKey: "levelNumber")
//
//                    let scene = Level66(fileNamed: "Level66")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level6.setScale(0.35)
                level6.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY + 100)
                level6.zPosition = 11
                addChild(level6)
                } else if winLevel66 == true {
                    let level6 = SKButton(imageName: "buttonLevelWin/66", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(66, forKey: "levelNumber")
//
//                        let scene = Level66(fileNamed: "Level66")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level6.setScale(0.35)
                    level6.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY + 100)
                    level6.zPosition = 11
                    addChild(level6)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level6.position.x, y: level6.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel65 == false {
                let level6 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level6.setScale(0.35)
                level6.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY + 100)
                level6.zPosition = 11
                addChild(level6)
            }


            //7
            if winLevel66 == true {
                if winLevel67 == false {
                let level7 = SKButton(imageName: "buttonLevel/67", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(67, forKey: "levelNumber")
//
//                    let scene = Level67(fileNamed: "Level67")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level7.setScale(0.35)
                level7.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 100)
                level7.zPosition = 11
                addChild(level7)
                } else if winLevel67 == true {
                    let level7 = SKButton(imageName: "buttonLevelWin/67", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(67, forKey: "levelNumber")
//
//                        let scene = Level67(fileNamed: "Level67")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level7.setScale(0.35)
                    level7.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 100)
                    level7.zPosition = 11
                    addChild(level7)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level7.position.x, y: level7.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel66 == false {
                let level7 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level7.setScale(0.35)
                level7.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 100)
                level7.zPosition = 11
                addChild(level7)
            }


            //8
            if winLevel67 == true {
                if winLevel68 == false {
                let level8 = SKButton(imageName: "buttonLevel/68", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(68, forKey: "levelNumber")
//
//                        let scene = Level68(fileNamed: "Level68")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level8.setScale(0.35)
                level8.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 100)
                level8.zPosition = 11
                addChild(level8)
                } else if winLevel68 == true {
                    let level8 = SKButton(imageName: "buttonLevelWin/68", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(68, forKey: "levelNumber")
//
//                        let scene = Level68(fileNamed: "Level68")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level8.setScale(0.35)
                    level8.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 100)
                    level8.zPosition = 11
                    addChild(level8)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level8.position.x, y: level8.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel67 == false {
                let level8 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level8.setScale(0.35)
                level8.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 100)
                level8.zPosition = 11
                addChild(level8)
            }


            //9
            if winLevel68 == true {
                if winLevel69 == false {
                let level9 = SKButton(imageName: "buttonLevel/69", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(69, forKey: "levelNumber")
//
//                    let scene = Level69(fileNamed: "Level69")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level9.setScale(0.35)
                level9.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY + 100)
                level9.zPosition = 11
                addChild(level9)
                } else if winLevel69 == true {
                    let level9 = SKButton(imageName: "buttonLevelWin/69", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(69, forKey: "levelNumber")
//
//                        let scene = Level69(fileNamed: "Level69")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level9.setScale(0.35)
                    level9.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY + 100)
                    level9.zPosition = 11
                    addChild(level9)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level9.position.x, y: level9.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel68 == false {
                let level9 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level9.setScale(0.35)
                level9.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY + 100)
                level9.zPosition = 11
                addChild(level9)
            }


            //10
            if winLevel69 == true {
                if winLevel70 == false {
                let level10 = SKButton(imageName: "buttonLevel/70", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(70, forKey: "levelNumber")
//
//                        let scene = Level70(fileNamed: "Level70")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                        
                    
                })
                level10.setScale(0.35)
                level10.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY + 100)
                level10.zPosition = 11
                addChild(level10)
                } else if winLevel70 == true {
                    let level10 = SKButton(imageName: "buttonLevelWin/70", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(70, forKey: "levelNumber")
//
//                        let scene = Level70(fileNamed: "Level70")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level10.setScale(0.35)
                    level10.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY + 100)
                    level10.zPosition = 11
                    addChild(level10)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level10.position.x, y: level10.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel69 == false {
                let level10 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level10.setScale(0.35)
                level10.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY + 100)
                level10.zPosition = 11
                addChild(level10)
            }



            //11
            if winLevel70 == true {
                if winLevel71 == false {
                let level11 = SKButton(imageName: "buttonLevel/71", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(71, forKey: "levelNumber")
//
//                    let scene = Level71(fileNamed: "Level71")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level11.setScale(0.35)
                level11.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 15)
                level11.zPosition = 11
                addChild(level11)
                } else if winLevel71 == true {
                    let level11 = SKButton(imageName: "buttonLevelWin/71", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(71, forKey: "levelNumber")
//
//                        let scene = Level71(fileNamed: "Level71")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level11.setScale(0.35)
                    level11.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 15)
                    level11.zPosition = 11
                    addChild(level11)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level11.position.x, y: level11.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel70 == false {
                let level11 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level11.setScale(0.35)
                level11.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 15)
                level11.zPosition = 11
                addChild(level11)
            }


            //12
            if winLevel71 == true {
                if winLevel72 == false {
                let level12 = SKButton(imageName: "buttonLevel/72", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(72, forKey: "levelNumber")
//
//                    let scene = Level72(fileNamed: "Level72")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level12.setScale(0.35)
                level12.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 15)
                level12.zPosition = 11
                addChild(level12)
                } else if winLevel72 == true {
                    let level12 = SKButton(imageName: "buttonLevelWin/72", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(72, forKey: "levelNumber")
//
//                        let scene = Level72(fileNamed: "Level72")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level12.setScale(0.35)
                    level12.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 15)
                    level12.zPosition = 11
                    addChild(level12)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level12.position.x, y: level12.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel71 == false {
                let level12 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level12.setScale(0.35)
                level12.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 15)
                level12.zPosition = 11
                addChild(level12)
            }


            //13
            if winLevel72 == true {
                if winLevel73 == false {
                let level13 = SKButton(imageName: "buttonLevel/73", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(73, forKey: "levelNumber")
//
//                    let scene = Level73(fileNamed: "Level73")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level13.setScale(0.35)
                level13.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 15)
                level13.zPosition = 11
                addChild(level13)
                } else if winLevel73 == true {
                    let level13 = SKButton(imageName: "buttonLevelWin/73", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(73, forKey: "levelNumber")
//
//                        let scene = Level73(fileNamed: "Level73")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level13.setScale(0.35)
                    level13.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 15)
                    level13.zPosition = 11
                    addChild(level13)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level13.position.x, y: level13.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel72 == false {
                let level13 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level13.setScale(0.35)
                level13.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 15)
                level13.zPosition = 11
                addChild(level13)
            }


            //14
            if winLevel73 == true {
                if winLevel74 == false {
                let level14 = SKButton(imageName: "buttonLevel/74", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(74, forKey: "levelNumber")
//
//                    let scene = Level74(fileNamed: "Level74")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level14.setScale(0.35)
                level14.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 15)
                level14.zPosition = 11
                addChild(level14)
                } else if winLevel74 == true {
                    let level14 = SKButton(imageName: "buttonLevelWin/74", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(74, forKey: "levelNumber")
//
//                        let scene = Level74(fileNamed: "Level74")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level14.setScale(0.35)
                    level14.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 15)
                    level14.zPosition = 11
                    addChild(level14)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level14.position.x, y: level14.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel73 == false {
                let level14 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level14.setScale(0.35)
                level14.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 15)
                level14.zPosition = 11
                addChild(level14)
            }


            //15
            if winLevel74 == true {
                if winLevel75 == false {
                let level15 = SKButton(imageName: "buttonLevel/75", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(75, forKey: "levelNumber")
//
//                        let scene = Level75(fileNamed: "Level75")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level15.setScale(0.35)
                level15.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 15)
                level15.zPosition = 11
                addChild(level15)
                } else if winLevel75 == true {
                    let level15 = SKButton(imageName: "buttonLevelWin/75", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(75, forKey: "levelNumber")
//
//                        let scene = Level75(fileNamed: "Level75")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level15.setScale(0.35)
                    level15.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 15)
                    level15.zPosition = 11
                    addChild(level15)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level15.position.x, y: level15.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel74 == false {
                let level15 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level15.setScale(0.35)
                level15.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 15)
                level15.zPosition = 11
                addChild(level15)
            }


            //16
            if winLevel75 == true {
                if winLevel76 == false {
                let level16 = SKButton(imageName: "buttonLevel/76", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(76, forKey: "levelNumber")
//
//                    let scene = Level76(fileNamed: "Level76")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level16.setScale(0.35)
                level16.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 15)
                level16.zPosition = 11
                addChild(level16)
                } else if winLevel76 == true {
                    let level16 = SKButton(imageName: "buttonLevelWin/76", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(76, forKey: "levelNumber")
//
//                        let scene = Level76(fileNamed: "Level76")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level16.setScale(0.35)
                    level16.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 15)
                    level16.zPosition = 11
                    addChild(level16)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level16.position.x, y: level16.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel75 == false {
                let level16 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level16.setScale(0.35)
                level16.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 15)
                level16.zPosition = 11
                addChild(level16)
            }


            //17
            if winLevel76 == true {
                if winLevel77 == false {
                let level17 = SKButton(imageName: "buttonLevel/77", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(77, forKey: "levelNumber")
//
//                    let scene = Level77(fileNamed: "Level77")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level17.setScale(0.35)
                level17.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 15)
                level17.zPosition = 11
                addChild(level17)
                } else if winLevel77 == true {
                    let level17 = SKButton(imageName: "buttonLevelWin/77", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(77, forKey: "levelNumber")
//
//                        let scene = Level77(fileNamed: "Level77")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level17.setScale(0.35)
                    level17.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 15)
                    level17.zPosition = 11
                    addChild(level17)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level17.position.x, y: level17.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel76 == false {
                let level17 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level17.setScale(0.35)
                level17.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 15)
                level17.zPosition = 11
                addChild(level17)
            }


            //18
            if winLevel77 == true {
                if winLevel78 == false {
                let level18 = SKButton(imageName: "buttonLevel/78", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(78, forKey: "levelNumber")
//
//                        let scene = Level78(fileNamed: "Level78")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level18.setScale(0.35)
                level18.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 15)
                level18.zPosition = 11
                addChild(level18)
                } else if winLevel78 == true {
                    let level18 = SKButton(imageName: "buttonLevelWin/78", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(78, forKey: "levelNumber")
//
//                        let scene = Level78(fileNamed: "Level78")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level18.setScale(0.35)
                    level18.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 15)
                    level18.zPosition = 11
                    addChild(level18)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level18.position.x, y: level18.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel77 == false {
                let level18 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level18.setScale(0.35)
                level18.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 15)
                level18.zPosition = 11
                addChild(level18)
            }


            //19
            if winLevel78 == true {
                if winLevel79 == false {
                let level19 = SKButton(imageName: "buttonLevel/79", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(79, forKey: "levelNumber")
//
//                    let scene = Level79(fileNamed: "Level79")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level19.setScale(0.35)
                level19.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 15)
                level19.zPosition = 11
                addChild(level19)
                } else if winLevel79 == true {
                    let level19 = SKButton(imageName: "buttonLevelWin/79", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(79, forKey: "levelNumber")
//
//                        let scene = Level79(fileNamed: "Level79")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level19.setScale(0.35)
                    level19.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 15)
                    level19.zPosition = 11
                    addChild(level19)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level19.position.x, y: level19.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel78 == false {
                let level19 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level19.setScale(0.35)
                level19.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 15)
                level19.zPosition = 11
                addChild(level19)
            }


            //20
            if winLevel79 == true {
                if winLevel80 == false {
                let level20 = SKButton(imageName: "buttonLevel/80", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(80, forKey: "levelNumber")
//
//                        let scene = Level80(fileNamed: "Level80")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level20.setScale(0.35)
                level20.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 15)
                level20.zPosition = 11
                addChild(level20)
                } else if winLevel80 == true {
                    let level20 = SKButton(imageName: "buttonLevelWin/80", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(80, forKey: "levelNumber")
//
//                        let scene = Level80(fileNamed: "Level80")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level20.setScale(0.35)
                    level20.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 15)
                    level20.zPosition = 11
                    addChild(level20)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level20.position.x, y: level20.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel79 == false {
                let level20 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level20.setScale(0.35)
                level20.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 15)
                level20.zPosition = 11
                addChild(level20)
            }


            //21
            if winLevel80 == true {
                if winLevel81 == false {
                let level21 = SKButton(imageName: "buttonLevel/81", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(81, forKey: "levelNumber")
//
//                    let scene = Level81(fileNamed: "Level81")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level21.setScale(0.35)
                level21.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 115)
                level21.zPosition = 11
                addChild(level21)
                } else if winLevel81 == true {
                    let level21 = SKButton(imageName: "buttonLevelWin/81", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(81, forKey: "levelNumber")
//
//                        let scene = Level81(fileNamed: "Level81")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level21.setScale(0.35)
                    level21.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 115)
                    level21.zPosition = 11
                    addChild(level21)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level21.position.x, y: level21.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel80 == false {
                let level21 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level21.setScale(0.35)
                level21.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 115)
                level21.zPosition = 11
                addChild(level21)
            }


            //22
            if winLevel81 == true {
                if winLevel82 == false {
                let level22 = SKButton(imageName: "buttonLevel/82", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(82, forKey: "levelNumber")
//
//                        let scene = Level82(fileNamed: "Level82")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level22.setScale(0.35)
                level22.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 115)
                level22.zPosition = 11
                addChild(level22)
                } else if winLevel82 == true {
                    let level22 = SKButton(imageName: "buttonLevelWin/82", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(82, forKey: "levelNumber")
//
//                        let scene = Level82(fileNamed: "Level82")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level22.setScale(0.35)
                    level22.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 115)
                    level22.zPosition = 11
                    addChild(level22)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level22.position.x, y: level22.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel81 == false {
                let level22 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level22.setScale(0.35)
                level22.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 115)
                level22.zPosition = 11
                addChild(level22)
            }


            //23
            if winLevel82 == true {
                if winLevel83 == false {
                let level23 = SKButton(imageName: "buttonLevel/83", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(83, forKey: "levelNumber")
//
//                    let scene = Level83(fileNamed: "Level83")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level23.setScale(0.35)
                level23.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 115)
                level23.zPosition = 11
                addChild(level23)
                } else if winLevel83 == true {
                    let level23 = SKButton(imageName: "buttonLevelWin/83", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(83, forKey: "levelNumber")
//
//                        let scene = Level83(fileNamed: "Level83")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level23.setScale(0.35)
                    level23.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 115)
                    level23.zPosition = 11
                    addChild(level23)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level23.position.x, y: level23.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel82 == false {
                let level23 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level23.setScale(0.35)
                level23.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 115)
                level23.zPosition = 11
                addChild(level23)
            }


            //24
            if winLevel83 == true {
                if winLevel84 == false {
                let level24 = SKButton(imageName: "buttonLevel/84", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(84, forKey: "levelNumber")
//
//                    let scene = Level84(fileNamed: "Level84")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level24.setScale(0.35)
                level24.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 115)
                level24.zPosition = 11
                addChild(level24)
                } else if winLevel84 == true {
                    let level24 = SKButton(imageName: "buttonLevelWin/84", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(84, forKey: "levelNumber")
//
//                        let scene = Level84(fileNamed: "Level84")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level24.setScale(0.35)
                    level24.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 115)
                    level24.zPosition = 11
                    addChild(level24)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level24.position.x, y: level24.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel83 == false {
                let level24 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level24.setScale(0.35)
                level24.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 115)
                level24.zPosition = 11
                addChild(level24)
            }


            //25
            if winLevel84 == true {
                if winLevel85 == false {
                let level25 = SKButton(imageName: "buttonLevel/85", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(85, forKey: "levelNumber")
//
//                        let scene = Level85(fileNamed: "Level85")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level25.setScale(0.35)
                level25.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 115)
                level25.zPosition = 11
                addChild(level25)
                } else if winLevel85 == true {
                    let level25 = SKButton(imageName: "buttonLevelWin/85", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(85, forKey: "levelNumber")
//
//                        let scene = Level85(fileNamed: "Level85")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level25.setScale(0.35)
                    level25.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 115)
                    level25.zPosition = 11
                    addChild(level25)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level25.position.x, y: level25.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel84 == false {
                let level25 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level25.setScale(0.35)
                level25.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 115)
                level25.zPosition = 11
                addChild(level25)
            }


            //26
            if winLevel85 == true {
                if winLevel86 == false {
                let level26 = SKButton(imageName: "buttonLevel/86", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(86, forKey: "levelNumber")
//
//                    let scene = Level86(fileNamed: "Level86")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level26.setScale(0.35)
                level26.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 115)
                level26.zPosition = 11
                addChild(level26)
                } else if winLevel86 == true {
                    let level26 = SKButton(imageName: "buttonLevelWin/86", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(86, forKey: "levelNumber")
//
//                        let scene = Level86(fileNamed: "Level86")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level26.setScale(0.35)
                    level26.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 115)
                    level26.zPosition = 11
                    addChild(level26)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level26.position.x, y: level26.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel85 == false {
                let level26 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level26.setScale(0.35)
                level26.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 115)
                level26.zPosition = 11
                addChild(level26)
            }


            //27
            if winLevel86 == true {
                if winLevel87 == false {
                let level27 = SKButton(imageName: "buttonLevel/87", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                    UserDefaults.standard.set(87, forKey: "levelNumber")
//
//                    let scene = Level87(fileNamed: "Level87")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level27.setScale(0.35)
                level27.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 115)
                level27.zPosition = 11
                addChild(level27)
                } else if winLevel87 == true {
                    let level27 = SKButton(imageName: "buttonLevelWin/87", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(87, forKey: "levelNumber")
//
//                        let scene = Level87(fileNamed: "Level87")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level27.setScale(0.35)
                    level27.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 115)
                    level27.zPosition = 11
                    addChild(level27)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level27.position.x, y: level27.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel86 == false {
                let level27 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level27.setScale(0.35)
                level27.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 115)
                level27.zPosition = 11
                addChild(level27)
            }


            //28
            if winLevel87 == true {
                if winLevel88 == false {
                    let level28 = SKButton(imageName: "buttonLevel/88", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(88, forKey: "levelNumber")
//
//                        let scene = Level88(fileNamed: "Level88")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.35)
                    level28.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 115)
                    level28.zPosition = 11
                    addChild(level28)
                } else if winLevel88 == true {
                    let level28 = SKButton(imageName: "buttonLevelWin/88", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(88, forKey: "levelNumber")
//
//                        let scene = Level88(fileNamed: "Level88")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.35)
                    level28.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 115)
                    level28.zPosition = 11
                    addChild(level28)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level28.position.x, y: level28.position.y - 5)
                    addChild(cloud)
                }

            } else if winLevel87 == false {
                let level28 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level28.setScale(0.35)
                level28.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 115)
                level28.zPosition = 11
                addChild(level28)
            }


            //29
            if winLevel88 == true {
                if winLevel89 == false {
                    let level29 = SKButton(imageName: "buttonLevel/89", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                            UserDefaults.standard.set(89, forKey: "levelNumber")
//
//                            let scene = Level89(fileNamed: "Level89")
//                            let transation = SKTransition.fade(withDuration: 1.0)
//
//                            scene!.scaleMode = .aspectFill
//                            self.view?.presentScene(scene!, transition: transation)
//                            self.centreView.removeFromSuperview()
                            
                    })
                    level29.setScale(0.35)
                    level29.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 115)
                    level29.zPosition = 11
                    addChild(level29)
                } else if winLevel89 == true {
                    let level29 = SKButton(imageName: "buttonLevelWin/89", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(89, forKey: "levelNumber")
//
//                        let scene = Level89(fileNamed: "Level89")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level29.setScale(0.35)
                    level29.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 115)
                    level29.zPosition = 11
                    addChild(level29)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level29.position.x, y: level29.position.y - 5)
                    addChild(cloud)
                }

            } else if winLevel88 == false {
                let level29 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level29.setScale(0.35)
                level29.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 115)
                level29.zPosition = 11
                addChild(level29)
            }

            //30
            if winLevel89 == true {
                if winLevel90 == false {
                    let level30 = SKButton(imageName: "buttonLevel/90", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(90, forKey: "levelNumber")
//
//                        let scene = Level90(fileNamed: "Level90")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level30.setScale(0.35)
                    level30.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 115)
                    level30.zPosition = 11
                    addChild(level30)
                } else if winLevel90 == true {
                    let level30 = SKButton(imageName: "buttonLevelWin/90", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(90, forKey: "levelNumber")
//
//                        let scene = Level90(fileNamed: "Level90")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level30.setScale(0.35)
                    level30.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 115)
                    level30.zPosition = 11
                    addChild(level30)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level30.position.x, y: level30.position.y - 5)
                    addChild(cloud)
                }

            } else if winLevel89 == false {
                let level30 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level30.setScale(0.35)
                level30.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 115)
                level30.zPosition = 11
                addChild(level30)
            }
//MARK: - Screen < 800
        } else {
                
            //1
            if winLevel60 == true {
            if winLevel61 == false {
            let level1 = SKButton(imageName: "buttonLevel/61", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel31") {
//
//                    let scene = LevelDialogue31(fileNamed: "LevelDialogue31")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
//
//                   } else {
                    
                    UserDefaults.standard.set(61, forKey: "levelNumber")

                    let scene = Level61(fileNamed: "Level61")
                    let transation = SKTransition.fade(withDuration: 1.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
//                   }
//                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel31")
                
            })
            level1.setScale(0.4)
            level1.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY + 110)
            level1.zPosition = 11
            addChild(level1)
            } else if winLevel61 == true {
                let level1 = SKButton(imageName: "buttonLevelWin/61", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(61, forKey: "levelNumber")

                    let scene = Level61(fileNamed: "Level61")
                    let transation = SKTransition.fade(withDuration: 1.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level1.setScale(0.4)
                level1.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY + 110)
                level1.zPosition = 11
                addChild(level1)

                let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                cloud.zPosition = 1
                cloud.position = CGPoint(x: level1.position.x, y: level1.position.y - 5)
                addChild(cloud)
            }
            } else if winLevel60 == false {
                let level1 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level1.setScale(0.4)
                level1.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY + 110)
                level1.zPosition = 11
                addChild(level1)
            }

            //2

            if winLevel61 == true {
                if winLevel62 == false {
                let level2 = SKButton(imageName: "buttonLevel/62", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(62, forKey: "levelNumber")
//
//                        let scene = Level62(fileNamed: "Level62")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    
                })
                level2.setScale(0.4)
                level2.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY + 110)
                level2.zPosition = 11
                addChild(level2)
                } else if winLevel62 == true {
                    let level2 = SKButton(imageName: "buttonLevelWin/62", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(62, forKey: "levelNumber")
//
//                        let scene = Level62(fileNamed: "Level62")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level2.setScale(0.4)
                    level2.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY + 110)
                    level2.zPosition = 11
                    addChild(level2)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level2.position.x, y: level2.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel61 == false {
                let level2 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level2.setScale(0.4)
                level2.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY + 110)
                level2.zPosition = 11
                addChild(level2)
            }

            //3
            if winLevel62 == true {
                if winLevel63 == false {
            let level3 = SKButton(imageName: "buttonLevel/63", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(63, forKey: "levelNumber")
//
//                let scene = Level63(fileNamed: "Level63")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level3.setScale(0.4)
            level3.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY + 110)
            level3.zPosition = 11
            addChild(level3)
                } else if winLevel63 == true {
                    let level3 = SKButton(imageName: "buttonLevelWin/63", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(63, forKey: "levelNumber")
//
//                        let scene = Level63(fileNamed: "Level63")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level3.setScale(0.4)
                    level3.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY + 110)
                    level3.zPosition = 11
                    addChild(level3)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level3.position.x, y: level3.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel62 == false {
                let level3 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level3.setScale(0.4)
                level3.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY + 110)
                level3.zPosition = 11
                addChild(level3)
            }


            //4
            if winLevel63 == true {
                if winLevel64 == false {
            let level4 = SKButton(imageName: "buttonLevel/64", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                    
//                    UserDefaults.standard.set(64, forKey: "levelNumber")
//
//                    let scene = Level64(fileNamed: "Level64")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                
            })
            level4.setScale(0.4)
            level4.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY + 110)
            level4.zPosition = 11
            addChild(level4)
                } else if winLevel64 == true {
                    let level4 = SKButton(imageName: "buttonLevelWin/64", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(64, forKey: "levelNumber")
//
//                        let scene = Level64(fileNamed: "Level64")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level4.setScale(0.4)
                    level4.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY + 110)
                    level4.zPosition = 11
                    addChild(level4)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level4.position.x, y: level4.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel63 == false {
                let level4 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level4.setScale(0.4)
                level4.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY + 110)
                level4.zPosition = 11
                addChild(level4)
            }

            //5
            if winLevel64 == true {
                if winLevel65 == false {
            let level5 = SKButton(imageName: "buttonLevel/65", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                    
//                    UserDefaults.standard.set(65, forKey: "levelNumber")
//
//                    let scene = Level65(fileNamed: "Level65")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                
            })
            level5.setScale(0.4)
            level5.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY + 110)
            level5.zPosition = 11
            addChild(level5)
                } else if winLevel65 == true {
                    let level5 = SKButton(imageName: "buttonLevelWin/65", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(65, forKey: "levelNumber")
//
//                        let scene = Level65(fileNamed: "Level65")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level5.setScale(0.4)
                    level5.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY + 110)
                    level5.zPosition = 11
                    addChild(level5)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level5.position.x, y: level5.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel64 == false {
                let level5 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level5.setScale(0.4)
                level5.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY + 110)
                level5.zPosition = 11
                addChild(level5)
            }

            //6
            if winLevel65 == true {
                if winLevel66 == false {
            let level6 = SKButton(imageName: "buttonLevel/66", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(66, forKey: "levelNumber")
//
//                let scene = Level66(fileNamed: "Level66")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level6.setScale(0.4)
            level6.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY + 110)
            level6.zPosition = 11
            addChild(level6)
                } else if winLevel66 == true {
                    let level6 = SKButton(imageName: "buttonLevelWin/66", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(66, forKey: "levelNumber")
//
//                        let scene = Level66(fileNamed: "Level66")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level6.setScale(0.4)
                    level6.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY + 110)
                    level6.zPosition = 11
                    addChild(level6)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level6.position.x, y: level6.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel65 == false {
                let level6 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level6.setScale(0.4)
                level6.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY + 110)
                level6.zPosition = 11
                addChild(level6)
            }

            //7
            if winLevel66 == true {
                if winLevel67 == false {
            let level7 = SKButton(imageName: "buttonLevel/67", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(67, forKey: "levelNumber")
//
//                let scene = Level67(fileNamed: "Level67")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level7.setScale(0.4)
            level7.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY + 110)
            level7.zPosition = 11
            addChild(level7)
                } else if winLevel67 == true {
                    let level7 = SKButton(imageName: "buttonLevelWin/67", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(67, forKey: "levelNumber")
//
//                        let scene = Level67(fileNamed: "Level67")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level7.setScale(0.4)
                    level7.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY + 110)
                    level7.zPosition = 11
                    addChild(level7)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level7.position.x, y: level7.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel66 == false {
                let level7 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level7.setScale(0.4)
                level7.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY + 110)
                level7.zPosition = 11
                addChild(level7)
            }

            //8
            if winLevel67 == true {
                if winLevel68 == false {
            let level8 = SKButton(imageName: "buttonLevel/68", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                    
//                    UserDefaults.standard.set(68, forKey: "levelNumber")
//
//                    let scene = Level68(fileNamed: "Level68")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                
            })
            level8.setScale(0.4)
            level8.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY + 110)
            level8.zPosition = 11
            addChild(level8)
                } else if winLevel68 == true {
                    let level8 = SKButton(imageName: "buttonLevelWin/68", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(68, forKey: "levelNumber")
//
//                        let scene = Level68(fileNamed: "Level68")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level8.setScale(0.4)
                    level8.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY + 110)
                    level8.zPosition = 11
                    addChild(level8)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level8.position.x, y: level8.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel67 == false {
                let level8 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level8.setScale(0.4)
                level8.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY + 110)
                level8.zPosition = 11
                addChild(level8)
            }

            //9
            if winLevel68 == true {
                if winLevel69 == false {
            let level9 = SKButton(imageName: "buttonLevel/69", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(69, forKey: "levelNumber")
//
//                let scene = Level69(fileNamed: "Level69")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level9.setScale(0.4)
            level9.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY + 110)
            level9.zPosition = 11
            addChild(level9)
                } else if winLevel69 == true {
                    let level9 = SKButton(imageName: "buttonLevelWin/69", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(69, forKey: "levelNumber")
//
//                        let scene = Level69(fileNamed: "Level69")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level9.setScale(0.4)
                    level9.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY + 110)
                    level9.zPosition = 11
                    addChild(level9)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level9.position.x, y: level9.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel68 == false {
                let level9 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level9.setScale(0.4)
                level9.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY + 110)
                level9.zPosition = 11
                addChild(level9)
            }

            //10
            if winLevel69 == true {
                if winLevel70 == false {
            let level10 = SKButton(imageName: "buttonLevel/70", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                    
//                    UserDefaults.standard.set(70, forKey: "levelNumber")
//
//                    let scene = Level70(fileNamed: "Level70")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                
            })
            level10.setScale(0.4)
            level10.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY + 110)
            level10.zPosition = 11
            addChild(level10)
                } else if winLevel70 == true {
                    let level10 = SKButton(imageName: "buttonLevelWin/70", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(70, forKey: "levelNumber")
//
//                        let scene = Level70(fileNamed: "Level70")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level10.setScale(0.4)
                    level10.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY + 110)
                    level10.zPosition = 11
                    addChild(level10)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level10.position.x, y: level10.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel69 == false {
                let level10 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level10.setScale(0.4)
                level10.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY + 110)
                level10.zPosition = 11
                addChild(level10)
            }

            //11
            if winLevel70 == true {
                if winLevel71 == false {
            let level11 = SKButton(imageName: "buttonLevel/71", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(71, forKey: "levelNumber")
//
//                let scene = Level71(fileNamed: "Level71")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level11.setScale(0.4)
            level11.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 15)
            level11.zPosition = 11
            addChild(level11)
                } else if winLevel71 == true {
                    let level11 = SKButton(imageName: "buttonLevelWin/71", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(71, forKey: "levelNumber")
//
//                        let scene = Level71(fileNamed: "Level71")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level11.setScale(0.4)
                    level11.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 15)
                    level11.zPosition = 11
                    addChild(level11)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level11.position.x, y: level11.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel70 == false {
                let level11 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level11.setScale(0.4)
                level11.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 15)
                level11.zPosition = 11
                addChild(level11)
            }

            //12
            if winLevel71 == true {
                if winLevel72 == false {
            let level12 = SKButton(imageName: "buttonLevel/72", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(72, forKey: "levelNumber")
//
//                let scene = Level72(fileNamed: "Level72")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level12.setScale(0.4)
            level12.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 15)
            level12.zPosition = 11
            addChild(level12)
                } else if winLevel72 == true {
                    let level12 = SKButton(imageName: "buttonLevelWin/72", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(72, forKey: "levelNumber")
//
//                        let scene = Level72(fileNamed: "Level72")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level12.setScale(0.4)
                    level12.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 15)
                    level12.zPosition = 11
                    addChild(level12)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level12.position.x, y: level12.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel71 == false {
                let level12 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level12.setScale(0.4)
                level12.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 15)
                level12.zPosition = 11
                addChild(level12)
            }

            //13
            if winLevel72 == true {
                if winLevel73 == false {
            let level13 = SKButton(imageName: "buttonLevel/73", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(73, forKey: "levelNumber")
//
//                let scene = Level73(fileNamed: "Level73")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level13.setScale(0.4)
            level13.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 15)
            level13.zPosition = 11
            addChild(level13)
                } else if winLevel73 == true {
                    let level13 = SKButton(imageName: "buttonLevelWin/73", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(73, forKey: "levelNumber")
//
//                        let scene = Level73(fileNamed: "Level73")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level13.setScale(0.4)
                    level13.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 15)
                    level13.zPosition = 11
                    addChild(level13)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level13.position.x, y: level13.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel72 == false {
                let level13 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level13.setScale(0.4)
                level13.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 15)
                level13.zPosition = 11
                addChild(level13)
            }

            //14
            if winLevel73 == true {
                if winLevel74 == false {
            let level14 = SKButton(imageName: "buttonLevel/74", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(74, forKey: "levelNumber")
//
//                let scene = Level74(fileNamed: "Level74")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level14.setScale(0.4)
            level14.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 15)
            level14.zPosition = 11
            addChild(level14)
                } else if winLevel74 == true {
                    let level14 = SKButton(imageName: "buttonLevelWin/74", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(74, forKey: "levelNumber")
//
//                        let scene = Level74(fileNamed: "Level74")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level14.setScale(0.4)
                    level14.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 15)
                    level14.zPosition = 11
                    addChild(level14)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level14.position.x, y: level14.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel73 == false {
                let level14 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level14.setScale(0.4)
                level14.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 15)
                level14.zPosition = 11
                addChild(level14)
            }

            //15
            if winLevel74 == true {
                if winLevel75 == false {
            let level15 = SKButton(imageName: "buttonLevel/75", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                    
//                    UserDefaults.standard.set(75, forKey: "levelNumber")
//
//                    let scene = Level75(fileNamed: "Level75")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                
            })
            level15.setScale(0.4)
            level15.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 15)
            level15.zPosition = 11
            addChild(level15)
                } else if winLevel75 == true {
                    let level15 = SKButton(imageName: "buttonLevelWin/75", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(75, forKey: "levelNumber")
//
//                        let scene = Level75(fileNamed: "Level75")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level15.setScale(0.4)
                    level15.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 15)
                    level15.zPosition = 11
                    addChild(level15)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level15.position.x, y: level15.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel74 == false {
                let level15 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level15.setScale(0.4)
                level15.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 15)
                level15.zPosition = 11
                addChild(level15)
            }

            //16
            if winLevel75 == true {
                if winLevel76 == false {
            let level16 = SKButton(imageName: "buttonLevel/76", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(76, forKey: "levelNumber")
//
//                let scene = Level76(fileNamed: "Level76")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level16.setScale(0.4)
            level16.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 15)
            level16.zPosition = 11
            addChild(level16)
                } else if winLevel76 {
                    let level16 = SKButton(imageName: "buttonLevelWin/76", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(76, forKey: "levelNumber")
//
//                        let scene = Level76(fileNamed: "Level76")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level16.setScale(0.4)
                    level16.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 15)
                    level16.zPosition = 11
                    addChild(level16)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level16.position.x, y: level16.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel75 == false {
                let level16 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level16.setScale(0.4)
                level16.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 15)
                level16.zPosition = 11
                addChild(level16)
            }

            //17
            if winLevel76 == true {
                if winLevel77 == false {
            let level17 = SKButton(imageName: "buttonLevel/77", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(77, forKey: "levelNumber")
//
//                let scene = Level77(fileNamed: "Level77")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level17.setScale(0.4)
            level17.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 15)
            level17.zPosition = 11
            addChild(level17)
                } else if winLevel77 == true {
                    let level17 = SKButton(imageName: "buttonLevelWin/77", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(77, forKey: "levelNumber")
//
//                        let scene = Level77(fileNamed: "Level77")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level17.setScale(0.4)
                    level17.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 15)
                    level17.zPosition = 11
                    addChild(level17)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level17.position.x, y: level17.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel76 == false {
                let level17 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level17.setScale(0.4)
                level17.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 15)
                level17.zPosition = 11
                addChild(level17)
            }

            //18
            if winLevel77 == true {
                if winLevel78 == false {
            let level18 = SKButton(imageName: "buttonLevel/78", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                    
//                    UserDefaults.standard.set(78, forKey: "levelNumber")
//
//                    let scene = Level78(fileNamed: "Level78")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                
            })
            level18.setScale(0.4)
            level18.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 15)
            level18.zPosition = 11
            addChild(level18)
                } else if winLevel78 == true {
                    let level18 = SKButton(imageName: "buttonLevelWin/78", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(78, forKey: "levelNumber")
//
//                        let scene = Level78(fileNamed: "Level78")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level18.setScale(0.4)
                    level18.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 15)
                    level18.zPosition = 11
                    addChild(level18)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level18.position.x, y: level18.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel77 == false {
                let level18 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level18.setScale(0.4)
                level18.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 15)
                level18.zPosition = 11
                addChild(level18)
            }

            //19
            if winLevel78 == true {
                if winLevel79 == false {
            let level19 = SKButton(imageName: "buttonLevel/79", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(79, forKey: "levelNumber")
//
//                let scene = Level79(fileNamed: "Level79")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level19.setScale(0.4)
            level19.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 15)
            level19.zPosition = 11
            addChild(level19)
                } else if winLevel79 == true {
                    let level19 = SKButton(imageName: "buttonLevelWin/79", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(79, forKey: "levelNumber")
//
//                        let scene = Level79(fileNamed: "Level79")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level19.setScale(0.4)
                    level19.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 15)
                    level19.zPosition = 11
                    addChild(level19)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level19.position.x, y: level19.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel78 == false {
                let level19 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level19.setScale(0.4)
                level19.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 15)
                level19.zPosition = 11
                addChild(level19)
            }

            //20
            if winLevel79 == true {
                if winLevel80 == false {
            let level20 = SKButton(imageName: "buttonLevel/80", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                    
//                    UserDefaults.standard.set(80, forKey: "levelNumber")
//
//                    let scene = Level80(fileNamed: "Level80")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                
            })
            level20.setScale(0.4)
            level20.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 15)
            level20.zPosition = 11
            addChild(level20)
                } else if winLevel80 == true {
                        let level20 = SKButton(imageName: "buttonLevelWin/80", buttonAction: {
                            
                            if self.sound == true {
                                self.run(Sound.pop.action)
                            }
                            
//                            UserDefaults.standard.set(80, forKey: "levelNumber")
//
//                            let scene = Level80(fileNamed: "Level80")
//                            let transation = SKTransition.fade(withDuration: 1.0)
//
//                            scene!.scaleMode = .aspectFill
//                            self.view?.presentScene(scene!, transition: transation)
//                            self.centreView.removeFromSuperview()
                        })
                        level20.setScale(0.4)
                        level20.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 15)
                        level20.zPosition = 11
                        addChild(level20)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level20.position.x, y: level20.position.y - 5)
                    addChild(cloud)
                    }
            } else if winLevel79 == false {
                let level20 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level20.setScale(0.4)
                level20.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 15)
                level20.zPosition = 11
                addChild(level20)
            }

            //21
            if winLevel80 == true {
                if winLevel81 == false {
                let level21 = SKButton(imageName: "buttonLevel/81", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                UserDefaults.standard.set(81, forKey: "levelNumber")
//
//                let scene = Level81(fileNamed: "Level81")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level21.setScale(0.4)
            level21.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 130)
            level21.zPosition = 11
            addChild(level21)
                } else if winLevel81 == true {
                        let level21 = SKButton(imageName: "buttonLevelWin/81", buttonAction: {
                            
                            if self.sound == true {
                                self.run(Sound.pop.action)
                            }
                            
//                        UserDefaults.standard.set(81, forKey: "levelNumber")
//
//                        let scene = Level81(fileNamed: "Level81")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level21.setScale(0.4)
                    level21.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 130)
                    level21.zPosition = 11
                    addChild(level21)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level21.position.x, y: level21.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel80 == false {
                let level21 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level21.setScale(0.4)
                level21.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 130)
                level21.zPosition = 11
                addChild(level21)
            }

            //22
            if winLevel81 == true {
                if winLevel82 == false {
                let level22 = SKButton(imageName: "buttonLevel/82", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(82, forKey: "levelNumber")
//
//                        let scene = Level82(fileNamed: "Level82")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                
            })
            level22.setScale(0.4)
            level22.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 130)
            level22.zPosition = 11
            addChild(level22)
                } else if winLevel82 == true {
                    let level22 = SKButton(imageName: "buttonLevelWin/82", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(82, forKey: "levelNumber")
//
//                    let scene = Level82(fileNamed: "Level82")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level22.setScale(0.4)
                level22.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 130)
                level22.zPosition = 11
                addChild(level22)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level22.position.x, y: level22.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel81 == false {
                let level22 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level22.setScale(0.4)
                level22.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 130)
                level22.zPosition = 11
                addChild(level22)
            }

            //23
            if winLevel82 == true {
                if winLevel83 == false {
                let level23 = SKButton(imageName: "buttonLevel/83", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                UserDefaults.standard.set(83, forKey: "levelNumber")
//
//                let scene = Level83(fileNamed: "Level83")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level23.setScale(0.4)
            level23.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 130)
            level23.zPosition = 11
            addChild(level23)
                } else if winLevel83 == true {
                    let level23 = SKButton(imageName: "buttonLevelWin/83", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(83, forKey: "levelNumber")
//
//                    let scene = Level83(fileNamed: "Level83")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level23.setScale(0.4)
                level23.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 130)
                level23.zPosition = 11
                addChild(level23)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level23.position.x, y: level23.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel82 == false {
                let level23 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level23.setScale(0.4)
                level23.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 130)
                level23.zPosition = 11
                addChild(level23)
            }

            //24
            if winLevel83 == true {
                if winLevel84 == false {
                let level24 = SKButton(imageName: "buttonLevel/84", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                UserDefaults.standard.set(84, forKey: "levelNumber")
//
//                let scene = Level84(fileNamed: "Level84")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level24.setScale(0.4)
            level24.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 130)
            level24.zPosition = 11
            addChild(level24)
                } else if winLevel84 == true {
                    let level24 = SKButton(imageName: "buttonLevelWin/84", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(84, forKey: "levelNumber")
//
//                    let scene = Level84(fileNamed: "Level84")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level24.setScale(0.4)
                level24.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 130)
                level24.zPosition = 11
                addChild(level24)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level24.position.x, y: level24.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel83 == false {
                let level24 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level24.setScale(0.4)
                level24.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 130)
                level24.zPosition = 11
                addChild(level24)
            }

            //25
            if winLevel84 == true {
                if winLevel85 == false {
                let level25 = SKButton(imageName: "buttonLevel/85", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                        
//                        UserDefaults.standard.set(85, forKey: "levelNumber")
//
//                        let scene = Level85(fileNamed: "Level85")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                
            })
            level25.setScale(0.4)
            level25.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 130)
            level25.zPosition = 11
            addChild(level25)
                } else if winLevel85 == true {
                    let level25 = SKButton(imageName: "buttonLevelWin/85", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(85, forKey: "levelNumber")
//
//                    let scene = Level85(fileNamed: "Level85")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                })
                level25.setScale(0.4)
                level25.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 130)
                level25.zPosition = 11
                addChild(level25)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level25.position.x, y: level25.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel84 == false {
                let level25 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level25.setScale(0.4)
                level25.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 130)
                level25.zPosition = 11
                addChild(level25)
            }

            //26
            if winLevel85 == true {
                if winLevel86 == false {
                let level26 = SKButton(imageName: "buttonLevel/86", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                UserDefaults.standard.set(86, forKey: "levelNumber")
//
//                let scene = Level86(fileNamed: "Level86")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level26.setScale(0.4)
            level26.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 130)
            level26.zPosition = 11
            addChild(level26)
                } else if winLevel86 == true {
                    let level26 = SKButton(imageName: "buttonLevelWin/86", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(86, forKey: "levelNumber")
//
//                    let scene = Level86(fileNamed: "Level86")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level26.setScale(0.4)
                level26.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 130)
                level26.zPosition = 11
                addChild(level26)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level26.position.x, y: level26.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel85 == false {
                let level26 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level26.setScale(0.4)
                level26.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 130)
                level26.zPosition = 11
                addChild(level26)
            }

            //27
            if winLevel86 == true {
                if winLevel87 == false {
                let level27 = SKButton(imageName: "buttonLevel/87", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                UserDefaults.standard.set(87, forKey: "levelNumber")
//
//                let scene = Level87(fileNamed: "Level87")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level27.setScale(0.4)
            level27.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 130)
            level27.zPosition = 11
            addChild(level27)
                } else if winLevel87 == true {
                    let level27 = SKButton(imageName: "buttonLevelWin/87", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(87, forKey: "levelNumber")
//
//                    let scene = Level87(fileNamed: "Level87")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level27.setScale(0.4)
                level27.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 130)
                level27.zPosition = 11
                addChild(level27)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level27.position.x, y: level27.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel86 == false {
                let level27 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level27.setScale(0.4)
                level27.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 130)
                level27.zPosition = 11
                addChild(level27)
            }

            //28
            if winLevel87 == true {
                if winLevel88 == false {
            let level28 = SKButton(imageName: "buttonLevel/88", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
//                UserDefaults.standard.set(88, forKey: "levelNumber")
//
//                let scene = Level88(fileNamed: "Level88")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level28.setScale(0.4)
            level28.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 130)
            level28.zPosition = 11
            addChild(level28)
                } else if winLevel88 == true {
                    let level28 = SKButton(imageName: "buttonLevelWin/88", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                        UserDefaults.standard.set(88, forKey: "levelNumber")
//
//                        let scene = Level88(fileNamed: "Level88")
//                        let transation = SKTransition.fade(withDuration: 1.0)
//
//                        scene!.scaleMode = .aspectFill
//                        self.view?.presentScene(scene!, transition: transation)
//                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.4)
                    level28.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 130)
                    level28.zPosition = 11
                    addChild(level28)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level28.position.x, y: level28.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel87 == false {
                let level28 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level28.setScale(0.4)
                level28.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 130)
                level28.zPosition = 11
                addChild(level28)
            }

            //29
            if winLevel88 == true {
                if winLevel89 == false {
                let level29 = SKButton(imageName: "buttonLevel/89", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                            UserDefaults.standard.set(89, forKey: "levelNumber")
//
//                            let scene = Level89(fileNamed: "Level89")
//                            let transation = SKTransition.fade(withDuration: 1.0)
//
//                            scene!.scaleMode = .aspectFill
//                            self.view?.presentScene(scene!, transition: transation)
//                            self.centreView.removeFromSuperview()
            })
            level29.setScale(0.4)
            level29.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 130)
            level29.zPosition = 11
            addChild(level29)
                } else if winLevel89 == true {
                    let level29 = SKButton(imageName: "buttonLevelWin/89", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(89, forKey: "levelNumber")
//
//                    let scene = Level89(fileNamed: "Level89")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level29.setScale(0.4)
                level29.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 130)
                level29.zPosition = 11
                addChild(level29)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level29.position.x, y: level29.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel88 == false {
                let level29 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level29.setScale(0.4)
                level29.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 130)
                level29.zPosition = 11
                addChild(level29)
            }

            //30
            if winLevel89 == true {
                if winLevel90 == false {
                let level30 = SKButton(imageName: "buttonLevel/90", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
//                UserDefaults.standard.set(90, forKey: "levelNumber")
//
//                let scene = Level90(fileNamed: "Level90")
//                let transation = SKTransition.fade(withDuration: 1.0)
//
//                scene!.scaleMode = .aspectFill
//                self.view?.presentScene(scene!, transition: transation)
//                self.centreView.removeFromSuperview()
            })
            level30.setScale(0.4)
            level30.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 130)
            level30.zPosition = 11
            addChild(level30)
                } else if winLevel90 == true {
                    let level30 = SKButton(imageName: "buttonLevelWin/90", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
//                    UserDefaults.standard.set(90, forKey: "levelNumber")
//
//                    let scene = Level90(fileNamed: "Level90")
//                    let transation = SKTransition.fade(withDuration: 1.0)
//
//                    scene!.scaleMode = .aspectFill
//                    self.view?.presentScene(scene!, transition: transation)
//                    self.centreView.removeFromSuperview()
                })
                level30.setScale(0.4)
                level30.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 130)
                level30.zPosition = 11
                addChild(level30)

                    let cloud = SKEmitterNode(fileNamed: "LevelPurple.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level30.position.x, y: level30.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel89 == false {
                let level30 = SKButton(imageName: "buttonLevel", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                })
                level30.setScale(0.4)
                level30.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 130)
                level30.zPosition = 11
                addChild(level30)
            }

            }
        }
}
