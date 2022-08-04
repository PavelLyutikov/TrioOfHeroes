//
//  MenuScene.swift
//  Trio Of Heroes
//
//  Created by mac on 15.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit
import SpriteKit
import AudioToolbox

@available(iOS 11.0, *)
class MenuScene: GameScene {
    
    var panelBonusOpen: Bool = false
    var panelRemoveAdsOpen: Bool = false
    var nowUpdatePurchaseRemoveAds: Bool = false
    
    var onSetting: SKButton!
    var offSetting: SKButton!
    var musicOffButton: SKButton!
    var musicOnButton: SKButton!
    var soundOffButton: SKButton!
    var soundOnButton: SKButton!
    
    var panel = SKSpriteNode(imageNamed: "settingsBack")
    var panelBuyCoin = SKSpriteNode(imageNamed: "windowBackground")
    var panelRemoveAds = SKSpriteNode(imageNamed: "windowBackground")
    let panelRemoveAdsSuccessfulPurchase = SKSpriteNode(imageNamed: "windowBackground")
    
    var vibrationOffButton: SKButton!
    var vibrationOnButton: SKButton!
    var buttonBonus: SKButton!
    var jumpBonus: SKButton!
    var heart4Bonus: SKButton!
    var heart5Bonus: SKButton!
    var closeButton: SKButton!
    var backgroundCoin: SKButton!
    let coinScoreLabelNode = SKLabelNode(fontNamed: "Antikvar Shadow")
    
    var buttonBuy1000Coin: SKButton!
    
    let animateJumpBonus = SKSpriteNode()
    
    let imageLabelJumpBonus = SKSpriteNode(imageNamed: "imageBonusJump")
    let imageLabelHeartBonus = SKSpriteNode(imageNamed: "imageBonusHeart")
    let imageLabel2HeartBonus = SKSpriteNode(imageNamed: "imageBonus2Heart")
    var labelJumpBonus = SKLabelNode(fontNamed: "Antikvar Shadow")
    var labelHeartBonus = SKLabelNode(fontNamed: "Antikvar Shadow")
    var label2HeartBonus = SKLabelNode(fontNamed: "Antikvar Shadow")
    
//MARK: - DidMove
    override func didMove(to view: SKView) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(MenuScene.spawnSuccessfulPurchase1000Coin), name: NSNotification.Name(rawValue: "successfulPurchase1000Coin"), object: nil)
        
        //UpdatePurchaseRemoveAds
        NotificationCenter.default.addObserver(self, selector: #selector(MenuScene.updatePurchaseRemoveAds), name: NSNotification.Name(rawValue: "updatePurchaseRemoveAds"), object: nil)
        
        //SuccessfulShowRewardVideo
        NotificationCenter.default.addObserver(self, selector: #selector(MenuScene.increaseNumberCoins), name: NSNotification.Name(rawValue: "increaseNumberCoins"), object: nil)
        
        
        if backgroundMusic == true {
            if menuMusicOn == false {
                playBackgroundMenuMusic(fileName: "backMusicMenu.mp3")
                
                UserDefaults.standard.set(true, forKey: "menuMusicOn")
            }
            spawnOffMusic()
        } else if backgroundMusic == false {
            spawnOnMusic()
        }
        
        spawnPlayButton()
        spawnBackground()
        spawnOnSetting()
        spawnCloudAction()
        coinScoreLabel()
        buttonBuyBonus()
        spawnButtonRemoveAds()
        buttonShowRewardVideo()
        
        if buyAnotherBonus == true {
//            createPanelBonus()
            UserDefaults.standard.set(false, forKey: "buyAnotherBonus")
        }
        if bonusJumpScore >= 1 {
            spawnJumpBonusLabel()
        }
        
        if bonusHeartScore >= 1 {
            spawnHeartBonusLabel()
        }
        
        if bonus2HeartScore >= 1 {
            spawn2HeartBonusLabel()
        }
        
        run(SKAction.repeat(SKAction.sequence([SKAction.run(){ [weak self] in
            self?.spawnCloud10()
            self?.spawnCloud11()
            self?.spawnCloud12()
            self?.spawnCloud13()
            self?.spawnCloud14()
            self?.spawnCloud15()
            self?.spawnCloud16()
            }, SKAction.wait(forDuration: 20.0)]), count: 3000))
    }
//MARK: SuccessfulShowRewardVideo
    @objc func increaseNumberCoins() {
        
        animateSuccessfulPurchase1000Coin()
        
        let totalCoinDefault = UserDefaults.standard
        self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
        
        self.coinGame += 50
        totalCoinDefault.setValue(self.coinGame, forKey: "Totalcoin")
        totalCoinDefault.synchronize()
        
        self.coinScoreLabelNode.removeFromParent()
        self.spawnCoinLabel()
    }
//MARK: - ButtonShowRewardVideoBonusCoin
    func buttonShowRewardVideo() {
        var scaleButton: CGFloat!
        var positionX: CGFloat!
        var positionY: CGFloat!
        if totalSize.width >= 800 {
            scaleButton = 0.55
            positionX = -150
            positionY = -75
        } else {
            scaleButton = 0.65
            positionX = -150
            positionY = -80
        }
        
        let btn = SKButton(imageName: "buttonShowRewardVideo", buttonAction: {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showRewardVideo"), object: nil)
        })
        btn.position = CGPoint(x: positionX, y: positionY)
        btn.zPosition = 15
        btn.setScale(scaleButton)
        addChild(btn)
    }
//MARK: - Background
    func spawnBackground() {
        
        var positionY: CGFloat!
        var positionX: CGFloat!
        var scale: CGFloat!
        var scaleLogo: CGFloat!
        var scalePlayBackground: CGFloat!
        var positionGroundBackground: CGFloat!
        if totalSize.width >= 800 {
            positionY = 40
            positionX = 10
            scale = 0.9
            scaleLogo = 0.6
            scalePlayBackground = 0.6
            positionGroundBackground = -120
        } else {
            positionY = 70
            positionX = 0
            scale = 1.0
            scaleLogo = 0.7
            scalePlayBackground = 0.7
            positionGroundBackground = -155
        }
        
        let background = SKSpriteNode(imageNamed: "backgroundMain")
        background.setScale(scale)
        background.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY)
        background.zPosition = 1
        addChild(background)
        
        let groundBackground = SKSpriteNode(imageNamed: "backgroundMainGround")
        groundBackground.setScale(0.6)
        groundBackground.position = CGPoint(x: 0, y: positionGroundBackground)
        groundBackground.zPosition = 3
        addChild(groundBackground)
        
        let scroll = SKSpriteNode(imageNamed: "trioHeroes")
        scroll.setScale(scaleLogo)
        scroll.position = CGPoint(x: self.frame.midX - 10, y: self.frame.midY + positionY)
        scroll.zPosition = 4
        addChild(scroll)
        
        let playBackground = SKSpriteNode(imageNamed: "playBackground")
        playBackground.setScale(scalePlayBackground)
        playBackground.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 30)
        playBackground.zPosition = 3
        addChild(playBackground)
        
        let show = SKEmitterNode(fileNamed: "SnowMainBackground.sks")!
        show.zPosition = 0
        show.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 200)
        addChild(show)
    }
