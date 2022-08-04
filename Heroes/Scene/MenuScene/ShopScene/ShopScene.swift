//
//  ShopScene.swift
//  Heroes
//
//  Created by Pavel Lyutikov on 20.02.2021.
//

import UIKit
import SpriteKit

@available(iOS 11.0, *)
class ShopScene: GameScene {

    var archerSkinButton: SKButton!
    var bonusButton: SKButton!
    let archerSkinPanel1 = SKSpriteNode()
    let panelBonus = SKSpriteNode()
    var jumpBonus: SKButton!
    var heart4Bonus: SKButton!
    var heart5Bonus: SKButton!
    var backgroundCoin: SKButton!
    let coinScoreLabelNode = SKLabelNode(fontNamed: "Antikvar Shadow")
    var panelBuyCoin = SKSpriteNode(imageNamed: "windowBackground")
    var buttonBuy1000Coin: SKButton!
    var closeButton: SKButton!
    let choiceSkin = SKSpriteNode(imageNamed: "purchased")
    var buttonSkin1: SKButton!
    var buttonSkin2: SKButton!
    var buttonSkin3: SKButton!
    
    var openBonusPanel: Bool = true
    var openArcherSkinPanel: Bool = false
    var oneOpen: Bool = false
    var oneOpenSkinPanel: Bool = false
    
    override func didMove(to view: SKView) {
        downloadUIScene()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ShopScene.spawnSuccessfulPurchase1000Coin), name: NSNotification.Name(rawValue: "successfulPurchase1000Coin"), object: nil)
    }
//MARK: - DownloadUI
    func downloadUIScene() {
        if self.sound == true {
            self.run(Sound.shop.action)
        }
        
        spawnPlayerSkin()
        spawnDismissButton()
        spawnBackground()
        bonusButtonPanel()
        coinScoreLabel()
        
        createPanelBonus()
        spawnArcherSkinPanel()
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
        let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.4)
        let moveY = SKAction.moveTo(y: -10, duration: 0.4)
        let group = SKAction.group([alphaTo, moveY])
        self.panelBonus.run(SKAction.sequence([group]))
        }
    }
//MARK: - DismissButton
    func spawnDismissButton() {
        var positionX: CGFloat!
        var positionY: CGFloat!
        var scale: CGFloat
        if totalSize.width >= 800 {
            positionX = -330
            positionY = 140
            scale = 0.5
        } else {
            positionX = -330
            positionY = 170
            scale = 0.6
        }
        let button = SKButton(imageName: "cancelWhite", buttonAction: {
            let scene = MenuScene(fileNamed: "MenuScene")
            
            let transition = SKTransition.push(with: .down, duration: 1.0)
            scene!.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
        })
        button.setScale(scale)
        button.position = CGPoint(x: positionX, y: positionY)
        button.zPosition = 4
        addChild(button)
    }
