//
//  MenuScene.swift
//  Elon's Adventure
//
//  Created by mac on 15.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit
import SpriteKit
import AudioToolbox

class MenuScene: GameScene {
    
    var onSetting: SKButton!
    var offSetting: SKButton!
    var musicOffButton: SKButton!
    var musicOnButton: SKButton!
    var soundOffButton: SKButton!
    var soundOnButton: SKButton!
    var panel = SKSpriteNode(imageNamed: "settingsBack")
    var vibrationOffButton: SKButton!
    var vibrationOnButton: SKButton!
    
//MARK: - DidMove
    override func didMove(to view: SKView) {
        
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
//MARK: - Background
    func spawnBackground() {
        
        var positionY: CGFloat!
        var positionX: CGFloat!
        var scale: CGFloat!
        var scaleLogo: CGFloat!
        if totalSize.width >= 800 {
            positionY = 40
            positionX = 10
            scale = 0.9
            scaleLogo = 0.6
        } else {
            positionY = 70
            positionX = 0
            scale = 1.0
            scaleLogo = 0.7
        }
        
        let background = SKSpriteNode(imageNamed: "backgroundMain")
        background.setScale(scale)
        background.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY)
        background.zPosition = 1
        addChild(background)
        
        let scroll = SKSpriteNode(imageNamed: "trioHeroes")
        scroll.setScale(scaleLogo)
        scroll.position = CGPoint(x: self.frame.midX - 10, y: self.frame.midY + positionY)
        scroll.zPosition = 4
        addChild(scroll)
        
        let playBackground = SKSpriteNode(imageNamed: "playBackground")
        playBackground.setScale(0.7)
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

        if totalSize.width >= 1000 {

            positionY = 700
            positionX = 880

        } else if totalSize.width >= 800 {
            positionY = 140
            positionX = 280

        } else {
            positionY = 160
            positionX = 280

        }
        //BackgroundCoin
        let backgroundCoin = SKSpriteNode(imageNamed: "settingsBack")
        backgroundCoin.setScale(0.7)
        backgroundCoin.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY + positionY)
        backgroundCoin.zPosition = 4
        addChild(backgroundCoin)
        
        //BestLabel
        let coinImageNode = SKSpriteNode(imageNamed: "coin/0")
        coinImageNode.position = CGPoint(x: CGFloat(-70), y: CGFloat(10))
        coinImageNode.setScale(0.35)
        coinImageNode.zPosition = 5
        backgroundCoin.addChild(coinImageNode)
        
        //Distance
        let coinNowScore = UserDefaults.standard.integer(forKey: "Totalcoin")
        let coinScoreLabelNode = SKLabelNode(fontNamed: "Antikvar Shadow")
        coinScoreLabelNode.text = String(coinNowScore)
        coinScoreLabelNode.fontSize = 40
        coinScoreLabelNode.position = CGPoint(x: CGFloat(40), y: CGFloat(-10))
        coinScoreLabelNode.fontColor = SKColor.black
        coinScoreLabelNode.zPosition = 5
        backgroundCoin.addChild(coinScoreLabelNode)
    }
//MARK: - PlayButton
    func spawnPlayButton() {
        let play = SKButton(imageName: "playButton", buttonAction: {
            
            UserDefaults.standard.set(0, forKey: "levelNumber")
            
            if self.sound == true {
                self.run(Sound.pop.action)
            }
            
            if self.winLevel30 == true {
                let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
                
                let transition = SKTransition.fade(withDuration: 2)
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transition)
            } else if self.winLevel30 == false {
                let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
                
                let transition = SKTransition.fade(withDuration: 2)
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transition)
            }
            
        })
        play.position = CGPoint(x: 5, y: -80)
        play.zPosition = 10
        play.setScale(0.6)
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
                positionY = 80
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
            musicOnButton.setScale(0.3)
            musicOnButton.zPosition = 10
            musicOnButton.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
            addChild(musicOnButton)
        }
//MARK: - SpawnOffMusic
    func spawnOffMusic() {
        
        var positionY: CGFloat!
        var positionX: CGFloat!

        if totalSize.width >= 1000 {

            positionY = 680
            positionX = 920

        } else if totalSize.width >= 800 {
            positionY = 80
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
        musicOffButton.setScale(0.3)
        musicOffButton.zPosition = 10
        musicOffButton.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
        addChild(musicOffButton)
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
            onSetting.setScale(0.35)
            onSetting.zPosition = 10
            onSetting.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
            addChild(onSetting)
        }
//MARK: - SpawnOffSetting
    func spawnOffSetting() {
        
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
        
        offSetting = SKButton(imageName: "close", buttonAction: {
            self.offSetting.removeFromParent()
            self.spawnOnSetting()
            self.panel.removeFromParent()
            
            if self.sound == false {
                self.soundOnButton.removeFromParent()
            } else if self.sound == true {
                self.run(Sound.pop.action)
                self.soundOffButton.removeFromParent()
            }
            
            if self.vibration == false {
                self.vibrationOnButton.removeFromParent()
            } else if self.vibration == true {
                self.vibrationOffButton.removeFromParent()
            }
            
        })
        offSetting.setScale(0.15)
        offSetting.zPosition = 10
        offSetting.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY + positionY)
        addChild(offSetting)
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
            panel.xScale = 0.8
            panel.yScale = 0.8
            addChild(panel)
            
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
        
         soundOffButton.position = CGPoint(x: panel.frame.midX + 10, y: panel.frame.midY)
         soundOffButton.xScale = -0.35
         soundOffButton.yScale = 0.35
         soundOffButton.zPosition = 10
         self.addChild(self.soundOffButton)
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
            soundOnButton.position = CGPoint(x: panel.frame.midX + 10, y: panel.frame.midY)
            soundOnButton.xScale = -0.35
            soundOnButton.yScale = 0.35
            soundOnButton.zPosition = 10
            self.addChild(self.soundOnButton)
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
            
             vibrationOffButton.position = CGPoint(x: panel.frame.midX - 50, y: panel.frame.midY)
             vibrationOffButton.setScale(0.35)
             vibrationOffButton.zPosition = 10
            self.addChild(self.vibrationOffButton)
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
                vibrationOnButton.position = CGPoint(x: panel.frame.midX - 50, y: panel.frame.midY)
                     vibrationOnButton.setScale(0.35)
                     vibrationOnButton.zPosition = 10
                self.addChild(self.vibrationOnButton)
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