//MARK: - SpawnCoinLabel
    func coinScoreLabel() {
        var positionY: CGFloat!
        var positionX: CGFloat!
        var scale: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 700
            positionX = 880
            scale = 0.45
        } else if totalSize.width >= 800 {
            positionY = 140
            positionX = 260
            scale = 0.4
        } else {
            positionY = 170
            positionX = 260
            scale = 0.45
        }
        //BackgroundCoin
        backgroundCoin = SKButton(imageName: "coinLabelBackground2", buttonAction: {
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            self.createPanelBuyCoin()
        })
        backgroundCoin.setScale(scale)
        backgroundCoin.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY + positionY)
        backgroundCoin.zPosition = 4
        addChild(backgroundCoin)
        
        //BestLabel
        let coinImageNode = SKSpriteNode(imageNamed: "coin/0")
        coinImageNode.position = CGPoint(x: CGFloat(-135), y: CGFloat(17))
        coinImageNode.setScale(0.58)
        coinImageNode.zPosition = 5
        backgroundCoin.addChild(coinImageNode)
        
        spawnCoinLabel()
    }
    func spawnCoinLabel() {
        let coinNowScore = UserDefaults.standard.integer(forKey: "Totalcoin")
        coinScoreLabelNode.text = String(coinNowScore)
        coinScoreLabelNode.fontSize = 50
        coinScoreLabelNode.position = CGPoint(x: CGFloat(45), y: CGFloat(-13))
        coinScoreLabelNode.fontColor = SKColor.black
        coinScoreLabelNode.zPosition = 5
        backgroundCoin.addChild(coinScoreLabelNode)
    }
//MARK: - PanelBuyCoin
        func createPanelBuyCoin() {

            panelBuyCoin.zPosition = 15
            panelBuyCoin.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            panelBuyCoin.xScale = 0.7
            panelBuyCoin.yScale = 0.7
            panelBuyCoin.alpha = 0
            addChild(panelBuyCoin)
            
            let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
            let Increase = SKAction.scale(to: 0.9, duration: 0.2)
            let group = SKAction.group([alphaTo, Increase])
            panelBuyCoin.run(SKAction.sequence([group]))
            
            let panelBackground = SKSpriteNode(imageNamed: "dialogueBackgroundBlack")
            panelBackground.zPosition = 14
            panelBackground.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            panelBackground.xScale = 10
            panelBackground.yScale = 10
            panelBackground.alpha = 0.01
            panelBuyCoin.addChild(panelBackground)
            
            closeButton = SKButton(imageName: "cancelWhite", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                let appear = SKAction.scale(to: 0.95, duration: 0.2)
                
                let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.3)
                let reduce = SKAction.scale(to: 0.7, duration: 0.3)
                let group = SKAction.group([alphaTo, reduce])
                let remove = SKAction.removeFromParent()
                
                self.panelBuyCoin.run(SKAction.sequence([appear, group, remove]))
            })
            closeButton.setScale(0.5)
            closeButton.position = CGPoint(x: panelBuyCoin.position.x + 200, y: panelBuyCoin.position.y + 100)
            closeButton.zPosition = 30
            panelBuyCoin.addChild(closeButton)
            
            //1000Coin
            buttonBuy1000Coin = SKButton(imageName: "buttonBuyCoin", buttonAction: {
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "request1000Coin"), object: nil)
               
            })
            buttonBuy1000Coin.position = CGPoint(x: panelBuyCoin.position.x /*- 140*/, y: panelBuyCoin.position.y)
            buttonBuy1000Coin.setScale(0.5)
            buttonBuy1000Coin.zPosition = 15
            panelBuyCoin.addChild(buttonBuy1000Coin)
            
           let scoreBuy1000CoinLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
            scoreBuy1000CoinLabel.position = CGPoint(x: CGFloat(-25), y: CGFloat(-90))
            scoreBuy1000CoinLabel.text = "1000"
            scoreBuy1000CoinLabel.zPosition = 17
            scoreBuy1000CoinLabel.fontColor = .white
            scoreBuy1000CoinLabel.fontSize = 48
            buttonBuy1000Coin.addChild(scoreBuy1000CoinLabel)
           let imageBuy1000CoinLabel = SKSpriteNode(imageNamed: "coin/21")
            imageBuy1000CoinLabel.position = CGPoint(x: CGFloat(45), y: CGFloat(40))
            imageBuy1000CoinLabel.setScale(1.3)
            imageBuy1000CoinLabel.zPosition = 17
            buttonBuy1000Coin.addChild(imageBuy1000CoinLabel)
            
            let imagePurchasePrice1000CoinLabel = SKSpriteNode(imageNamed: "purchasePrice")
            imagePurchasePrice1000CoinLabel.position = CGPoint(x: CGFloat(0), y: CGFloat(-150))
            imagePurchasePrice1000CoinLabel.setScale(1.4)
            imagePurchasePrice1000CoinLabel.zPosition = 17
             buttonBuy1000Coin.addChild(imagePurchasePrice1000CoinLabel)
            

            
            switch Locale.current.languageCode {
            case "ru":
                let scorePurchasePriceLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
                scorePurchasePriceLabel.position = CGPoint(x: CGFloat(-15), y: CGFloat(-5))
                scorePurchasePriceLabel.text = "99"
                scorePurchasePriceLabel.zPosition = 17
                scorePurchasePriceLabel.fontColor = .white
                scorePurchasePriceLabel.fontSize = 28
                imagePurchasePrice1000CoinLabel.addChild(scorePurchasePriceLabel)
                let imageRubPurchasePrice1000CoinLabel = SKSpriteNode(imageNamed: "rub")
                imageRubPurchasePrice1000CoinLabel.position = CGPoint(x: CGFloat(20), y: CGFloat(0))
                imageRubPurchasePrice1000CoinLabel.setScale(0.15)
                imageRubPurchasePrice1000CoinLabel.zPosition = 17
                imagePurchasePrice1000CoinLabel.addChild(imageRubPurchasePrice1000CoinLabel)
                
            default:
                let scorePurchasePriceLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
                scorePurchasePriceLabel.position = CGPoint(x: CGFloat(-15), y: CGFloat(-5))
                scorePurchasePriceLabel.text = "0,99"
                scorePurchasePriceLabel.zPosition = 17
                scorePurchasePriceLabel.fontColor = .white
                scorePurchasePriceLabel.fontSize = 26
                imagePurchasePrice1000CoinLabel.addChild(scorePurchasePriceLabel)
                let imageRubPurchasePrice1000CoinLabel = SKSpriteNode(imageNamed: "dollar")
                imageRubPurchasePrice1000CoinLabel.position = CGPoint(x: CGFloat(30), y: CGFloat(0))
                imageRubPurchasePrice1000CoinLabel.setScale(0.2)
                imageRubPurchasePrice1000CoinLabel.zPosition = 17
                imagePurchasePrice1000CoinLabel.addChild(imageRubPurchasePrice1000CoinLabel)
            }
        }