//MARK: - Background
    func spawnBackground() {
        backgroundColor = .darkGray
        
        var positionGroundBackground: CGFloat!
        if totalSize.width >= 800 {
            positionGroundBackground = 225
        } else {
            positionGroundBackground = 260
        }
        
        let groundBackground = SKSpriteNode(imageNamed: "backgroundMainGround")
        groundBackground.setScale(0.6)
        groundBackground.position = CGPoint(x: 0, y: positionGroundBackground)
        groundBackground.zPosition = 1
        addChild(groundBackground)
        
        var scaleRack: CGFloat!
        var positionTable1Y: CGFloat!
        var positionTable1X: CGFloat!
        var positionTable2Y: CGFloat!
        var positionTable2X: CGFloat!
        var positionTable3Y: CGFloat!
        var positionTable3X: CGFloat!
        var positionTable4Y: CGFloat!
        var positionTable4X: CGFloat!
        var positionTable5Y: CGFloat!
        var positionTable5X: CGFloat!
        var positionTable6Y: CGFloat!
        var positionTable6X: CGFloat!
        var positionTable7Y: CGFloat!
        var positionTable7X: CGFloat!
        var positionTable8Y: CGFloat!
        var positionTable8X: CGFloat!
        var scaleTable: CGFloat!
        if totalSize.width >= 800 {
            scaleRack = 0.53
            scaleTable = 0.6
            positionTable1Y = -52
            positionTable1X = -213
            positionTable2Y = -52
            positionTable2X = -69
            positionTable3Y = -52
            positionTable3X = 80
            positionTable4Y = -52
            positionTable4X = 215
            positionTable5Y = -148
            positionTable5X = -213
            positionTable6Y = -148
            positionTable6X = -69
            positionTable7Y = -148
            positionTable7X = 80
            positionTable8Y = -148
            positionTable8X = 215
        } else {
            scaleTable = 0.7
            scaleRack = 0.6
            positionTable1Y = -58
            positionTable1X = -243
            positionTable2Y = -58
            positionTable2X = -80
            positionTable3Y = -58
            positionTable3X = 87
            positionTable4Y = -58
            positionTable4X = 245
            positionTable5Y = -167
            positionTable5X = -243
            positionTable6Y = -167
            positionTable6X = -80
            positionTable7Y = -167
            positionTable7X = 87
            positionTable8Y = -167
            positionTable8X = 245
        }
        let rackBackground = SKSpriteNode(imageNamed: "rack")
        rackBackground.setScale(scaleRack)
        rackBackground.position = CGPoint(x: 0, y: -5)
        rackBackground.zPosition = 0
        addChild(rackBackground)
        
        let table1 = SKSpriteNode(imageNamed: "purchasePrice")
        table1.xScale = scaleTable
        table1.yScale = scaleTable
        table1.position = CGPoint(x: positionTable1X, y: positionTable1Y)
        table1.zPosition = 1
        addChild(table1)
        
        let table2 = SKSpriteNode(imageNamed: "purchasePrice")
        table2.xScale = scaleTable
        table2.yScale = scaleTable
        table2.position = CGPoint(x: positionTable2X, y: positionTable2Y)
        table2.zPosition = 1
        addChild(table2)
        
        let table3 = SKSpriteNode(imageNamed: "purchasePrice")
        table3.xScale = scaleTable
        table3.yScale = scaleTable
        table3.position = CGPoint(x: positionTable3X, y: positionTable3Y)
        table3.zPosition = 1
        addChild(table3)
        
        let table4 = SKSpriteNode(imageNamed: "purchasePrice")
        table4.xScale = scaleTable
        table4.yScale = scaleTable
        table4.position = CGPoint(x: positionTable4X, y: positionTable4Y)
        table4.zPosition = 1
        addChild(table4)
        
        let table5 = SKSpriteNode(imageNamed: "purchasePrice")
        table5.xScale = scaleTable
        table5.yScale = scaleTable
        table5.position = CGPoint(x: positionTable5X, y: positionTable5Y)
        table5.zPosition = 1
        addChild(table5)
        
        let table6 = SKSpriteNode(imageNamed: "purchasePrice")
        table6.xScale = scaleTable
        table6.yScale = scaleTable
        table6.position = CGPoint(x: positionTable6X, y: positionTable6Y)
        table6.zPosition = 1
        addChild(table6)
        
        let table7 = SKSpriteNode(imageNamed: "purchasePrice")
        table7.xScale = scaleTable
        table7.yScale = scaleTable
        table7.position = CGPoint(x: positionTable7X, y: positionTable7Y)
        table7.zPosition = 1
        addChild(table7)
        
        let table8 = SKSpriteNode(imageNamed: "purchasePrice")
        table8.xScale = scaleTable
        table8.yScale = scaleTable
        table8.position = CGPoint(x: positionTable8X, y: positionTable8Y)
        table8.zPosition = 1
        addChild(table8)
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
            positionX = 270
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
        backgroundCoin.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
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

            panelBuyCoin.zPosition = 25
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
            panelBackground.zPosition = 20
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
            buttonBuy1000Coin.position = CGPoint(x: panelBuyCoin.position.x, y: panelBuyCoin.position.y)
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
//MARK: - BonusButtonPanel
    func bonusButtonPanel() {
        var scaleMin: CGFloat!
        var scaleMax: CGFloat!
        var positionX: CGFloat!
        var positionY: CGFloat!
        if totalSize.width >= 800 {
            scaleMin = 0.3
            scaleMax = 0.4
            positionX = -70
            positionY = 95
        } else {
            scaleMin = 0.35
            scaleMax = 0.45
            positionX = -83
            positionY = 105
        }
        bonusButton = SKButton(imageName: "bonusButton", buttonAction: {
            if self.openBonusPanel == true {
                if self.sound == true {
                    self.run(Sound.close.action)
                }
            } else {
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                self.openBonusPanel = true
                
                let scale = SKAction.scale(to: scaleMax, duration: 0.5)
                let alpha = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
                let group = SKAction.group([scale, alpha])
                
                self.bonusButton.run(SKAction.sequence([group]))
                
                let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.4)
                let moveY = SKAction.moveTo(y: -10, duration: 0.4)
                let group2 = SKAction.group([alphaTo, moveY])
                self.panelBonus.run(SKAction.sequence([group2]))
                
                if self.openArcherSkinPanel == true {
                    self.openArcherSkinPanel = false
                    var scaleMin: CGFloat!
                    if self.totalSize.width >= 800 {
                        scaleMin = 0.3
                    } else {
                        scaleMin = 0.35
                    }
                    let scale = SKAction.scale(to: scaleMin, duration: 0.5)
                    let alpha = SKAction.fadeAlpha(to: 0.7, duration: 0.5)
                    let group = SKAction.group([scale, alpha])
                    self.archerSkinButton.run(SKAction.sequence([group]))
                    
                    let moveY = SKAction.moveTo(y: -30, duration: 0.4)
                    let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.4)
                    let groupSp = SKAction.group([alphaTo, moveY])
                    self.archerSkinPanel1.run(SKAction.sequence([groupSp]))
                    
                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                        self.choiceSkin.removeFromParent()
                    }
                }
            }
        })
        if openBonusPanel == true {
            bonusButton.setScale(scaleMax)
            bonusButton.alpha = 0
            let alphaBb = SKAction.fadeAlpha(to: 1.0, duration: 0.2)
            bonusButton.run(SKAction.sequence([alphaBb]))
        } else {
            bonusButton.setScale(scaleMin)
            bonusButton.alpha = 0
            let alphaBb = SKAction.fadeAlpha(to: 0.7, duration: 0.2)
            bonusButton.run(SKAction.sequence([alphaBb]))
        }
        
        bonusButton.position = CGPoint(x: positionX, y: positionY)
        bonusButton.zPosition = 3
        addChild(bonusButton)
    }
//MARK: - PanelBonus
        func createPanelBonus() {

            panelBonus.zPosition = 1
            panelBonus.name = "panelBonusBack"
            panelBonus.position = CGPoint(x: 0, y: -30)
            panelBonus.xScale = 0.8
            panelBonus.yScale = 0.8
            panelBonus.alpha = 0
            addChild(panelBonus)
            
            //JumpBonus
            var positionJumpX: CGFloat!
            var positionJumpY: CGFloat!
            var jumpScale: CGFloat!
            if totalSize.width >= 800 {
                positionJumpX = 100
                positionJumpY = 45
                jumpScale = 0.4
            } else {
                positionJumpX = 109
                positionJumpY = 45
                jumpScale = 0.45
            }
            jumpBonus = SKButton(imageName: "bonusJumpButton", buttonAction: {
           
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
                   
                   self.coinScoreLabelNode.removeFromParent()
                   self.spawnCoinLabel()
                   
               } else {
                   if self.sound == true {
                       self.run(Sound.close.action)
                   }
               }
               
            })
           jumpBonus.position = CGPoint(x: panelBonus.position.x + positionJumpX, y: panelBonus.position.y + positionJumpY)
           jumpBonus.setScale(jumpScale)
           jumpBonus.zPosition = 5
            panelBonus.addChild(jumpBonus)
            
           let scoreBonusJumpLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
            scoreBonusJumpLabel.position = CGPoint(x: CGFloat(-30), y: CGFloat(-190))
            scoreBonusJumpLabel.text = "1200"
            scoreBonusJumpLabel.zPosition = 7
            scoreBonusJumpLabel.fontColor = .white
            scoreBonusJumpLabel.fontSize = 60
            jumpBonus.addChild(scoreBonusJumpLabel)
           let imageScoreBonusJumpLabel = SKSpriteNode(imageNamed: "coin/21")
            imageScoreBonusJumpLabel.position = CGPoint(x: CGFloat(50), y: CGFloat(-50))
            imageScoreBonusJumpLabel.setScale(1.4)
            imageScoreBonusJumpLabel.zPosition = 7
            jumpBonus.addChild(imageScoreBonusJumpLabel)
            
            //HearthBonus
            var positionHearth4X: CGFloat!
            var positionHearth4Y: CGFloat!
            var hearth4Scale: CGFloat!
            if totalSize.width >= 800 {
                positionHearth4X = 265
                positionHearth4Y = 35
                hearth4Scale = 0.4
            } else {
                positionHearth4X = 302
                positionHearth4Y = 35
                hearth4Scale = 0.45
            }
            heart4Bonus = SKButton(imageName: "bonusButtonHeart", buttonAction: {
           
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
                
                   self.coinScoreLabelNode.removeFromParent()
                   self.spawnCoinLabel()
               } else {
                   if self.sound == true {
                       self.run(Sound.close.action)
                   }
               }
               
            })
            heart4Bonus.position = CGPoint(x: panelBonus.position.x - positionHearth4X, y: panelBonus.position.y + positionHearth4Y)
            heart4Bonus.setScale(hearth4Scale)
            heart4Bonus.zPosition = 5
            panelBonus.addChild(heart4Bonus)
           let scoreBonus4HeartLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
            scoreBonus4HeartLabel.position = CGPoint(x: CGFloat(-30), y: CGFloat(-165))
            scoreBonus4HeartLabel.text = "800"
            scoreBonus4HeartLabel.zPosition = 6
            scoreBonus4HeartLabel.fontColor = .white
            scoreBonus4HeartLabel.fontSize = 60
            heart4Bonus.addChild(scoreBonus4HeartLabel)
           let imageScoreBonus4HeartLabel = SKSpriteNode(imageNamed: "coin/21")
            imageScoreBonus4HeartLabel.position = CGPoint(x: CGFloat(50), y: CGFloat(-25))
            imageScoreBonus4HeartLabel.setScale(1.4)
            imageScoreBonus4HeartLabel.zPosition = 6
            heart4Bonus.addChild(imageScoreBonus4HeartLabel)
            
            //2HearthBonus
            var positionHearth5X: CGFloat!
            var positionHearth5Y: CGFloat!
            var hearth5Scale: CGFloat!
            if totalSize.width >= 800 {
                positionHearth5X = 85
                positionHearth5Y = 35
                hearth5Scale = 0.4
            } else {
                positionHearth5X = 98
                positionHearth5Y = 35
                hearth5Scale = 0.45
            }
            heart5Bonus = SKButton(imageName: "bonusButton2Heart", buttonAction: {
           
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
                
                   self.coinScoreLabelNode.removeFromParent()
                   self.spawnCoinLabel()
                
                    if self.bonusJumpScore >= 1 {
                    }
               } else {
                   if self.sound == true {
                       self.run(Sound.close.action)
                   }
               }
               
            })
            heart5Bonus.position = CGPoint(x: panelBonus.position.x - positionHearth5X, y: panelBonus.position.y + positionHearth5Y)
            heart5Bonus.setScale(hearth5Scale)
            heart5Bonus.zPosition = 6
            panelBonus.addChild(heart5Bonus)
           let scoreBonus5HeartLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
            scoreBonus5HeartLabel.position = CGPoint(x: CGFloat(-30), y: CGFloat(-165))
            scoreBonus5HeartLabel.text = "1000"
            scoreBonus5HeartLabel.zPosition = 6
            scoreBonus5HeartLabel.fontColor = .white
            scoreBonus5HeartLabel.fontSize = 60
            heart5Bonus.addChild(scoreBonus5HeartLabel)
           let imageScoreBonus5HeartLabel = SKSpriteNode(imageNamed: "coin/21")
            imageScoreBonus5HeartLabel.position = CGPoint(x: CGFloat(50), y: CGFloat(-25))
            imageScoreBonus5HeartLabel.setScale(1.4)
            imageScoreBonus5HeartLabel.zPosition = 6
            heart5Bonus.addChild(imageScoreBonus5HeartLabel)
            
            
            //False Button
            //1
            var scaleFalseButton: CGFloat!
            var positionX1: CGFloat!
            var positionY1: CGFloat!
            var positionY1Label: CGFloat!
            var positionX2: CGFloat!
            var positionY2: CGFloat!
            var positionY2Label: CGFloat!
            var positionX3: CGFloat!
            var positionY3: CGFloat!
            var positionY3Label: CGFloat!
            var positionX4: CGFloat!
            var positionY4: CGFloat!
            var positionY4Label: CGFloat!
            var positionX5: CGFloat!
            var positionY5: CGFloat!
            var positionY5Label: CGFloat!
            if totalSize.width >= 800 {
                scaleFalseButton = 0.4
                positionX1 = 267
                positionY1 = 35
                positionY1Label = -60
                positionX2 = 265
                positionY2 = 85
                positionY2Label = -180
                positionX3 = 85
                positionY3 = 85
                positionY3Label = -180
                positionX4 = 100
                positionY4 = 85
                positionY4Label = -180
                positionX5 = 267
                positionY5 = 85
                positionY5Label = -180
            } else {
                scaleFalseButton = 0.45
                positionX1 = 305
                positionY1 = 32
                positionY1Label = -68
                positionX2 = 302
                positionY2 = 103
                positionY2Label = -203
                positionX3 = 98
                positionY3 = 103
                positionY3Label = -203
                positionX4 = 109
                positionY4 = 103
                positionY4Label = -203
                positionX5 = 305
                positionY5 = 103
                positionY5Label = -203
            }
            let falseButton = SKSpriteNode(imageNamed: "falseButtonShop")
            falseButton.position = CGPoint(x: panelBonus.position.x + positionX1, y: panelBonus.position.y + positionY1)
            falseButton.setScale(scaleFalseButton)
            falseButton.zPosition = 15
            falseButton.alpha = 0.6
            panelBonus.addChild(falseButton)
            
            let falseButtonLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
            falseButtonLabel.position = CGPoint(x: CGFloat(positionX1), y: CGFloat(positionY1Label))
            falseButtonLabel.text = "in work"
            falseButtonLabel.zPosition = 17
            falseButtonLabel.fontColor = .white
            falseButtonLabel.fontSize = 21
            panelBonus.addChild(falseButtonLabel)
            //2
            let falseButton2 = SKSpriteNode(imageNamed: "falseButtonShop")
             falseButton2.position = CGPoint(x: panelBonus.position.x - positionX2, y: panelBonus.position.y - positionY2)
             falseButton2.setScale(scaleFalseButton)
             falseButton2.zPosition = 15
             falseButton2.alpha = 0.6
             panelBonus.addChild(falseButton2)
            let falseButtonLabel2 = SKLabelNode(fontNamed: "Antikvar Shadow")
            falseButtonLabel2.position = CGPoint(x: CGFloat(-positionX2), y: CGFloat(positionY2Label))
            falseButtonLabel2.text = "in work"
            falseButtonLabel2.zPosition = 17
            falseButtonLabel2.fontColor = .white
            falseButtonLabel2.fontSize = 21
            panelBonus.addChild(falseButtonLabel2)
            //3
            let falseButton3 = SKSpriteNode(imageNamed: "falseButtonShop")
             falseButton3.position = CGPoint(x: panelBonus.position.x - positionX3, y: panelBonus.position.y - positionY3)
             falseButton3.setScale(scaleFalseButton)
             falseButton3.zPosition = 15
             falseButton3.alpha = 0.6
             panelBonus.addChild(falseButton3)
            let falseButtonLabel3 = SKLabelNode(fontNamed: "Antikvar Shadow")
            falseButtonLabel3.position = CGPoint(x: CGFloat(-positionX3), y: CGFloat(positionY3Label))
            falseButtonLabel3.text = "in work"
            falseButtonLabel3.zPosition = 17
            falseButtonLabel3.fontColor = .white
            falseButtonLabel3.fontSize = 21
            panelBonus.addChild(falseButtonLabel3)
            //4
            let falseButton4 = SKSpriteNode(imageNamed: "falseButtonShop")
             falseButton4.position = CGPoint(x: panelBonus.position.x + positionX4, y: panelBonus.position.y - positionY4)
             falseButton4.setScale(scaleFalseButton)
             falseButton4.zPosition = 15
             falseButton4.alpha = 0.6
             panelBonus.addChild(falseButton4)
            let falseButtonLabel4 = SKLabelNode(fontNamed: "Antikvar Shadow")
            falseButtonLabel4.position = CGPoint(x: CGFloat(positionX4), y: CGFloat(positionY4Label))
            falseButtonLabel4.text = "in work"
            falseButtonLabel4.zPosition = 17
            falseButtonLabel4.fontColor = .white
            falseButtonLabel4.fontSize = 21
            panelBonus.addChild(falseButtonLabel4)
            //5
            let falseButton5 = SKSpriteNode(imageNamed: "falseButtonShop")
            falseButton5.position = CGPoint(x: panelBonus.position.x + positionX5, y: panelBonus.position.y - positionY5)
            falseButton5.setScale(scaleFalseButton)
            falseButton5.zPosition = 15
            falseButton5.alpha = 0.6
            panelBonus.addChild(falseButton5)
            let falseButtonLabel5 = SKLabelNode(fontNamed: "Antikvar Shadow")
            falseButtonLabel5.position = CGPoint(x: CGFloat(positionX5), y: CGFloat(positionY5Label))
            falseButtonLabel5.text = "in work"
            falseButtonLabel5.zPosition = 17
            falseButtonLabel5.fontColor = .white
            falseButtonLabel5.fontSize = 21
            panelBonus.addChild(falseButtonLabel5)
        }