//MARK: - SuccessfulPurchase1000Coin
    @objc func spawnSuccessfulPurchase1000Coin() {
        animateSuccessfulPurchase1000Coin()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            let totalCoinDefault = UserDefaults.standard
            self.coinGame = totalCoinDefault.integer(forKey: "Totalcoin")
            
            self.coinGame += 1000
            totalCoinDefault.setValue(self.coinGame, forKey: "Totalcoin")
            totalCoinDefault.synchronize()
            
            self.coinScoreLabelNode.removeFromParent()
            self.spawnCoinLabel()
            }
        
    }
//MARK: - AnimateSuccessfulPurchase1000Coin
    func animateSuccessfulPurchase1000Coin() {
        Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { (timer) in
            if self.sound == true {
                self.run(Sound.bonus.action)
            }
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            if self.sound == true {
                self.run(Sound.coins.action)
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.55, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
            }
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                if self.sound == true {
                    self.run(Sound.coins.action)
                }
            }
        }
        
        let image = SKSpriteNode(imageNamed: "coin/0")
        image.position = CGPoint(x: self.frame.midX - 10, y: self.frame.midY + 30)
        image.zPosition = 300
        image.setScale(0.5)
        addChild(image)
        
        var textures: [SKTexture] = []
                for i in 1...21 {
                    textures.append(SKTexture(imageNamed: "coin/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.05)
        let appear = SKAction.scale(to: 1.2, duration: 1.2)
        let disappear = SKAction.scale(to: 0, duration: 0.5)
        let removeFromParent = SKAction.removeFromParent()
        let actions = [appear,action, disappear, removeFromParent]
        image.run(SKAction.sequence(actions))
    }
//MARK: - PlayButton
    func spawnPlayButton() {
        var scalePlayButton: CGFloat!
        var positionYPlayButton: CGFloat!
        if totalSize.width >= 800 {
            scalePlayButton = 0.5
            positionYPlayButton = -73
        } else {
            scalePlayButton = 0.6
            positionYPlayButton = -80
        }
        let play = SKButton(imageName: "playButton", buttonAction: {
            UserDefaults.standard.set(0, forKey: "levelNumber")
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            
            if self.winLevel60 == true {
                let scene = MenuLevel61_90(fileNamed: "MenuLevel61_90")

                let transition = SKTransition.fade(withDuration: 1)
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transition)
            } else {
                if self.winLevel30 == true {
                    let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")

                    let transition = SKTransition.fade(withDuration: 1)
                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transition)
                } else if self.winLevel30 == false {
                    let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")

                    let transition = SKTransition.fade(withDuration: 1)
                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transition)
                }
            }
        })
        play.position = CGPoint(x: 5, y: positionYPlayButton)
        play.zPosition = 10
        play.setScale(scalePlayButton)
        addChild(play)
    }
// MARK: - SpawnOnMusic
        func spawnOnMusic() {
            
            var positionY: CGFloat!
            var positionX: CGFloat!

            if totalSize.width >= 1000 {

                positionY = 680
                positionX = 920

            } else if totalSize.width >= 800 {
                positionY = 90
                positionX = 300

            } else {
                positionY = 100
                positionX = 320

            }
            
            musicOnButton = SKButton(imageName: "musicOff", buttonAction: {
                
                UserDefaults.standard.set(true, forKey: "backgroundMusic")
                self.musicOnButton.removeFromParent()
                self.spawnOffMusic()
                playBackgroundMenuMusic(fileName: "backMusicMenu.mp3")
                
            })
            musicOnButton.setScale(0.1)
            musicOnButton.zPosition = 10
            musicOnButton.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
            musicOnButton.alpha = 0
            addChild(musicOnButton)
            
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
                let Increase = SKAction.scale(to: 0.3, duration: 0.2)
                let group = SKAction.group([alphaTo, Increase])
                self.musicOnButton.run(SKAction.sequence([group]))
            }
        }