//MARK: - FlashAnimationBonus
    func spawnFlashAnimationBonus() {
        //AnimationFlash
        let animateJumpBonus = SKSpriteNode(imageNamed: "bonusButtonJumpAction/0")
        animateJumpBonus.setScale(1.0)
        animateJumpBonus.zPosition = 17
        animateJumpBonus.position = CGPoint(x: 0, y: -27)
        jumpBonus.addChild(animateJumpBonus)
        
        let animateHeartBonus = SKSpriteNode(imageNamed: "buttonHeartBonusAction/0")
        animateHeartBonus.setScale(1.0)
        animateHeartBonus.zPosition = 17
        animateHeartBonus.position = CGPoint(x: 0, y: 0)
        heart4Bonus.addChild(animateHeartBonus)
        
        let animate2HeartBonus = SKSpriteNode(imageNamed: "button2HeartBonusAction/0")
        animate2HeartBonus.setScale(1.0)
        animate2HeartBonus.zPosition = 17
        animate2HeartBonus.position = CGPoint(x: 0, y: 0)
        heart5Bonus.addChild(animate2HeartBonus)
        
        var textures: [SKTexture] = []
                for i in 0...19 {
                    textures.append(SKTexture(imageNamed: "buttonHeartBonusAction/\(i)"))
                }

            let action = SKAction.animate(with: textures, timePerFrame: 0.05)
            animateHeartBonus.run(SKAction.sequence([action]))
        
        var textures2: [SKTexture] = []
                for i in 0...19 {
                    textures2.append(SKTexture(imageNamed: "bonusButtonJumpAction/\(i)"))
                }

            let action2 = SKAction.animate(with: textures2, timePerFrame: 0.05)
            animateJumpBonus.run(SKAction.sequence([action2]))

        var textures3: [SKTexture] = []
                for i in 0...19 {
                    textures3.append(SKTexture(imageNamed: "button2HeartBonusAction/\(i)"))
                }

            let action3 = SKAction.animate(with: textures3, timePerFrame: 0.05)
            animate2HeartBonus.run(SKAction.sequence([action3]))
    }