//MARK: - SpawnOffMusic
    func spawnOffMusic() {
        
        var positionY: CGFloat!
        var positionX: CGFloat!

        if totalSize.width >= 1000 {

            positionY = 680
            positionX = 920

        } else if totalSize.width >= 800 {
            positionY = 90
            positionX = 300

        } else {
            positionY = 100
            positionX = 320

        }
        
        musicOffButton = SKButton(imageName: "music", buttonAction: {
            
            UserDefaults.standard.set(false, forKey: "backgroundMusic")
            
            self.musicOffButton.removeFromParent()
            self.spawnOnMusic()
            backgroungMenuMusicPlayer.stop()
        })
        musicOffButton.setScale(0.1)
        musicOffButton.zPosition = 10
        musicOffButton.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
        musicOffButton.alpha = 0
        addChild(musicOffButton)
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
            let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
            let Increase = SKAction.scale(to: 0.3, duration: 0.2)
            let group = SKAction.group([alphaTo, Increase])
            self.musicOffButton.run(SKAction.sequence([group]))
        }
    }
// MARK: - SpawnSetting
        func spawnOnSetting() {
            
            var positionY: CGFloat!
            var positionX: CGFloat!

            if totalSize.width >= 1000 {

                positionY = 680
                positionX = 920

            } else if totalSize.width >= 800 {
                positionY = 140
                positionX = 300

            } else {
                positionY = 160
                positionX = 320

            }
            
            onSetting = SKButton(imageName: "settings", buttonAction: {
                self.onSetting.removeFromParent()
                self.spawnOffSetting()
                self.createPanel()
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                    self.spawnMusicOffButton()
                } else if self.sound == false {
                    self.spawnMusicOnButton()
                }
                if self.vibration == true {
                    self.spawnVibrationOffButton()
                } else if self.vibration == false {
                    self.spawnVibrationOnButton()
                }
                
                
                
            })
            onSetting.setScale(0.1)
            onSetting.zPosition = 10
            onSetting.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
            onSetting.alpha = 0
            addChild(onSetting)
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
                let Increase = SKAction.scale(to: 0.35, duration: 0.2)
                let group = SKAction.group([alphaTo, Increase])
                self.onSetting.run(SKAction.sequence([group]))
            }
        }
//MARK: - SpawnOffSetting
    func spawnOffSetting() {
        
        offSetting = SKButton(imageName: "close", buttonAction: {
            self.spawnOnSetting()
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            
            let appear = SKAction.scale(to: 0.95, duration: 0.2)
            let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let reduce = SKAction.scale(to: 0.2, duration: 0.3)
            let group = SKAction.group([alphaTo, reduce])
            let remove = SKAction.removeFromParent()
            self.panel.run(SKAction.sequence([appear, group, remove]))
        })
        offSetting.setScale(0.9)
        offSetting.zPosition = 10
        offSetting.position = CGPoint(x: CGFloat(75), y: CGFloat(0))
            panel.addChild(offSetting)
    }
//MARK: - Panel
        func createPanel() {
            var positionY: CGFloat!
            var positionX: CGFloat!
            if totalSize.width >= 1000 {
                positionY = 680
                positionX = 680
            } else if totalSize.width >= 800 {
                positionY = 140
                positionX = 240
            } else {
                positionY = 160
                positionX = 260
            }
            
            panel.zPosition = 5
            panel.name = "settingsBack"
            panel.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
            panel.xScale = 0.2
            panel.yScale = 0.2
            panel.alpha = 0
            addChild(panel)
            
            let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
            let Increase = SKAction.scale(to: 0.8, duration: 0.2)
            let group = SKAction.group([alphaTo, Increase])
            panel.run(SKAction.sequence([group]))
        }
     
//MARK:- MusicOffButton
    func spawnMusicOffButton() {
        
         soundOffButton = SKButton(imageName: "volume", buttonAction: {
            if self.sound == true {
                self.soundOffButton.removeFromParent()
                self.spawnMusicOnButton()
                
                UserDefaults.standard.set(false, forKey: "sound")
                self.sound = false
            }
         })
         soundOffButton.position = CGPoint(x: CGFloat(20), y: CGFloat(0))
         soundOffButton.xScale = -0.4
         soundOffButton.yScale = 0.4
         soundOffButton.zPosition = 10
         panel.addChild(self.soundOffButton)
    }
//MARK:- MusicOnButton
        func spawnMusicOnButton() {
            
             soundOnButton = SKButton(imageName: "muted", buttonAction: {
            
                
                if self.sound == false {
                    self.soundOnButton.removeFromParent()
                    self.spawnMusicOffButton()
                    self.run(Sound.pop.action)
         
                    UserDefaults.standard.set(true, forKey: "sound")
                    self.sound = true
                }

             })
            soundOnButton.position = CGPoint(x: CGFloat(20), y: CGFloat(0))
            soundOnButton.xScale = -0.4
            soundOnButton.yScale = 0.4
            soundOnButton.zPosition = 10
            panel.addChild(self.soundOnButton)
            }
//MARK:- VibrationOffButton
        func spawnVibrationOffButton() {
             vibrationOffButton = SKButton(imageName: "vibrate", buttonAction: {
            
                
                if self.vibration == true {
                    self.vibrationOffButton.removeFromParent()
                    self.spawnVibrationOnButton()
                    
                    UserDefaults.standard.set(false, forKey: "vibration")
                    self.vibration = false
                }
                
                if self.sound == true {
                    self.run(Sound.pop.action)
               }

             })
            
            vibrationOffButton.position = CGPoint(x: CGFloat(-50), y: CGFloat(-2))
            vibrationOffButton.setScale(0.4)
            vibrationOffButton.zPosition = 10
            panel.addChild(self.vibrationOffButton)
        }
//MARK:- VibrationOnButton
        func spawnVibrationOnButton() {
             vibrationOnButton = SKButton(imageName: "vibrateOff", buttonAction: {
            
                if self.vibration == false {
                    self.vibrationOnButton.removeFromParent()
                    self.spawnVibrationOffButton()

                    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                    
                    UserDefaults.standard.set(true, forKey: "vibration")
                    self.vibration = true
                }
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
             })
            vibrationOnButton.position = CGPoint(x: CGFloat(-50), y: CGFloat(-2))
            vibrationOnButton.setScale(0.4)
            vibrationOnButton.zPosition = 10
            panel.addChild(self.vibrationOnButton)
            }
    