//MARK: - ActionBuyBonus
    func spawnActionBuyJumpBonus() {
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            if self.sound == true {
                self.run(Sound.bonus.action)
            }
        }
        
        let image = SKSpriteNode(imageNamed: "imageBonusJumpFull")
        image.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        image.zPosition = 300
        image.setScale(0.1)
        addChild(image)
        
        let appear = SKAction.scale(to: 0.6, duration: 1.2)

        let leftWiggle = SKAction.rotate(byAngle: 18.87, duration: 0.5)
        
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
        
        let image = SKSpriteNode(imageNamed: "imageBonusHeartFull")
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
    func spawnActionBuy2HeartBonus() {
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            if self.sound == true {
                self.run(Sound.bonus.action)
            }
        }
        
        let image = SKSpriteNode(imageNamed: "imageBonus2HeartFull")
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
//MARK: - PlayerSkin
    func spawnPlayerSkin() {
        var scaleMin: CGFloat!
        var scaleMax: CGFloat!
        var positionX: CGFloat!
        var positionY: CGFloat!
        if totalSize.width >= 800 {
            scaleMin = 0.3
            scaleMax = 0.4
            positionX = 80
            positionY = 95
        } else {
            scaleMin = 0.35
            scaleMax = 0.45
            positionX = 90
            positionY = 105
        }
        
        archerSkinButton = SKButton(imageName: "\(archerSkin!)/archer/0", buttonAction: {
            if self.openArcherSkinPanel == true {
                if self.sound == true {
                    self.run(Sound.close.action)
                }
            } else {
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                self.openArcherSkinPanel = true
                
                self.choiceSkinArcher()
                
                let scale = SKAction.scale(to: scaleMax, duration: 0.5)
                let alpha = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
                let group = SKAction.group([scale, alpha])
                
                self.archerSkinButton.run(SKAction.sequence([group]))
                
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                let alphaTo = SKAction.fadeAlpha(to: 1, duration: 0.4)
                let moveY = SKAction.moveTo(y: -10, duration: 0.4)
                let group = SKAction.group([alphaTo, moveY])
                self.archerSkinPanel1.run(SKAction.sequence([group]))
                }
                
                if self.openBonusPanel == true {
                    
                    var scaleMin: CGFloat!
                    if self.totalSize.width >= 800 {
                        scaleMin = 0.3
                    } else {
                        scaleMin = 0.35
                    }
                    self.openBonusPanel = false
                    let scale = SKAction.scale(to: scaleMin, duration: 0.5)
                    let alpha = SKAction.fadeAlpha(to: 0.7, duration: 0.5)
                    let group = SKAction.group([scale, alpha])
                    self.bonusButton.run(SKAction.sequence([group]))
                    
                    let moveY = SKAction.moveTo(y: -30, duration: 0.4)
                    let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.4)
                    let groupPB = SKAction.group([alphaTo, moveY])
                    self.panelBonus.run(SKAction.sequence([groupPB]))
                }
            }
        })
        archerSkinButton.position = CGPoint(x: positionX, y: positionY)
        archerSkinButton.zPosition = 3
        if openArcherSkinPanel == true {
            archerSkinButton.xScale = scaleMax
            archerSkinButton.yScale = scaleMax
            archerSkinButton.alpha = 0
            let alphaSk = SKAction.fadeAlpha(to: 1.0, duration: 0.2)
            archerSkinButton.run(SKAction.sequence([alphaSk]))
        } else {
            archerSkinButton.xScale = scaleMin
            archerSkinButton.yScale = scaleMin
            archerSkinButton.alpha = 0
            let alphaSk = SKAction.fadeAlpha(to: 0.7, duration: 0.2)
            archerSkinButton.run(SKAction.sequence([alphaSk]))
        }
        addChild(archerSkinButton)
    }