// MARK: - ButtonBuyBonus
        func buttonBuyBonus() {
            var positionY: CGFloat!
            var positionX: CGFloat!
            var scaleButton: CGFloat!
            if totalSize.width >= 1000 {
                positionY = 680
                positionX = 920
                scaleButton = 0.5
            } else if totalSize.width >= 800 {
                positionY = -72
                positionX = 130
                scaleButton = 0.4
            } else {
                positionY = -78
                positionX = 130
                scaleButton = 0.5
            }
            
            buttonBonus = SKButton(imageName: "shop", buttonAction: {

                let scene = ShopScene(fileNamed: "ShopScene")
                
                let transition = SKTransition.push(with: .up, duration: 1.0)
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transition)
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
            })
            buttonBonus.setScale(scaleButton)
            buttonBonus.zPosition = 10
            buttonBonus.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
            addChild(buttonBonus)
        }
//MARK: - JumpBonusLabel
    func spawnJumpBonusLabel() {
        var positionY: CGFloat!
        var positionX: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 700
            positionX = 880
        } else if totalSize.width >= 800 {
            if bonusHeartScore == 0 && bonus2HeartScore == 0 {
                positionY = 60
                positionX = 300
            } else {
                positionY = -20
                positionX = 300
            }
        } else {
            if bonusHeartScore == 0 && bonus2HeartScore == 0 {
                positionY = 60
                positionX = 320
            } else {
                positionY = -20
                positionX = 320
            }
        }
        
        imageLabelJumpBonus.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY + positionY)
        imageLabelJumpBonus.zPosition = 15
        imageLabelJumpBonus.setScale(0.1)
        imageLabelJumpBonus.alpha = 0
        addChild(imageLabelJumpBonus)
        
        labelJumpBonus = SKLabelNode(text: "\(bonusJumpScore)")
        labelJumpBonus.position = CGPoint(x: CGFloat(-80), y: CGFloat(50))
        labelJumpBonus.zPosition = 20
        labelJumpBonus.fontColor = .white
        labelJumpBonus.fontSize = 140
        imageLabelJumpBonus.addChild(labelJumpBonus)
        
        
            let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
            let Increase = SKAction.scale(to: 0.3, duration: 0.2)
            let group = SKAction.group([alphaTo, Increase])
            self.imageLabelJumpBonus.run(SKAction.sequence([group]))
        
    }
//MARK: - HeartBonusLabel
    func spawnHeartBonusLabel() {
        var positionY: CGFloat!
        var positionX: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 700
            positionX = 880
        } else if totalSize.width >= 800 {
            positionY = 60
            positionX = 300
        } else {
            positionY = 60
            positionX = 320
        }
        
        imageLabelHeartBonus.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY + positionY)
        imageLabelHeartBonus.zPosition = 15
        imageLabelHeartBonus.setScale(0.1)
        imageLabelHeartBonus.alpha = 0
        addChild(imageLabelHeartBonus)
        
        labelHeartBonus = SKLabelNode(text: "\(bonusHeartScore)")
        labelHeartBonus.position = CGPoint(x: CGFloat(-80), y: CGFloat(50))
        labelHeartBonus.zPosition = 20
        labelHeartBonus.fontColor = .white
        labelHeartBonus.fontSize = 140
        imageLabelHeartBonus.addChild(labelHeartBonus)
        
        let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
        let Increase = SKAction.scale(to: 0.3, duration: 0.2)
        let group = SKAction.group([alphaTo, Increase])
        self.imageLabelHeartBonus.run(SKAction.sequence([group]))
    }
//MARK: - 2HeartBonusLabel
    func spawn2HeartBonusLabel() {
        var positionY: CGFloat!
        var positionX: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 700
            positionX = 880
        } else if totalSize.width >= 800 {
            positionY = 60
            positionX = 300
        } else {
            positionY = 60
            positionX = 320
        }
        
        imageLabel2HeartBonus.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY + positionY)
        imageLabel2HeartBonus.zPosition = 15
        imageLabel2HeartBonus.setScale(0.1)
        imageLabel2HeartBonus.alpha = 0
        addChild(imageLabel2HeartBonus)
        
        label2HeartBonus = SKLabelNode(text: "\(bonus2HeartScore)")
        label2HeartBonus.position = CGPoint(x: CGFloat(-80), y: CGFloat(50))
        label2HeartBonus.zPosition = 20
        label2HeartBonus.fontColor = .white
        label2HeartBonus.fontSize = 140
        imageLabel2HeartBonus.addChild(label2HeartBonus)
        
        let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
        let Increase = SKAction.scale(to: 0.3, duration: 0.2)
        let group = SKAction.group([alphaTo, Increase])
        self.imageLabel2HeartBonus.run(SKAction.sequence([group]))
    }
//MARK: - InAppPurchase
    @objc func updatePurchaseRemoveAds() {
        nowUpdatePurchaseRemoveAds = true
        
        panelRemoveAds.removeFromParent()
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            self.spawnPanelRemoveAdsSuccessfulPurchase()
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                self.spawnActionBuyRemoveAds()
            }
        }
    }
    func spawnActionBuyRemoveAds() {
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            if self.sound == true {
                self.run(Sound.bonus.action)
            }
        }
        
        let image = SKSpriteNode(imageNamed: "buttonRemoveAdsFull")
        image.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        image.zPosition = 300
        image.setScale(0.1)
        addChild(image)
        
        let appear = SKAction.scale(to: 0.6, duration: 1.2)

        let leftWiggle = SKAction.rotate(byAngle: 18.86, duration: 0.5)
        
        let group = SKAction.group([leftWiggle, appear])

        let disappear = SKAction.scale(to: 0, duration: 0.5)
        let removeFromParent = SKAction.removeFromParent()
        let actions = [group, disappear, removeFromParent]
        image.run(SKAction.sequence(actions))
    }
    func spawnButtonRemoveAds() {
        
        var positionY: CGFloat!
        var positionX: CGFloat!
        if totalSize.width >= 1000 {
            positionY = 680
            positionX = 920
        } else if totalSize.width >= 800 {
            positionY = 40
            positionX = 300
        } else {
            positionY = 40
            positionX = 320
        }
        
        let removeAdd = SKButton(imageName: "buttonCreatPanelRemoveAds", buttonAction: {
            
            if self.nowUpdatePurchaseRemoveAds == true {
                self.spawnPanelRemoveAdsSuccessfulPurchase()
            } else {
                if self.successfulPurchaseRemoveAds == true {
                    self.spawnPanelRemoveAdsSuccessfulPurchase()
                } else {
                    self.spawnPanelRemoveAds()
                }
            }
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
        })
        removeAdd.setScale(0.1)
        removeAdd.zPosition = 10
        removeAdd.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
        removeAdd.alpha = 0
        addChild(removeAdd)
        
        Timer.scheduledTimer(withTimeInterval: 1.4, repeats: false) { (timer) in
            let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
            let Increase = SKAction.scale(to: 0.35, duration: 0.2)
            let group = SKAction.group([alphaTo, Increase])
            removeAdd.run(SKAction.sequence([group]))
        }
    }
    //Panel
    func spawnPanelRemoveAds() {
        panelRemoveAds.zPosition = 15
        panelRemoveAds.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        panelRemoveAds.xScale = 0.4
        panelRemoveAds.yScale = 0.4
        panelRemoveAds.alpha = 0
        addChild(panelRemoveAds)
        
        let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
        let Increase = SKAction.scale(to: 0.6, duration: 0.2)
        let group = SKAction.group([alphaTo, Increase])
        panelRemoveAds.run(SKAction.sequence([group]))
        
        let panelBackground = SKSpriteNode(imageNamed: "dialogueBackgroundBlack")
        panelBackground.zPosition = 14
        panelBackground.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        panelBackground.xScale = 16
        panelBackground.yScale = 16
        panelBackground.alpha = 0.01
        panelRemoveAds.addChild(panelBackground)
        
        let closeBtn = SKButton(imageName: "cancelWhite", buttonAction: {
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            
            let appear = SKAction.scale(to: 0.7, duration: 0.2)
            
            let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let reduce = SKAction.scale(to: 0.3, duration: 0.3)
            let group = SKAction.group([alphaTo, reduce])
            let remove = SKAction.removeFromParent()
            
            self.panelRemoveAds.run(SKAction.sequence([appear, group, remove]))
        })
        closeBtn.setScale(0.65)
        closeBtn.position = CGPoint(x: panelRemoveAds.position.x + 200, y: panelRemoveAds.position.y + 100)
        closeBtn.zPosition = 15
        panelRemoveAds.addChild(closeBtn)
        
                //Buy
                let buyRemoveAds = SKButton(imageName: "buttonRemoveAds", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "requestPurchase"), object: nil)
                    
                })
                buyRemoveAds.setScale(0.6)
                buyRemoveAds.position = CGPoint(x: panelRemoveAds.position.x, y: panelRemoveAds.position.y + 10)
                buyRemoveAds.zPosition = 15
                panelRemoveAds.addChild(buyRemoveAds)
                
                
                let animateBuyRemoveButton = SKSpriteNode(imageNamed: "buttonRemoveAdsAction/0")
                animateBuyRemoveButton.setScale(0.5)
                animateBuyRemoveButton.zPosition = 16
                animateBuyRemoveButton.position = CGPoint(x: panelRemoveAds.position.x, y: panelRemoveAds.position.y)
                buyRemoveAds.addChild(animateBuyRemoveButton)
            
                
                if panelRemoveAdsOpen == false {
                Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { (timer) in
                    var textures: [SKTexture] = []
                        for i in 0...19 {
                            textures.append(SKTexture(imageNamed: "buttonRemoveAdsAction/\(i)"))
                        }

                    let action = SKAction.animate(with: textures, timePerFrame: 0.05)
                    animateBuyRemoveButton.run(SKAction.sequence([action]))
                    }
                    panelRemoveAdsOpen = true
                }
        
                let imagePurchasePriceRemoveAdsLabel = SKSpriteNode(imageNamed: "purchasePrice")
                imagePurchasePriceRemoveAdsLabel.position = CGPoint(x: CGFloat(0), y: CGFloat(-150))
                imagePurchasePriceRemoveAdsLabel.setScale(1.7)
                imagePurchasePriceRemoveAdsLabel.zPosition = 17
                buyRemoveAds.addChild(imagePurchasePriceRemoveAdsLabel)
                

                
                switch Locale.current.languageCode {
                case "ru":
                    let scorePurchasePriceLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
                    scorePurchasePriceLabel.position = CGPoint(x: CGFloat(-15), y: CGFloat(-5))
                    scorePurchasePriceLabel.text = "99"
                    scorePurchasePriceLabel.zPosition = 17
                    scorePurchasePriceLabel.fontColor = .white
                    scorePurchasePriceLabel.fontSize = 28
                    imagePurchasePriceRemoveAdsLabel.addChild(scorePurchasePriceLabel)
                    let imageRubPurchasePrice1000CoinLabel = SKSpriteNode(imageNamed: "rub")
                    imageRubPurchasePrice1000CoinLabel.position = CGPoint(x: CGFloat(20), y: CGFloat(0))
                    imageRubPurchasePrice1000CoinLabel.setScale(0.15)
                    imageRubPurchasePrice1000CoinLabel.zPosition = 17
                    imagePurchasePriceRemoveAdsLabel.addChild(imageRubPurchasePrice1000CoinLabel)
                    
                default:
                    let scorePurchasePriceLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
                    scorePurchasePriceLabel.position = CGPoint(x: CGFloat(-15), y: CGFloat(-5))
                    scorePurchasePriceLabel.text = "0,99"
                    scorePurchasePriceLabel.zPosition = 17
                    scorePurchasePriceLabel.fontColor = .white
                    scorePurchasePriceLabel.fontSize = 26
                    imagePurchasePriceRemoveAdsLabel.addChild(scorePurchasePriceLabel)
                    let imageRubPurchasePriceRemoveAdsLabel = SKSpriteNode(imageNamed: "dollar")
                    imageRubPurchasePriceRemoveAdsLabel.position = CGPoint(x: CGFloat(30), y: CGFloat(0))
                    imageRubPurchasePriceRemoveAdsLabel.setScale(0.2)
                    imageRubPurchasePriceRemoveAdsLabel.zPosition = 17
                    imagePurchasePriceRemoveAdsLabel.addChild(imageRubPurchasePriceRemoveAdsLabel)
                }

                
                //Remove
                let remove = SKButton(imageName: "remove", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "restorePurchases"), object: nil)
                    
                })
                remove.setScale(1)
                remove.position = CGPoint(x: buyRemoveAds.position.x + 240, y: buyRemoveAds.position.y)
                remove.zPosition = 15
                buyRemoveAds.addChild(remove)
    }