//MARK: - ArcherSkinPanel
    func spawnArcherSkinPanel() {
        var scale: CGFloat!
        var skin1PositionX: CGFloat!
        var skin1PositionY: CGFloat!
        var skin2PositionX: CGFloat!
        var skin2PositionY: CGFloat!
        var skin3PositionX: CGFloat!
        var skin3PositionY: CGFloat!
        if totalSize.width >= 800 {
            scale = 0.35
            skin1PositionX = 213
            skin1PositionY = 41
            skin2PositionX = 69
            skin2PositionY = 41
            skin3PositionX = 80
            skin3PositionY = 41
        } else {
            scale = 0.4
            skin1PositionX = 243
            skin1PositionY = 42
            skin2PositionX = 80
            skin2PositionY = 42
            skin3PositionX = 87
            skin3PositionY = 42
        }
    
        archerSkinPanel1.position = CGPoint(x: 0, y: -30)
        archerSkinPanel1.alpha = 0
        addChild(archerSkinPanel1)
        
        //Skin#1
        buttonSkin1 = SKButton(imageName: "buttonArcherSkin1", buttonAction: {
            UserDefaults.standard.set("archerSkin1", forKey: "archerSkin")
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            
            archerSkin = "archerSkin1"
            
            let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.2)
            let remove = SKAction.removeFromParent()
            self.archerSkinButton.run(SKAction.sequence([alphaTo, remove]))
            
            let alphaCh = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let scaleCh = SKAction.scale(to: 0.4, duration: 0.3)
            let groupCh = SKAction.group([alphaCh, scaleCh])
            let removeCh = SKAction.removeFromParent()
            self.choiceSkin.run(SKAction.sequence([groupCh, removeCh]))
            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
                self.spawnPlayerSkin()
                self.choiceSkinArcher()
            }
        })
        buttonSkin1.position = CGPoint(x: archerSkinPanel1.position.x - skin1PositionX, y: archerSkinPanel1.position.y + skin1PositionY)
        buttonSkin1.xScale = scale
        buttonSkin1.yScale = scale
        buttonSkin1.zPosition = 3
        archerSkinPanel1.addChild(buttonSkin1)
        var skin1Font: CGFloat!
        switch Locale.current.languageCode {
        case "ja":
            skin1Font = 30
        default:
            skin1Font = 45
        }
        let archerSkin1Label = SKLabelNode(fontNamed: "Antikvar Shadow")
        archerSkin1Label.position = CGPoint(x: CGFloat(0), y: CGFloat(-165))
        archerSkin1Label.text = NSLocalizedString("открыт", comment: "isOpen")
        archerSkin1Label.zPosition = 17
        archerSkin1Label.fontColor = .white
        archerSkin1Label.fontSize = skin1Font
        buttonSkin1.addChild(archerSkin1Label)
        //Skin#2
        buttonSkin2 = SKButton(imageName: "buttonArcherSkin2", buttonAction: {
            
            if self.winLevel5 == true {
            UserDefaults.standard.set("archerSkin2", forKey: "archerSkin")
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
                
            archerSkin = "archerSkin2"
            
            let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.2)
            let remove = SKAction.removeFromParent()
            self.archerSkinButton.run(SKAction.sequence([alphaTo, remove]))
            
            let alphaCh = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let scaleCh = SKAction.scale(to: 0.4, duration: 0.3)
            let groupCh = SKAction.group([alphaCh, scaleCh])
            let removeCh = SKAction.removeFromParent()
            self.choiceSkin.run(SKAction.sequence([groupCh, removeCh]))
                Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
                    self.spawnPlayerSkin()
                    self.choiceSkinArcher()
                }
            } else {
                if self.sound == true {
                    self.run(Sound.close.action)
                }
            }
        })
        buttonSkin2.position = CGPoint(x: archerSkinPanel1.position.x - skin2PositionX, y: archerSkinPanel1.position.y + skin2PositionY)
        buttonSkin2.xScale = scale
        buttonSkin2.yScale = scale
        buttonSkin2.zPosition = 3
        archerSkinPanel1.addChild(buttonSkin2)
        if winLevel5 == false {
            let archerSkin2Label = SKLabelNode(fontNamed: "Antikvar Shadow")
            archerSkin2Label.position = CGPoint(x: CGFloat(0), y: CGFloat(-163))
            archerSkin2Label.text = NSLocalizedString("уровень 5", comment: "level5")
            archerSkin2Label.zPosition = 17
            archerSkin2Label.fontColor = .white
            archerSkin2Label.fontSize = 40
            buttonSkin2.addChild(archerSkin2Label)
            let archerSkin2LabelImage = SKSpriteNode(imageNamed: "lock")
            archerSkin2LabelImage.position = CGPoint(x: CGFloat(100), y: CGFloat(-60))
            archerSkin2LabelImage.setScale(1.5)
            archerSkin2LabelImage.zPosition = 17
            archerSkin2LabelImage.zRotation = 0.5
            buttonSkin2.addChild(archerSkin2LabelImage)
        } else {
            var skin2Font: CGFloat!
            switch Locale.current.languageCode {
            case "ja":
                skin2Font = 30
            default:
                skin2Font = 45
            }
            let archerSkin2Label = SKLabelNode(fontNamed: "Antikvar Shadow")
            archerSkin2Label.position = CGPoint(x: CGFloat(0), y: CGFloat(-165))
            archerSkin2Label.text = NSLocalizedString("открыт", comment: "isOpen")
            archerSkin2Label.zPosition = 17
            archerSkin2Label.fontColor = .white
            archerSkin2Label.fontSize = skin2Font
            buttonSkin2.addChild(archerSkin2Label)
        }
        //Skin#3
        buttonSkin3 = SKButton(imageName: "buttonArcherSkin3", buttonAction: {
            
            if self.winLevel10 == true {
            UserDefaults.standard.set("archerSkin3", forKey: "archerSkin")
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
                
            archerSkin = "archerSkin3"
            
            let alphaTo = SKAction.fadeAlpha(to: 0, duration: 0.2)
            let remove = SKAction.removeFromParent()
            self.archerSkinButton.run(SKAction.sequence([alphaTo, remove]))
            
            let alphaCh = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let scaleCh = SKAction.scale(to: 0.4, duration: 0.3)
            let groupCh = SKAction.group([alphaCh, scaleCh])
            let removeCh = SKAction.removeFromParent()
            self.choiceSkin.run(SKAction.sequence([groupCh, removeCh]))
                Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
                    self.spawnPlayerSkin()
                    self.choiceSkinArcher()
                }
            } else {
                if self.sound == true {
                    self.run(Sound.close.action)
                }
            }
        })
        buttonSkin3.position = CGPoint(x: archerSkinPanel1.position.x + skin3PositionX, y: archerSkinPanel1.position.y + skin3PositionY)
        buttonSkin3.xScale = scale
        buttonSkin3.yScale = scale
        buttonSkin3.zPosition = 3
        archerSkinPanel1.addChild(buttonSkin3)
        if winLevel10 == false {
            var skin3Font: CGFloat!
            switch Locale.current.languageCode {
            case "ru":
                skin3Font = 38
            default:
                skin3Font = 40
            }
            let archerSkin3Label = SKLabelNode(fontNamed: "Antikvar Shadow")
            archerSkin3Label.position = CGPoint(x: CGFloat(0), y: CGFloat(-163))
            archerSkin3Label.text = NSLocalizedString("уровень 10", comment: "level10")
            archerSkin3Label.zPosition = 17
            archerSkin3Label.fontColor = .white
            archerSkin3Label.fontSize = skin3Font
            buttonSkin3.addChild(archerSkin3Label)
            let archerSkin3LabelImage = SKSpriteNode(imageNamed: "lock")
            archerSkin3LabelImage.position = CGPoint(x: CGFloat(100), y: CGFloat(-60))
            archerSkin3LabelImage.setScale(1.5)
            archerSkin3LabelImage.zPosition = 17
            archerSkin3LabelImage.zRotation = 0.5
            buttonSkin3.addChild(archerSkin3LabelImage)
        } else {
            var skin3Font: CGFloat!
            switch Locale.current.languageCode {
            case "ja":
                skin3Font = 30
            default:
                skin3Font = 45
            }
            let archerSkin3Label = SKLabelNode(fontNamed: "Antikvar Shadow")
            archerSkin3Label.position = CGPoint(x: CGFloat(0), y: CGFloat(-165))
            archerSkin3Label.text = NSLocalizedString("открыт", comment: "isOpen")
            archerSkin3Label.zPosition = 17
            archerSkin3Label.fontColor = .white
            archerSkin3Label.fontSize = skin3Font
            buttonSkin3.addChild(archerSkin3Label)
        }
        
        //False Button
        var scaleFalseButton: CGFloat!
        var positionX1: CGFloat!
        var positionY1: CGFloat!
        var positionY1Label: CGFloat!
        var positionX2: CGFloat!
        var positionY2: CGFloat!
        var positionY2Label: CGFloat!
        var positionX3: CGFloat!
        var positionY3: CGFloat!
        var positionY3Label: CGFloat!
        var positionX4: CGFloat!
        var positionY4: CGFloat!
        var positionY4Label: CGFloat!
        var positionX5: CGFloat!
        var positionY5: CGFloat!
        var positionY5Label: CGFloat!
        if totalSize.width >= 800 {
            scaleFalseButton = 0.32
            positionX1 = 215
            positionY1 = 35
            positionY1Label = -47
            positionX2 = 213
            positionY2 = 62
            positionY2Label = -144
            positionX3 = 68
            positionY3 = 62
            positionY3Label = -144
            positionX4 = 80
            positionY4 = 62
            positionY4Label = -144
            positionX5 = 215
            positionY5 = 62
            positionY5Label = -144
        } else {
            scaleFalseButton = 0.35
            positionX1 = 245
            positionY1 = 32
            positionY1Label = -54
            positionX2 = 243
            positionY2 = 78
            positionY2Label = -163
            positionX3 = 80
            positionY3 = 78
            positionY3Label = -163
            positionX4 = 87
            positionY4 = 78
            positionY4Label = -163
            positionX5 = 245
            positionY5 = 78
            positionY5Label = -163
        }
        //1
        let falseButton = SKSpriteNode(imageNamed: "falseButtonShop")
        falseButton.position = CGPoint(x: archerSkinPanel1.position.x + positionX1, y: archerSkinPanel1.position.y + positionY1)
        falseButton.setScale(scaleFalseButton)
        falseButton.zPosition = 15
        falseButton.alpha = 0.6
        archerSkinPanel1.addChild(falseButton)
        
        let falseButtonLabel = SKLabelNode(fontNamed: "Antikvar Shadow")
        falseButtonLabel.position = CGPoint(x: CGFloat(positionX1), y: CGFloat(positionY1Label))
        falseButtonLabel.text = "in work"
        falseButtonLabel.zPosition = 17
        falseButtonLabel.fontColor = .white
        falseButtonLabel.fontSize = 17
        archerSkinPanel1.addChild(falseButtonLabel)
        //2
        let falseButton2 = SKSpriteNode(imageNamed: "falseButtonShop")
         falseButton2.position = CGPoint(x: archerSkinPanel1.position.x - positionX2, y: archerSkinPanel1.position.y - positionY2)
         falseButton2.setScale(scaleFalseButton)
         falseButton2.zPosition = 15
         falseButton2.alpha = 0.6
        archerSkinPanel1.addChild(falseButton2)
        let falseButtonLabel2 = SKLabelNode(fontNamed: "Antikvar Shadow")
        falseButtonLabel2.position = CGPoint(x: CGFloat(-positionX2), y: CGFloat(positionY2Label))
        falseButtonLabel2.text = "in work"
        falseButtonLabel2.zPosition = 17
        falseButtonLabel2.fontColor = .white
        falseButtonLabel2.fontSize = 17
        archerSkinPanel1.addChild(falseButtonLabel2)
        //3
        let falseButton3 = SKSpriteNode(imageNamed: "falseButtonShop")
         falseButton3.position = CGPoint(x: archerSkinPanel1.position.x - positionX3, y: archerSkinPanel1.position.y - positionY3)
         falseButton3.setScale(scaleFalseButton)
         falseButton3.zPosition = 15
         falseButton3.alpha = 0.6
        archerSkinPanel1.addChild(falseButton3)
        let falseButtonLabel3 = SKLabelNode(fontNamed: "Antikvar Shadow")
        falseButtonLabel3.position = CGPoint(x: CGFloat(-positionX3), y: CGFloat(positionY3Label))
        falseButtonLabel3.text = "in work"
        falseButtonLabel3.zPosition = 17
        falseButtonLabel3.fontColor = .white
        falseButtonLabel3.fontSize = 17
        archerSkinPanel1.addChild(falseButtonLabel3)
        //4
        let falseButton4 = SKSpriteNode(imageNamed: "falseButtonShop")
         falseButton4.position = CGPoint(x: archerSkinPanel1.position.x + positionX4, y: archerSkinPanel1.position.y - positionY4)
         falseButton4.setScale(scaleFalseButton)
         falseButton4.zPosition = 15
         falseButton4.alpha = 0.6
        archerSkinPanel1.addChild(falseButton4)
        let falseButtonLabel4 = SKLabelNode(fontNamed: "Antikvar Shadow")
        falseButtonLabel4.position = CGPoint(x: CGFloat(positionX4), y: CGFloat(positionY4Label))
        falseButtonLabel4.text = "in work"
        falseButtonLabel4.zPosition = 17
        falseButtonLabel4.fontColor = .white
        falseButtonLabel4.fontSize = 17
        archerSkinPanel1.addChild(falseButtonLabel4)
        //5
        let falseButton5 = SKSpriteNode(imageNamed: "falseButtonShop")
        falseButton5.position = CGPoint(x: archerSkinPanel1.position.x + positionX5, y: archerSkinPanel1.position.y - positionY5)
        falseButton5.setScale(scaleFalseButton)
        falseButton5.zPosition = 15
        falseButton5.alpha = 0.6
        archerSkinPanel1.addChild(falseButton5)
        let falseButtonLabel5 = SKLabelNode(fontNamed: "Antikvar Shadow")
        falseButtonLabel5.position = CGPoint(x: CGFloat(positionX5), y: CGFloat(positionY5Label))
        falseButtonLabel5.text = "in work"
        falseButtonLabel5.zPosition = 17
        falseButtonLabel5.fontColor = .white
        falseButtonLabel5.fontSize = 17
        archerSkinPanel1.addChild(falseButtonLabel5)
        
    }
    func choiceSkinArcher() {
        var positionX1: CGFloat!
        var positionY1: CGFloat!
        var positionX2: CGFloat!
        var positionY2: CGFloat!
        var positionX3: CGFloat!
        var positionY3: CGFloat!
        if totalSize.width >= 800 {
            positionX1 = -176
            positionY1 = -10
            positionX2 = -34
            positionY2 = -10
            positionX3 = 115
            positionY3 = -10
        } else {
            positionX1 = -203
            positionY1 = -10
            positionX2 = -39
            positionY2 = -10
            positionX3 = 129
            positionY3 = -10
        }
        choiceSkin.setScale(0.1)
        choiceSkin.zPosition = 17
        choiceSkin.alpha = 0
        if archerSkin == "archerSkin1" {
        choiceSkin.position = CGPoint(x: CGFloat(positionX1), y: CGFloat(positionY1))
        } else if archerSkin == "archerSkin2" {
        choiceSkin.position = CGPoint(x: CGFloat(positionX2), y: CGFloat(positionY2))
        } else if archerSkin == "archerSkin3" {
            choiceSkin.position = CGPoint(x: CGFloat(positionX3), y: CGFloat(positionY3))
        }
        archerSkinPanel1.addChild(choiceSkin)
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
        let alphaMove = SKAction.fadeAlpha(to: 1, duration: 0.3)
        let scaleMove = SKAction.scale(to: 0.3, duration: 0.3)
        let group = SKAction.group([alphaMove, scaleMove])
        self.choiceSkin.run(SKAction.sequence([group]))
        }
    }