//MARK: - PanelRemoveAdsSuccessfulPurchase
    func spawnPanelRemoveAdsSuccessfulPurchase() {
        panelRemoveAdsSuccessfulPurchase.zPosition = 15
        panelRemoveAdsSuccessfulPurchase.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        panelRemoveAdsSuccessfulPurchase.xScale = 0.4
        panelRemoveAdsSuccessfulPurchase.yScale = 0.4
        panelRemoveAdsSuccessfulPurchase.alpha = 0
        addChild(panelRemoveAdsSuccessfulPurchase)
        
        let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.2)
        let Increase = SKAction.scale(to: 0.6, duration: 0.2)
        let group = SKAction.group([alphaTo, Increase])
        panelRemoveAdsSuccessfulPurchase.run(SKAction.sequence([group]))
        
        let panelBackground = SKSpriteNode(imageNamed: "dialogueBackgroundBlack")
        panelBackground.zPosition = 14
        panelBackground.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        panelBackground.xScale = 16
        panelBackground.yScale = 16
        panelBackground.alpha = 0.01
        panelRemoveAdsSuccessfulPurchase.addChild(panelBackground)
        
        let closeBtn = SKButton(imageName: "cancelWhite", buttonAction: {
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            
            let appear = SKAction.scale(to: 0.7, duration: 0.2)
            
            let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let reduce = SKAction.scale(to: 0.3, duration: 0.3)
            let group = SKAction.group([alphaTo, reduce])
            let remove = SKAction.removeFromParent()
            
            self.panelRemoveAdsSuccessfulPurchase.run(SKAction.sequence([appear, group, remove]))
        })
        closeBtn.setScale(0.65)
        closeBtn.position = CGPoint(x: panelRemoveAdsSuccessfulPurchase.position.x + 200, y: panelRemoveAdsSuccessfulPurchase.position.y + 100)
        closeBtn.zPosition = 15
        panelRemoveAdsSuccessfulPurchase.addChild(closeBtn)
        
                //Buy
                let buyRemoveAds = SKButton(imageName: "buttonRemoveAds", buttonAction: {
                    if self.sound == true {
                        self.run(Sound.close.action)
                    }
                    
                })
                buyRemoveAds.setScale(0.6)
                buyRemoveAds.position = CGPoint(x: panelRemoveAdsSuccessfulPurchase.position.x, y: panelRemoveAdsSuccessfulPurchase.position.y + 10)
                buyRemoveAds.zPosition = 15
                buyRemoveAds.alpha = 0.7
                panelRemoveAdsSuccessfulPurchase.addChild(buyRemoveAds)
                
                
                let animateBuyRemoveButton = SKSpriteNode(imageNamed: "buttonRemoveAdsAction/0")
                animateBuyRemoveButton.setScale(0.5)
                animateBuyRemoveButton.zPosition = 16
                animateBuyRemoveButton.position = CGPoint(x: panelRemoveAdsSuccessfulPurchase.position.x, y: panelRemoveAdsSuccessfulPurchase.position.y)
                buyRemoveAds.addChild(animateBuyRemoveButton)
            
                
                if panelRemoveAdsOpen == false {
                Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { (timer) in
                    var textures: [SKTexture] = []
                        for i in 0...19 {
                            textures.append(SKTexture(imageNamed: "buttonRemoveAdsAction/\(i)"))
                        }

                    let action = SKAction.animate(with: textures, timePerFrame: 0.05)
                    animateBuyRemoveButton.run(SKAction.sequence([action]))
                    }
                    panelRemoveAdsOpen = true
                }
    }
//MARK: - CloudAction
    func spawnCloudAction() {
        //1
        let cloud1 = SKSpriteNode(imageNamed: "cloud")
        cloud1.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 160)
        cloud1.zPosition = 3
        cloud1.setScale(0.6)
        addChild(cloud1)
        
        let action = SKAction.moveTo(x: -500, duration: 25)
        let remove = SKAction.removeFromParent()
        cloud1.run(SKAction.sequence([action, remove]))
        
        //2
        let cloud2 = SKSpriteNode(imageNamed: "cloud2")
        cloud2.position = CGPoint(x: self.frame.midX - 100, y: self.frame.midY + 120)
        cloud2.zPosition = 3
        cloud2.setScale(0.6)
        addChild(cloud2)
        
        let action2 = SKAction.moveTo(x: -500, duration: 20)
        let remove2 = SKAction.removeFromParent()
        cloud2.run(SKAction.sequence([action2, remove2]))
        
        //3
        let cloud3 = SKSpriteNode(imageNamed: "cloud3")
        cloud3.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY + 170)
        cloud3.zPosition = 3
        cloud3.setScale(0.6)
        addChild(cloud3)
        
        let action3 = SKAction.moveTo(x: -500, duration: 19)
        let remove3 = SKAction.removeFromParent()
        cloud3.run(SKAction.sequence([action3, remove3]))
        
        //4
        let cloud4 = SKSpriteNode(imageNamed: "cloud4")
        cloud4.position = CGPoint(x: self.frame.midX + 100, y: self.frame.midY + 100)
        cloud4.zPosition = 3
        cloud4.setScale(0.6)
        addChild(cloud4)
        
        let action4 = SKAction.moveTo(x: -500, duration: 30)
        let remove4 = SKAction.removeFromParent()
        cloud4.run(SKAction.sequence([action4, remove4]))
        
        //5
        let cloud5 = SKSpriteNode(imageNamed: "cloud5")
        cloud5.position = CGPoint(x: self.frame.midX + 200, y: self.frame.midY + 140)
        cloud5.zPosition = 3
        cloud5.setScale(0.6)
        addChild(cloud5)
        
        let action5 = SKAction.moveTo(x: -500, duration: 28)
        let remove5 = SKAction.removeFromParent()
        cloud5.run(SKAction.sequence([action5, remove5]))
        
        //6
        let cloud6 = SKSpriteNode(imageNamed: "cloud6")
        cloud6.position = CGPoint(x: self.frame.midX - 280, y: self.frame.midY + 130)
        cloud6.zPosition = 3
        cloud6.setScale(0.6)
        addChild(cloud6)
        
        let action6 = SKAction.moveTo(x: -500, duration: 10)
        let remove6 = SKAction.removeFromParent()
        cloud6.run(SKAction.sequence([action6, remove6]))
        
        //7
        let cloud7 = SKSpriteNode(imageNamed: "cloud7")
        cloud7.position = CGPoint(x: self.frame.midX + 300, y: self.frame.midY + 90)
        cloud7.zPosition = 3
        cloud7.setScale(0.6)
        addChild(cloud7)
        
        let action7 = SKAction.moveTo(x: -500, duration: 36)
        let remove7 = SKAction.removeFromParent()
        cloud7.run(SKAction.sequence([action7, remove7]))
        
        //8
        let cloud8 = SKSpriteNode(imageNamed: "cloud8")
        cloud8.position = CGPoint(x: self.frame.midX + 360, y: self.frame.midY + 170)
        cloud8.zPosition = 3
        cloud8.setScale(0.6)
        addChild(cloud8)
        
        let action8 = SKAction.moveTo(x: -500, duration: 40)
        let remove8 = SKAction.removeFromParent()
        cloud8.run(SKAction.sequence([action8, remove8]))
        
        //9
        let cloud9 = SKSpriteNode(imageNamed: "cloud")
        cloud9.position = CGPoint(x: self.frame.midX + 450, y: self.frame.midY + 130)
        cloud9.zPosition = 3
        cloud9.setScale(0.6)
        addChild(cloud9)
        
        let action9 = SKAction.moveTo(x: -500, duration: 40)
        let remove9 = SKAction.removeFromParent()
        let sequence9 = SKAction.sequence([action9, remove9])
        let repeat9 = SKAction.repeatForever(sequence9)
        cloud9.run(SKAction.sequence([repeat9]))
    }
        //10
        func spawnCloud10() {
        let cloud10 = SKSpriteNode(imageNamed: "cloud2")
        cloud10.position = CGPoint(x: self.frame.midX + 570, y: self.frame.midY + 170)
        cloud10.zPosition = 3
        cloud10.setScale(0.6)
        addChild(cloud10)
        
        let action = SKAction.moveTo(x: -500, duration: 49)
        let remove = SKAction.removeFromParent()
        cloud10.run(SKAction.sequence([action, remove]))
    }
        //11
        func spawnCloud11() {
        let cloud11 = SKSpriteNode(imageNamed: "cloud3")
        cloud11.position = CGPoint(x: self.frame.midX + 650, y: self.frame.midY + 90)
        cloud11.zPosition = 3
        cloud11.setScale(0.6)
        addChild(cloud11)
        
        let action = SKAction.moveTo(x: -500, duration: 50)
        let remove = SKAction.removeFromParent()
        cloud11.run(SKAction.sequence([action, remove]))
    }
        //12
        func spawnCloud12() {
        let cloud12 = SKSpriteNode(imageNamed: "cloud4")
        cloud12.position = CGPoint(x: self.frame.midX + 800, y: self.frame.midY + 100)
        cloud12.zPosition = 3
        cloud12.setScale(0.6)
        addChild(cloud12)
        
        let action = SKAction.moveTo(x: -500, duration: 59)
        let remove = SKAction.removeFromParent()
        cloud12.run(SKAction.sequence([action, remove]))
    }
        //13
        func spawnCloud13() {
        let cloud13 = SKSpriteNode(imageNamed: "cloud5")
        cloud13.position = CGPoint(x: self.frame.midX + 850, y: self.frame.midY + 170)
        cloud13.zPosition = 3
        cloud13.setScale(0.6)
        addChild(cloud13)
        
        let action = SKAction.moveTo(x: -500, duration: 63)
        let remove = SKAction.removeFromParent()
        cloud13.run(SKAction.sequence([action, remove]))
    }
    
        //14
        func spawnCloud14() {
        let cloud14 = SKSpriteNode(imageNamed: "cloud6")
        cloud14.position = CGPoint(x: self.frame.midX + 970, y: self.frame.midY + 100)
        cloud14.zPosition = 3
        cloud14.setScale(0.6)
        addChild(cloud14)
        
        let action = SKAction.moveTo(x: -500, duration: 52)
        let remove = SKAction.removeFromParent()
        cloud14.run(SKAction.sequence([action, remove]))
    }
    
        //15
        func spawnCloud15() {
        let cloud15 = SKSpriteNode(imageNamed: "cloud7")
        cloud15.position = CGPoint(x: self.frame.midX + 1100, y: self.frame.midY + 130)
        cloud15.zPosition = 3
        cloud15.setScale(0.6)
        addChild(cloud15)
        
        let action = SKAction.moveTo(x: -500, duration: 60)
        let remove = SKAction.removeFromParent()
        cloud15.run(SKAction.sequence([action, remove]))
    }
        //16
        func spawnCloud16() {
        let cloud16 = SKSpriteNode(imageNamed: "cloud7")
        cloud16.position = CGPoint(x: self.frame.midX + 1200, y: self.frame.midY + 160)
        cloud16.zPosition = 3
        cloud16.setScale(0.6)
        addChild(cloud16)
        
        let action = SKAction.moveTo(x: -500, duration: 62)
        let remove = SKAction.removeFromParent()
        cloud16.run(SKAction.sequence([action, remove]))
    }
}