//MARK: - FlashAnimationSkin1
    func spawnFlashAnimationSkin1() {
        //AnimationFlash
        let animateSkin1 = SKSpriteNode(imageNamed: "buttonSkin1FlashAnimation/0")
        animateSkin1.setScale(1.0)
        animateSkin1.zPosition = 17
        animateSkin1.position = CGPoint(x: 0, y: 0)
        buttonSkin1.addChild(animateSkin1)
        
        let animateSkin2 = SKSpriteNode(imageNamed: "buttonSkin2FlashAnimation/0")
        animateSkin2.setScale(1.0)
        animateSkin2.zPosition = 17
        animateSkin2.position = CGPoint(x: 0, y: 0)
        buttonSkin2.addChild(animateSkin2)

        let animateSkin3 = SKSpriteNode(imageNamed: "buttonSkin3FlashAnimation/0")
        animateSkin3.setScale(1.0)
        animateSkin3.zPosition = 17
        animateSkin3.position = CGPoint(x: 0, y: 0)
        buttonSkin3.addChild(animateSkin3)
        
        var textures: [SKTexture] = []
                for i in 0...19 {
                    textures.append(SKTexture(imageNamed: "buttonSkin1FlashAnimation/\(i)"))
                }

            let action = SKAction.animate(with: textures, timePerFrame: 0.05)
            animateSkin1.run(SKAction.sequence([action]))
        
        var textures2: [SKTexture] = []
                for i in 0...19 {
                    textures2.append(SKTexture(imageNamed: "buttonSkin2FlashAnimation/\(i)"))
                }

            let action2 = SKAction.animate(with: textures2, timePerFrame: 0.05)
            animateSkin2.run(SKAction.sequence([action2]))

        var textures3: [SKTexture] = []
                for i in 0...19 {
                    textures3.append(SKTexture(imageNamed: "buttonSkin3FlashAnimation/\(i)"))
                }

            let action3 = SKAction.animate(with: textures3, timePerFrame: 0.05)
            animateSkin3.run(SKAction.sequence([action3]))
    }
    //MARK: - Update
        override func update(_ currentTime: TimeInterval) {
            if openBonusPanel == true {
                if oneOpen == false {
                    Timer.scheduledTimer(withTimeInterval: 6.1, repeats: true) { (timer) in
                        self.spawnFlashAnimationBonus()
                    }
                    oneOpen = true
                }
            } else if openArcherSkinPanel == true {
                if oneOpenSkinPanel == false {
                    Timer.scheduledTimer(withTimeInterval: 6.1, repeats: true) { (timer) in
                        self.spawnFlashAnimationSkin1()
                    }
                    oneOpenSkinPanel = true
                }
            }
        }
}
