//
//  MenuLevel1_30.swift
//  Elon's Adventure
//
//  Created by mac on 28.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit
import SpriteKit

    
class MenuLevel1_30: GameScene {
    
    let centreView = UIView()
    
    override func didMove(to view: SKView) {
        
        if backgroundMusic == true {
            if menuMusicOn == false {
                playBackgroundMenuMusic(fileName: "backMusicMenu.mp3")
                
                UserDefaults.standard.set(true, forKey: "menuMusicOn")
            }
        }
        
        spawnBackground()
        closeButton()
        spawnLevelButton()
        
        if winLevel30 == true {
        swipe()
        spawnArrowUI()
        }
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
            upRight()
        case .right:
            upLeft()
        default:
            print("")
        }
    }
    
    func upRight() {
        let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
        
        let transition = SKTransition.push(with: .left, duration: 1.0)
        scene!.scaleMode = .aspectFill
        self.view?.presentScene(scene!, transition: transition)
        
        self.centreView.removeFromSuperview()
    }
    func upLeft() {
        
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
        
        let background = SKSpriteNode(imageNamed: "levelBackground")
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
                let transation = SKTransition.fade(withDuration: 2.0)
                
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
            })
            close.setScale(0.5)
            close.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY + positionY)
            close.zPosition = 11
            addChild(close)
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
            
            let arrow = SKSpriteNode(imageNamed: "arrowNext")
            arrow.setScale(0.8)
            arrow.position = CGPoint(x: self.frame.midX + positionX, y: self.frame.midY - positionY)
            arrow.zPosition = 11
            arrow.alpha = 0.5
            addChild(arrow)
        }
//MARK: - ButtonLevel_Screen > 800
        func spawnLevelButton() {
            
            if totalSize.width >= 800 {
            //1
                if winLevel1 == false {
                    let level1 = SKButton(imageName: "buttonLevel/1", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel1") {
                            
                            let scene = LevelDialogue1(fileNamed: "LevelDialogue1")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                           } else {
                            
                            UserDefaults.standard.set(1, forKey: "levelNumber")
                            
                            let scene = Level1(fileNamed: "Level1")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                           }
                        UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel1")
                        
                        
                    })
                    level1.setScale(0.35)
                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
                    level1.zPosition = 11
                    addChild(level1)
                } else if winLevel1 == true {
                    let level1 = SKButton(imageName: "buttonLevelWin/1", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(1, forKey: "levelNumber")
                        
                        let scene = Level1(fileNamed: "Level1")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level1.setScale(0.35)
                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
                    level1.zPosition = 11
                    addChild(level1)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level1.position.x, y: level1.position.y - 5)
                    addChild(cloud)
                }
            
            
            //2
            if winLevel1 == true {
                if winLevel2 == false {
                let level2 = SKButton(imageName: "buttonLevel/2", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel2") {
                        
                        let scene = LevelDialogue2(fileNamed: "LevelDialogue2")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(2, forKey: "levelNumber")
                        
                        let scene = Level2(fileNamed: "Level2")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel2")
                    
                    
                })
                level2.setScale(0.35)
                level2.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY + 100)
                level2.zPosition = 11
                addChild(level2)
                } else if winLevel2 == true {
                    let level2 = SKButton(imageName: "buttonLevelWin/2", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(2, forKey: "levelNumber")
                        
                        let scene = Level2(fileNamed: "Level2")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level2.setScale(0.35)
                    level2.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY + 100)
                    level2.zPosition = 11
                    addChild(level2)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level2.position.x, y: level2.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel1 == false {
                
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
            if winLevel2 == true {
                if winLevel3 == false {
                let level3 = SKButton(imageName: "buttonLevel/3", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(3, forKey: "levelNumber")
                    
                    let scene = Level3(fileNamed: "Level3")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level3.setScale(0.35)
                level3.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 100)
                level3.zPosition = 11
                addChild(level3)
                } else if winLevel3 == true {
                let level3 = SKButton(imageName: "buttonLevelWin/3", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(3, forKey: "levelNumber")
                    
                    let scene = Level3(fileNamed: "Level3")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level3.setScale(0.35)
                level3.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 100)
                level3.zPosition = 11
                addChild(level3)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level3.position.x, y: level3.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel2 == false {
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
            if winLevel3 == true {
                if winLevel4 == false {
                let level4 = SKButton(imageName: "buttonLevel/4", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel4") {
                        
                        let scene = LevelDialogue4(fileNamed: "LevelDialogue4")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(4, forKey: "levelNumber")
                        
                        let scene = Level4(fileNamed: "Level4")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel4")
                    
                })
                level4.setScale(0.35)
                level4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 100)
                level4.zPosition = 11
                addChild(level4)
                } else if winLevel4 == true {
                    let level4 = SKButton(imageName: "buttonLevelWin/4", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(4, forKey: "levelNumber")
                        
                        let scene = Level4(fileNamed: "Level4")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level4.setScale(0.35)
                    level4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 100)
                    level4.zPosition = 11
                    addChild(level4)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level4.position.x, y: level4.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel3 == false {
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
            if winLevel4 == true {
                if winLevel5 == false {
                let level5 = SKButton(imageName: "buttonLevel/5", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(5, forKey: "levelNumber")
                    
                    let scene = Level5(fileNamed: "Level5")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level5.setScale(0.35)
                level5.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY + 100)
                level5.zPosition = 11
                addChild(level5)
                } else if winLevel5 == true {
                    let level5 = SKButton(imageName: "buttonLevelWin/5", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(5, forKey: "levelNumber")
                        
                        let scene = Level5(fileNamed: "Level5")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level5.setScale(0.35)
                    level5.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY + 100)
                    level5.zPosition = 11
                    addChild(level5)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level5.position.x, y: level5.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel4 == false {
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
            if winLevel5 == true {
                if winLevel6 == false {
                let level6 = SKButton(imageName: "buttonLevel/6", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(6, forKey: "levelNumber")
                    
                    let scene = Level6(fileNamed: "Level6")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level6.setScale(0.35)
                level6.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY + 100)
                level6.zPosition = 11
                addChild(level6)
                } else if winLevel6 == true {
                    let level6 = SKButton(imageName: "buttonLevelWin/6", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(6, forKey: "levelNumber")
                        
                        let scene = Level6(fileNamed: "Level6")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level6.setScale(0.35)
                    level6.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY + 100)
                    level6.zPosition = 11
                    addChild(level6)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level6.position.x, y: level6.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel5 == false {
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
            if winLevel6 == true {
                if winLevel7 == false {
                let level7 = SKButton(imageName: "buttonLevel/7", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel7") {
                        
                        let scene = LevelDialogue7(fileNamed: "LevelDialogue7")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(7, forKey: "levelNumber")
                        
                        let scene = Level7(fileNamed: "Level7")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel7")
                    
                    
                })
                level7.setScale(0.35)
                level7.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 100)
                level7.zPosition = 11
                addChild(level7)
                } else if winLevel7 == true {
                    let level7 = SKButton(imageName: "buttonLevelWin/7", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(7, forKey: "levelNumber")
                        
                        let scene = Level7(fileNamed: "Level7")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level7.setScale(0.35)
                    level7.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 100)
                    level7.zPosition = 11
                    addChild(level7)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level7.position.x, y: level7.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel6 == false {
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
            if winLevel7 == true {
                if winLevel8 == false {
                let level8 = SKButton(imageName: "buttonLevel/8", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(8, forKey: "levelNumber")
                    
                    let scene = Level8(fileNamed: "Level8")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level8.setScale(0.35)
                level8.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 100)
                level8.zPosition = 11
                addChild(level8)
                } else if winLevel8 == true {
                    let level8 = SKButton(imageName: "buttonLevelWin/8", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(8, forKey: "levelNumber")
                        
                        let scene = Level8(fileNamed: "Level8")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level8.setScale(0.35)
                    level8.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 100)
                    level8.zPosition = 11
                    addChild(level8)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level8.position.x, y: level8.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel7 == false {
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
            if winLevel8 == true {
                if winLevel9 == false {
                let level9 = SKButton(imageName: "buttonLevel/9", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel9") {
                        
                        let scene = LevelDialogue9(fileNamed: "LevelDialogue9")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(9, forKey: "levelNumber")
                        
                        let scene = Level9(fileNamed: "Level9")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel9")
                    
                })
                level9.setScale(0.35)
                level9.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY + 100)
                level9.zPosition = 11
                addChild(level9)
                } else if winLevel9 == true {
                    let level9 = SKButton(imageName: "buttonLevelWin/9", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(9, forKey: "levelNumber")
                        
                        let scene = Level9(fileNamed: "Level9")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level9.setScale(0.35)
                    level9.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY + 100)
                    level9.zPosition = 11
                    addChild(level9)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level9.position.x, y: level9.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel8 == false {
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
            if winLevel9 == true {
                if winLevel10 == false {
                let level10 = SKButton(imageName: "buttonLevel/10", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(10, forKey: "levelNumber")
                    
                    let scene = Level10(fileNamed: "Level10")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level10.setScale(0.35)
                level10.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY + 100)
                level10.zPosition = 11
                addChild(level10)
                } else if winLevel10 == true {
                    let level10 = SKButton(imageName: "buttonLevelWin/10", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(10, forKey: "levelNumber")
                        
                        let scene = Level10(fileNamed: "Level10")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level10.setScale(0.35)
                    level10.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY + 100)
                    level10.zPosition = 11
                    addChild(level10)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level10.position.x, y: level10.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel9 == false {
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
            if winLevel10 == true {
                if winLevel11 == false {
                let level11 = SKButton(imageName: "buttonLevel/11", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(11, forKey: "levelNumber")
                    
                    let scene = Level11(fileNamed: "Level11")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level11.setScale(0.35)
                level11.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 15)
                level11.zPosition = 11
                addChild(level11)
                } else if winLevel11 == true {
                    let level11 = SKButton(imageName: "buttonLevelWin/11", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(11, forKey: "levelNumber")
                        
                        let scene = Level11(fileNamed: "Level11")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level11.setScale(0.35)
                    level11.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 15)
                    level11.zPosition = 11
                    addChild(level11)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level11.position.x, y: level11.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel10 == false {
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
            if winLevel11 == true {
                if winLevel12 == false {
                let level12 = SKButton(imageName: "buttonLevel/12", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(12, forKey: "levelNumber")
                    
                    let scene = Level12(fileNamed: "Level12")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level12.setScale(0.35)
                level12.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 15)
                level12.zPosition = 11
                addChild(level12)
                } else if winLevel12 == true {
                    let level12 = SKButton(imageName: "buttonLevelWin/12", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(12, forKey: "levelNumber")
                        
                        let scene = Level12(fileNamed: "Level12")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level12.setScale(0.35)
                    level12.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 15)
                    level12.zPosition = 11
                    addChild(level12)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level12.position.x, y: level12.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel11 == false {
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
            if winLevel12 == true {
                if winLevel13 == false {
                let level13 = SKButton(imageName: "buttonLevel/13", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(13, forKey: "levelNumber")
                    
                    let scene = Level13(fileNamed: "Level13")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level13.setScale(0.35)
                level13.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 15)
                level13.zPosition = 11
                addChild(level13)
                } else if winLevel13 == false {
                    let level13 = SKButton(imageName: "buttonLevelWin/13", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(13, forKey: "levelNumber")
                        
                        let scene = Level13(fileNamed: "Level13")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level13.setScale(0.35)
                    level13.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 15)
                    level13.zPosition = 11
                    addChild(level13)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level13.position.x, y: level13.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel12 == false {
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
            if winLevel13 == true {
                if winLevel14 == false {
                let level14 = SKButton(imageName: "buttonLevel/14", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(14, forKey: "levelNumber")
                    
                    let scene = Level14(fileNamed: "Level14")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level14.setScale(0.35)
                level14.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 15)
                level14.zPosition = 11
                addChild(level14)
                } else if winLevel14 == true {
                    let level14 = SKButton(imageName: "buttonLevelWin/14", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(14, forKey: "levelNumber")
                        
                        let scene = Level14(fileNamed: "Level14")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level14.setScale(0.35)
                    level14.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 15)
                    level14.zPosition = 11
                    addChild(level14)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level14.position.x, y: level14.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel13 == false {
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
            if winLevel14 == true {
                if winLevel15 == false {
                let level15 = SKButton(imageName: "buttonLevel/15", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel15") {
                        
                        let scene = LevelDialogue15(fileNamed: "LevelDialogue15")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(15, forKey: "levelNumber")
                        
                        let scene = Level15(fileNamed: "Level15")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel15")
                    
                    
                })
                level15.setScale(0.35)
                level15.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 15)
                level15.zPosition = 11
                addChild(level15)
                } else if winLevel15 == true {
                    let level15 = SKButton(imageName: "buttonLevelWin/15", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(15, forKey: "levelNumber")
                        
                        let scene = Level15(fileNamed: "Level15")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level15.setScale(0.35)
                    level15.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 15)
                    level15.zPosition = 11
                    addChild(level15)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level15.position.x, y: level15.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel14 == false {
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
            if winLevel15 == true {
                if winLevel16 == false {
                let level16 = SKButton(imageName: "buttonLevel/16", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(16, forKey: "levelNumber")
                    
                    let scene = Level16(fileNamed: "Level16")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level16.setScale(0.35)
                level16.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 15)
                level16.zPosition = 11
                addChild(level16)
                } else if winLevel16 == true {
                    let level16 = SKButton(imageName: "buttonLevelWin/16", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(16, forKey: "levelNumber")
                        
                        let scene = Level16(fileNamed: "Level16")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level16.setScale(0.35)
                    level16.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 15)
                    level16.zPosition = 11
                    addChild(level16)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level16.position.x, y: level16.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel15 == false {
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
            if winLevel16 == true {
                if winLevel17 == false {
                let level17 = SKButton(imageName: "buttonLevel/17", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(17, forKey: "levelNumber")
                    
                    let scene = Level17(fileNamed: "Level17")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level17.setScale(0.35)
                level17.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 15)
                level17.zPosition = 11
                addChild(level17)
                } else if winLevel17 == true {
                    let level17 = SKButton(imageName: "buttonLevelWin/17", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(17, forKey: "levelNumber")
                        
                        let scene = Level17(fileNamed: "Level17")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level17.setScale(0.35)
                    level17.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 15)
                    level17.zPosition = 11
                    addChild(level17)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level17.position.x, y: level17.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel16 == false {
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
            if winLevel17 == true {
                if winLevel18 == false {
                let level18 = SKButton(imageName: "buttonLevel/18", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel18") {
                        
                        let scene = LevelDialogue18(fileNamed: "LevelDialogue18")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(18, forKey: "levelNumber")
                        
                        let scene = Level18(fileNamed: "Level18")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel18")
                    
                })
                level18.setScale(0.35)
                level18.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 15)
                level18.zPosition = 11
                addChild(level18)
                } else if winLevel18 == true {
                    let level18 = SKButton(imageName: "buttonLevelWin/18", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(18, forKey: "levelNumber")
                        
                        let scene = Level18(fileNamed: "Level18")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level18.setScale(0.35)
                    level18.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 15)
                    level18.zPosition = 11
                    addChild(level18)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level18.position.x, y: level18.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel17 == false {
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
            if winLevel18 == true {
                if winLevel19 == false {
                let level19 = SKButton(imageName: "buttonLevel/19", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(19, forKey: "levelNumber")
                    
                    let scene = Level19(fileNamed: "Level19")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level19.setScale(0.35)
                level19.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 15)
                level19.zPosition = 11
                addChild(level19)
                } else if winLevel19 == true {
                    let level19 = SKButton(imageName: "buttonLevelWin/19", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(19, forKey: "levelNumber")
                        
                        let scene = Level19(fileNamed: "Level19")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level19.setScale(0.35)
                    level19.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 15)
                    level19.zPosition = 11
                    addChild(level19)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level19.position.x, y: level19.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel18 == false {
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
            if winLevel19 == true {
                if winLevel20 == false {
                let level20 = SKButton(imageName: "buttonLevel/20", buttonAction: {
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel20") {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        let scene = LevelDialogue20(fileNamed: "LevelDialogue20")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(20, forKey: "levelNumber")
                        
                        let scene = Level20(fileNamed: "Level20")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel20")
                    
                    
                })
                level20.setScale(0.35)
                level20.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 15)
                level20.zPosition = 11
                addChild(level20)
                } else if winLevel20 == true {
                    let level20 = SKButton(imageName: "buttonLevelWin/20", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(20, forKey: "levelNumber")
                        
                        let scene = Level20(fileNamed: "Level20")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        
                        self.centreView.removeFromSuperview()
                    })
                    level20.setScale(0.35)
                    level20.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 15)
                    level20.zPosition = 11
                    addChild(level20)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level20.position.x, y: level20.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel19 == false {
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
            if winLevel20 == true {
                if winLevel21 == false {
                let level21 = SKButton(imageName: "buttonLevel/21", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(21, forKey: "levelNumber")
                    
                    let scene = Level21(fileNamed: "Level21")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level21.setScale(0.35)
                level21.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 115)
                level21.zPosition = 11
                addChild(level21)
                } else if winLevel21 == true {
                    let level21 = SKButton(imageName: "buttonLevelWin/21", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(21, forKey: "levelNumber")
                        
                        let scene = Level21(fileNamed: "Level21")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level21.setScale(0.35)
                    level21.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 115)
                    level21.zPosition = 11
                    addChild(level21)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level21.position.x, y: level21.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel20 == false {
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
            if winLevel21 == true {
                if winLevel22 == false {
                let level22 = SKButton(imageName: "buttonLevel/22", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel22") {
                        
                        let scene = LevelDialogue22(fileNamed: "LevelDialogue22")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(22, forKey: "levelNumber")
                        
                        let scene = Level22(fileNamed: "Level22")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel22")
                    
                    
                })
                level22.setScale(0.35)
                level22.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 115)
                level22.zPosition = 11
                addChild(level22)
                } else if winLevel22 == true {
                    let level22 = SKButton(imageName: "buttonLevelWin/22", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(22, forKey: "levelNumber")
                        
                        let scene = Level22(fileNamed: "Level22")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level22.setScale(0.35)
                    level22.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 115)
                    level22.zPosition = 11
                    addChild(level22)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level22.position.x, y: level22.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel21 == false {
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
            if winLevel22 == true {
                if winLevel23 == false {
                let level23 = SKButton(imageName: "buttonLevel/23", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(23, forKey: "levelNumber")
                    
                    let scene = Level23(fileNamed: "Level23")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level23.setScale(0.35)
                level23.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 115)
                level23.zPosition = 11
                addChild(level23)
                } else if winLevel23 == true {
                    let level23 = SKButton(imageName: "buttonLevelWin/23", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(23, forKey: "levelNumber")
                        
                        let scene = Level23(fileNamed: "Level23")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level23.setScale(0.35)
                    level23.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 115)
                    level23.zPosition = 11
                    addChild(level23)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level23.position.x, y: level23.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel22 == false {
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
            if winLevel23 == true {
                if winLevel24 == false {
                let level24 = SKButton(imageName: "buttonLevel/24", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(24, forKey: "levelNumber")
                    
                    let scene = Level24(fileNamed: "Level24")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level24.setScale(0.35)
                level24.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 115)
                level24.zPosition = 11
                addChild(level24)
                } else if winLevel24 == true {
                    let level24 = SKButton(imageName: "buttonLevelWin/24", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(24, forKey: "levelNumber")
                        
                        let scene = Level24(fileNamed: "Level24")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level24.setScale(0.35)
                    level24.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 115)
                    level24.zPosition = 11
                    addChild(level24)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level24.position.x, y: level24.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel23 == false {
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
            if winLevel24 == true {
                if winLevel25 == false {
                let level25 = SKButton(imageName: "buttonLevel/25", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel25") {
                        
                        let scene = LevelDialogue25(fileNamed: "LevelDialogue25")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(25, forKey: "levelNumber")
                        
                        let scene = Level25(fileNamed: "Level25")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel25")
                    
                })
                level25.setScale(0.35)
                level25.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 115)
                level25.zPosition = 11
                addChild(level25)
                } else if winLevel25 == true {
                    let level25 = SKButton(imageName: "buttonLevelWin/25", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(25, forKey: "levelNumber")
                        
                        let scene = Level25(fileNamed: "Level25")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level25.setScale(0.35)
                    level25.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 115)
                    level25.zPosition = 11
                    addChild(level25)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level25.position.x, y: level25.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel24 == false {
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
            if winLevel25 == true {
                if winLevel26 == false {
                let level26 = SKButton(imageName: "buttonLevel/26", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(26, forKey: "levelNumber")
                    
                    let scene = Level26(fileNamed: "Level26")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level26.setScale(0.35)
                level26.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 115)
                level26.zPosition = 11
                addChild(level26)
                } else if winLevel26 == true {
                    let level26 = SKButton(imageName: "buttonLevelWin/26", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(26, forKey: "levelNumber")
                        
                        let scene = Level26(fileNamed: "Level26")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level26.setScale(0.35)
                    level26.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 115)
                    level26.zPosition = 11
                    addChild(level26)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level26.position.x, y: level26.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel25 == false {
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
            if winLevel26 == true {
                if winLevel27 == false {
                let level27 = SKButton(imageName: "buttonLevel/27", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel27") {
                        
                        let scene = LevelDialogue27(fileNamed: "LevelDialogue27")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(27, forKey: "levelNumber")
                        
                        let scene = Level27(fileNamed: "Level27")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel27")
                })
                level27.setScale(0.35)
                level27.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 115)
                level27.zPosition = 11
                addChild(level27)
                } else if winLevel27 == true {
                    let level27 = SKButton(imageName: "buttonLevelWin/27", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(27, forKey: "levelNumber")
                        
                        let scene = Level27(fileNamed: "Level27")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level27.setScale(0.35)
                    level27.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 115)
                    level27.zPosition = 11
                    addChild(level27)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level27.position.x, y: level27.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel26 == false {
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
            if winLevel27 == true {
                if winLevel28 == false {
                    let level28 = SKButton(imageName: "buttonLevel/28", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(28, forKey: "levelNumber")
                        
                        let scene = Level28(fileNamed: "Level28")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.35)
                    level28.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 115)
                    level28.zPosition = 11
                    addChild(level28)
                } else if winLevel28 == true {
                    let level28 = SKButton(imageName: "buttonLevelWin/28", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(28, forKey: "levelNumber")
                        
                        let scene = Level28(fileNamed: "Level28")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.35)
                    level28.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 115)
                    level28.zPosition = 11
                    addChild(level28)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level28.position.x, y: level28.position.y - 5)
                    addChild(cloud)
                }
                
            } else if winLevel27 == false {
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
            if winLevel28 == true {
                if winLevel29 == false {
                    let level29 = SKButton(imageName: "buttonLevel/29", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(29, forKey: "levelNumber")
                        
                        let scene = Level29(fileNamed: "Level29")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level29.setScale(0.35)
                    level29.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 115)
                    level29.zPosition = 11
                    addChild(level29)
                } else if winLevel29 == true {
                    let level29 = SKButton(imageName: "buttonLevelWin/29", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(29, forKey: "levelNumber")
                        
                        let scene = Level29(fileNamed: "Level29")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level29.setScale(0.35)
                    level29.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 115)
                    level29.zPosition = 11
                    addChild(level29)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level29.position.x, y: level29.position.y - 5)
                    addChild(cloud)
                }
                
            } else if winLevel28 == false {
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
            if winLevel29 == true {
                if winLevel30 == false {
                    let level30 = SKButton(imageName: "buttonLevel/30", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel30") {
                            
                            let scene = LevelDialogue30(fileNamed: "LevelDialogue30")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                           } else {
                            
                            UserDefaults.standard.set(30, forKey: "levelNumber")
                            
                            let scene = Level30(fileNamed: "Level30")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                           }
                        UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel30")
                        
                    })
                    level30.setScale(0.35)
                    level30.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 115)
                    level30.zPosition = 11
                    addChild(level30)
                } else if winLevel30 == true {
                    let level30 = SKButton(imageName: "buttonLevelWin/30", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(30, forKey: "levelNumber")
                        
                        let scene = Level30(fileNamed: "Level30")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level30.setScale(0.35)
                    level30.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 115)
                    level30.zPosition = 11
                    addChild(level30)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level30.position.x, y: level30.position.y - 5)
                    addChild(cloud)
                }
                
            } else if winLevel29 == false {
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
            if winLevel1 == false {
            let level1 = SKButton(imageName: "buttonLevel/1", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel1") {
                    
                    let scene = LevelDialogue1(fileNamed: "LevelDialogue1")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(1, forKey: "levelNumber")
                    
                    let scene = Level1(fileNamed: "Level1")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel1")
                
            })
            level1.setScale(0.4)
            level1.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY + 110)
            level1.zPosition = 11
            addChild(level1)
            } else if winLevel1 == true {
                let level1 = SKButton(imageName: "buttonLevelWin/1", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(1, forKey: "levelNumber")
                    
                    let scene = Level1(fileNamed: "Level1")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level1.setScale(0.4)
                level1.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY + 110)
                level1.zPosition = 11
                addChild(level1)
                
                let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                cloud.zPosition = 1
                cloud.position = CGPoint(x: level1.position.x, y: level1.position.y - 5)
                addChild(cloud)
            }
            
            //2
            
            if winLevel1 == true {
                if winLevel2 == false {
                let level2 = SKButton(imageName: "buttonLevel/2", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel2") {
                        
                        let scene = LevelDialogue2(fileNamed: "LevelDialogue2")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(2, forKey: "levelNumber")
                        
                        let scene = Level2(fileNamed: "Level2")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel2")
                })
                level2.setScale(0.4)
                level2.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY + 110)
                level2.zPosition = 11
                addChild(level2)
                } else if winLevel2 == true {
                    let level2 = SKButton(imageName: "buttonLevelWin/2", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(2, forKey: "levelNumber")
                        
                        let scene = Level2(fileNamed: "Level2")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level2.setScale(0.4)
                    level2.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY + 110)
                    level2.zPosition = 11
                    addChild(level2)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level2.position.x, y: level2.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel1 == false {
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
            if winLevel2 == true {
                if winLevel3 == false {
            let level3 = SKButton(imageName: "buttonLevel/3", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(3, forKey: "levelNumber")
                
                let scene = Level3(fileNamed: "Level3")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level3.setScale(0.4)
            level3.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY + 110)
            level3.zPosition = 11
            addChild(level3)
                } else if winLevel3 == true {
                    let level3 = SKButton(imageName: "buttonLevelWin/3", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(3, forKey: "levelNumber")
                        
                        let scene = Level3(fileNamed: "Level3")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level3.setScale(0.4)
                    level3.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY + 110)
                    level3.zPosition = 11
                    addChild(level3)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level3.position.x, y: level3.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel2 == false {
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
            if winLevel3 == true {
                if winLevel4 == false {
            let level4 = SKButton(imageName: "buttonLevel/4", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel4") {
                    
                    let scene = LevelDialogue4(fileNamed: "LevelDialogue4")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(4, forKey: "levelNumber")
                    
                    let scene = Level4(fileNamed: "Level4")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel4")
                
            })
            level4.setScale(0.4)
            level4.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY + 110)
            level4.zPosition = 11
            addChild(level4)
                } else if winLevel4 == true {
                    let level4 = SKButton(imageName: "buttonLevelWin/4", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(4, forKey: "levelNumber")
                        
                        let scene = Level4(fileNamed: "Level4")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level4.setScale(0.4)
                    level4.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY + 110)
                    level4.zPosition = 11
                    addChild(level4)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level4.position.x, y: level4.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel3 == false {
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
            if winLevel4 == true {
                if winLevel5 == false {
            let level5 = SKButton(imageName: "buttonLevel/5", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(5, forKey: "levelNumber")
                
                let scene = Level5(fileNamed: "Level5")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level5.setScale(0.4)
            level5.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY + 110)
            level5.zPosition = 11
            addChild(level5)
                } else if winLevel5 == true {
                    let level5 = SKButton(imageName: "buttonLevelWin/5", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(5, forKey: "levelNumber")
                        
                        let scene = Level5(fileNamed: "Level5")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level5.setScale(0.4)
                    level5.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY + 110)
                    level5.zPosition = 11
                    addChild(level5)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level5.position.x, y: level5.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel4 == false {
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
            if winLevel5 == true {
                if winLevel6 == false {
            let level6 = SKButton(imageName: "buttonLevel/6", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(6, forKey: "levelNumber")
                
                let scene = Level6(fileNamed: "Level6")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level6.setScale(0.4)
            level6.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY + 110)
            level6.zPosition = 11
            addChild(level6)
                } else if winLevel6 == true {
                    let level6 = SKButton(imageName: "buttonLevelWin/6", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(6, forKey: "levelNumber")
                        
                        let scene = Level6(fileNamed: "Level6")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level6.setScale(0.4)
                    level6.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY + 110)
                    level6.zPosition = 11
                    addChild(level6)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level6.position.x, y: level6.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel5 == false {
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
            if winLevel6 == true {
                if winLevel7 == false {
            let level7 = SKButton(imageName: "buttonLevel/7", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel7") {
                    
                    let scene = LevelDialogue7(fileNamed: "LevelDialogue7")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(7, forKey: "levelNumber")
                    
                    let scene = Level7(fileNamed: "Level7")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel7")
                
            })
            level7.setScale(0.4)
            level7.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY + 110)
            level7.zPosition = 11
            addChild(level7)
                } else if winLevel7 == true {
                    let level7 = SKButton(imageName: "buttonLevelWin/7", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(7, forKey: "levelNumber")
                        
                        let scene = Level7(fileNamed: "Level7")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level7.setScale(0.4)
                    level7.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY + 110)
                    level7.zPosition = 11
                    addChild(level7)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level7.position.x, y: level7.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel6 == false {
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
            if winLevel7 == true {
                if winLevel8 == false {
            let level8 = SKButton(imageName: "buttonLevel/8", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(8, forKey: "levelNumber")
                
                let scene = Level8(fileNamed: "Level8")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level8.setScale(0.4)
            level8.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY + 110)
            level8.zPosition = 11
            addChild(level8)
                } else if winLevel8 == true {
                    let level8 = SKButton(imageName: "buttonLevelWin/8", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(8, forKey: "levelNumber")
                        
                        let scene = Level8(fileNamed: "Level8")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level8.setScale(0.4)
                    level8.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY + 110)
                    level8.zPosition = 11
                    addChild(level8)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level8.position.x, y: level8.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel7 == false {
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
            if winLevel8 == true {
                if winLevel9 == false {
            let level9 = SKButton(imageName: "buttonLevel/9", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel9") {
                    
                    let scene = LevelDialogue9(fileNamed: "LevelDialogue9")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(9, forKey: "levelNumber")
                    
                    let scene = Level9(fileNamed: "Level9")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel9")
                
            })
            level9.setScale(0.4)
            level9.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY + 110)
            level9.zPosition = 11
            addChild(level9)
                } else if winLevel9 == true {
                    let level9 = SKButton(imageName: "buttonLevelWin/9", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(9, forKey: "levelNumber")
                        
                        let scene = Level9(fileNamed: "Level9")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level9.setScale(0.4)
                    level9.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY + 110)
                    level9.zPosition = 11
                    addChild(level9)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level9.position.x, y: level9.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel8 == false {
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
            if winLevel9 == true {
                if winLevel10 == false {
            let level10 = SKButton(imageName: "buttonLevel/10", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(10, forKey: "levelNumber")
                
                let scene = Level10(fileNamed: "Level10")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level10.setScale(0.4)
            level10.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY + 110)
            level10.zPosition = 11
            addChild(level10)
                } else if winLevel10 == true {
                    let level10 = SKButton(imageName: "buttonLevelWin/10", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(10, forKey: "levelNumber")
                        
                        let scene = Level10(fileNamed: "Level10")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level10.setScale(0.4)
                    level10.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY + 110)
                    level10.zPosition = 11
                    addChild(level10)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level10.position.x, y: level10.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel9 == false {
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
            if winLevel10 == true {
                if winLevel11 == false {
            let level11 = SKButton(imageName: "buttonLevel/11", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(11, forKey: "levelNumber")
                
                let scene = Level11(fileNamed: "Level11")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level11.setScale(0.4)
            level11.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 15)
            level11.zPosition = 11
            addChild(level11)
                } else if winLevel11 == true {
                    let level11 = SKButton(imageName: "buttonLevelWin/11", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(11, forKey: "levelNumber")
                        
                        let scene = Level11(fileNamed: "Level11")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level11.setScale(0.4)
                    level11.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 15)
                    level11.zPosition = 11
                    addChild(level11)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level11.position.x, y: level11.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel10 == false {
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
            if winLevel11 == true {
                if winLevel12 == false {
            let level12 = SKButton(imageName: "buttonLevel/12", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(12, forKey: "levelNumber")
                
                let scene = Level12(fileNamed: "Level12")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level12.setScale(0.4)
            level12.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 15)
            level12.zPosition = 11
            addChild(level12)
                } else if winLevel12 == true {
                    let level12 = SKButton(imageName: "buttonLevelWin/12", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(12, forKey: "levelNumber")
                        
                        let scene = Level12(fileNamed: "Level12")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level12.setScale(0.4)
                    level12.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 15)
                    level12.zPosition = 11
                    addChild(level12)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level12.position.x, y: level12.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel11 == false {
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
            if winLevel12 == true {
                if winLevel13 == false {
            let level13 = SKButton(imageName: "buttonLevel/13", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(13, forKey: "levelNumber")
                
                let scene = Level13(fileNamed: "Level13")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level13.setScale(0.4)
            level13.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 15)
            level13.zPosition = 11
            addChild(level13)
                } else if winLevel13 == true {
                    let level13 = SKButton(imageName: "buttonLevelWin/13", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(13, forKey: "levelNumber")
                        
                        let scene = Level13(fileNamed: "Level13")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level13.setScale(0.4)
                    level13.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 15)
                    level13.zPosition = 11
                    addChild(level13)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level13.position.x, y: level13.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel12 == false {
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
            if winLevel13 == true {
                if winLevel14 == false {
            let level14 = SKButton(imageName: "buttonLevel/14", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(14, forKey: "levelNumber")
                
                let scene = Level14(fileNamed: "Level14")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level14.setScale(0.4)
            level14.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 15)
            level14.zPosition = 11
            addChild(level14)
                } else if winLevel14 == true {
                    let level14 = SKButton(imageName: "buttonLevelWin/14", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(14, forKey: "levelNumber")
                        
                        let scene = Level14(fileNamed: "Level14")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level14.setScale(0.4)
                    level14.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 15)
                    level14.zPosition = 11
                    addChild(level14)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level14.position.x, y: level14.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel13 == false {
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
            if winLevel14 == true {
                if winLevel15 == false {
            let level15 = SKButton(imageName: "buttonLevel/15", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel15") {
                    
                    let scene = LevelDialogue15(fileNamed: "LevelDialogue15")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(15, forKey: "levelNumber")
                    
                    let scene = Level15(fileNamed: "Level15")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel15")
               
            })
            level15.setScale(0.4)
            level15.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 15)
            level15.zPosition = 11
            addChild(level15)
                } else if winLevel15 == true {
                    let level15 = SKButton(imageName: "buttonLevelWin/15", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(15, forKey: "levelNumber")
                        
                        let scene = Level15(fileNamed: "Level15")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level15.setScale(0.4)
                    level15.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 15)
                    level15.zPosition = 11
                    addChild(level15)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level15.position.x, y: level15.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel14 == false {
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
            if winLevel15 == true {
                if winLevel16 == false {
            let level16 = SKButton(imageName: "buttonLevel/16", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(16, forKey: "levelNumber")
                
                let scene = Level16(fileNamed: "Level16")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level16.setScale(0.4)
            level16.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 15)
            level16.zPosition = 11
            addChild(level16)
                } else if winLevel16 {
                    let level16 = SKButton(imageName: "buttonLevelWin/16", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(16, forKey: "levelNumber")
                        
                        let scene = Level16(fileNamed: "Level16")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level16.setScale(0.4)
                    level16.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 15)
                    level16.zPosition = 11
                    addChild(level16)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level16.position.x, y: level16.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel15 == false {
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
            if winLevel16 == true {
                if winLevel17 == false {
            let level17 = SKButton(imageName: "buttonLevel/17", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(17, forKey: "levelNumber")
                
                let scene = Level17(fileNamed: "Level17")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level17.setScale(0.4)
            level17.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 15)
            level17.zPosition = 11
            addChild(level17)
                } else if winLevel17 == true {
                    let level17 = SKButton(imageName: "buttonLevelWin/17", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(17, forKey: "levelNumber")
                        
                        let scene = Level17(fileNamed: "Level17")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level17.setScale(0.4)
                    level17.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 15)
                    level17.zPosition = 11
                    addChild(level17)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level17.position.x, y: level17.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel16 == false {
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
            if winLevel17 == true {
                if winLevel18 == false {
            let level18 = SKButton(imageName: "buttonLevel/18", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel18") {
                    
                    let scene = LevelDialogue18(fileNamed: "LevelDialogue18")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(18, forKey: "levelNumber")
                    
                    let scene = Level18(fileNamed: "Level18")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel18")
                
            })
            level18.setScale(0.4)
            level18.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 15)
            level18.zPosition = 11
            addChild(level18)
                } else if winLevel18 == true {
                    let level18 = SKButton(imageName: "buttonLevelWin/18", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(18, forKey: "levelNumber")
                        
                        let scene = Level18(fileNamed: "Level18")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level18.setScale(0.4)
                    level18.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 15)
                    level18.zPosition = 11
                    addChild(level18)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level18.position.x, y: level18.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel17 == false {
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
            if winLevel18 == true {
                if winLevel19 == false {
            let level19 = SKButton(imageName: "buttonLevel/19", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(19, forKey: "levelNumber")
                
                let scene = Level19(fileNamed: "Level19")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level19.setScale(0.4)
            level19.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 15)
            level19.zPosition = 11
            addChild(level19)
                } else if winLevel19 == true {
                    let level19 = SKButton(imageName: "buttonLevelWin/19", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(19, forKey: "levelNumber")
                        
                        let scene = Level19(fileNamed: "Level19")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level19.setScale(0.4)
                    level19.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 15)
                    level19.zPosition = 11
                    addChild(level19)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level19.position.x, y: level19.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel18 == false {
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
            if winLevel19 == true {
                if winLevel20 == false {
            let level20 = SKButton(imageName: "buttonLevel/20", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel20") {
                    
                    let scene = LevelDialogue20(fileNamed: "LevelDialogue20")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(20, forKey: "levelNumber")
                    
                    let scene = Level20(fileNamed: "Level20")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel20")
                
            })
            level20.setScale(0.4)
            level20.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 15)
            level20.zPosition = 11
            addChild(level20)
                } else if winLevel20 == true {
                        let level20 = SKButton(imageName: "buttonLevelWin/20", buttonAction: {
                            
                            if self.sound == true {
                                self.run(Sound.pop.action)
                            }
                            
                            UserDefaults.standard.set(20, forKey: "levelNumber")
                            
                            let scene = Level20(fileNamed: "Level20")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            
                            self.centreView.removeFromSuperview()
                        })
                        level20.setScale(0.4)
                        level20.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 15)
                        level20.zPosition = 11
                        addChild(level20)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level20.position.x, y: level20.position.y - 5)
                    addChild(cloud)
                    }
            } else if winLevel19 == false {
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
            if winLevel20 == true {
                if winLevel21 == false {
                let level21 = SKButton(imageName: "buttonLevel/21", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(21, forKey: "levelNumber")
                
                let scene = Level21(fileNamed: "Level21")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level21.setScale(0.4)
            level21.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 130)
            level21.zPosition = 11
            addChild(level21)
                } else if winLevel21 == true {
                        let level21 = SKButton(imageName: "buttonLevelWin/21", buttonAction: {
                            
                            if self.sound == true {
                                self.run(Sound.pop.action)
                            }
                            
                        UserDefaults.standard.set(21, forKey: "levelNumber")
                        
                        let scene = Level21(fileNamed: "Level21")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                    })
                    level21.setScale(0.4)
                    level21.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 130)
                    level21.zPosition = 11
                    addChild(level21)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level21.position.x, y: level21.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel20 == false {
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
            if winLevel21 == true {
                if winLevel22 == false {
                let level22 = SKButton(imageName: "buttonLevel/22", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel22") {
                        
                        let scene = LevelDialogue22(fileNamed: "LevelDialogue22")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(22, forKey: "levelNumber")
                        
                        let scene = Level22(fileNamed: "Level22")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel22")
                    
            })
            level22.setScale(0.4)
            level22.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 130)
            level22.zPosition = 11
            addChild(level22)
                } else if winLevel22 == true {
                    let level22 = SKButton(imageName: "buttonLevelWin/22", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(22, forKey: "levelNumber")
                    
                    let scene = Level22(fileNamed: "Level22")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level22.setScale(0.4)
                level22.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 130)
                level22.zPosition = 11
                addChild(level22)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level22.position.x, y: level22.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel21 == false {
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
            if winLevel22 == true {
                if winLevel23 == false {
                let level23 = SKButton(imageName: "buttonLevel/23", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(23, forKey: "levelNumber")
                
                let scene = Level23(fileNamed: "Level23")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level23.setScale(0.4)
            level23.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 130)
            level23.zPosition = 11
            addChild(level23)
                } else if winLevel23 == true {
                    let level23 = SKButton(imageName: "buttonLevelWin/23", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(23, forKey: "levelNumber")
                    
                    let scene = Level23(fileNamed: "Level23")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level23.setScale(0.4)
                level23.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 130)
                level23.zPosition = 11
                addChild(level23)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level23.position.x, y: level23.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel22 == false {
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
            if winLevel23 == true {
                if winLevel24 == false {
                let level24 = SKButton(imageName: "buttonLevel/24", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(24, forKey: "levelNumber")
                
                let scene = Level24(fileNamed: "Level24")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level24.setScale(0.4)
            level24.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 130)
            level24.zPosition = 11
            addChild(level24)
                } else if winLevel24 == true {
                    let level24 = SKButton(imageName: "buttonLevelWin/24", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(24, forKey: "levelNumber")
                    
                    let scene = Level24(fileNamed: "Level24")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level24.setScale(0.4)
                level24.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 130)
                level24.zPosition = 11
                addChild(level24)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level24.position.x, y: level24.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel23 == false {
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
            if winLevel24 == true {
                if winLevel25 == false {
                let level25 = SKButton(imageName: "buttonLevel/25", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel25") {
                    
                    let scene = LevelDialogue25(fileNamed: "LevelDialogue25")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                        
                    UserDefaults.standard.set(25, forKey: "levelNumber")
                    
                    let scene = Level25(fileNamed: "Level25")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                        
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel25")
                
            })
            level25.setScale(0.4)
            level25.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 130)
            level25.zPosition = 11
            addChild(level25)
                } else if winLevel25 == true {
                    let level25 = SKButton(imageName: "buttonLevelWin/25", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(25, forKey: "levelNumber")
                    
                    let scene = Level25(fileNamed: "Level25")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level25.setScale(0.4)
                level25.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 130)
                level25.zPosition = 11
                addChild(level25)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level25.position.x, y: level25.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel24 == false {
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
            if winLevel25 == true {
                if winLevel26 == false {
                let level26 = SKButton(imageName: "buttonLevel/26", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(26, forKey: "levelNumber")
                
                let scene = Level26(fileNamed: "Level26")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level26.setScale(0.4)
            level26.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 130)
            level26.zPosition = 11
            addChild(level26)
                } else if winLevel26 == true {
                    let level26 = SKButton(imageName: "buttonLevelWin/26", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(26, forKey: "levelNumber")
                    
                    let scene = Level26(fileNamed: "Level26")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level26.setScale(0.4)
                level26.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 130)
                level26.zPosition = 11
                addChild(level26)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level26.position.x, y: level26.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel25 == false {
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
            if winLevel26 == true {
                if winLevel27 == false {
                let level27 = SKButton(imageName: "buttonLevel/27", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel27") {
                    
                    let scene = LevelDialogue27(fileNamed: "LevelDialogue27")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(27, forKey: "levelNumber")
                    
                    let scene = Level27(fileNamed: "Level27")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel27")
                
            })
            level27.setScale(0.4)
            level27.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 130)
            level27.zPosition = 11
            addChild(level27)
                } else if winLevel27 == true {
                    let level27 = SKButton(imageName: "buttonLevelWin/27", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(27, forKey: "levelNumber")
                    
                    let scene = Level27(fileNamed: "Level27")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level27.setScale(0.4)
                level27.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 130)
                level27.zPosition = 11
                addChild(level27)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level27.position.x, y: level27.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel26 == false {
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
            if winLevel27 == true {
                if winLevel28 == false {
            let level28 = SKButton(imageName: "buttonLevel/28", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(28, forKey: "levelNumber")
                
                let scene = Level28(fileNamed: "Level28")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level28.setScale(0.4)
            level28.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 130)
            level28.zPosition = 11
            addChild(level28)
                } else if winLevel28 == true {
                    let level28 = SKButton(imageName: "buttonLevelWin/28", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(28, forKey: "levelNumber")
                        
                        let scene = Level28(fileNamed: "Level28")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.4)
                    level28.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 130)
                    level28.zPosition = 11
                    addChild(level28)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level28.position.x, y: level28.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel27 == false {
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
            if winLevel28 == true {
                if winLevel29 == false {
                let level29 = SKButton(imageName: "buttonLevel/29", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(29, forKey: "levelNumber")
                
                let scene = Level29(fileNamed: "Level29")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level29.setScale(0.4)
            level29.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 130)
            level29.zPosition = 11
            addChild(level29)
                } else if winLevel29 == true {
                    let level29 = SKButton(imageName: "buttonLevelWin/29", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(29, forKey: "levelNumber")
                    
                    let scene = Level29(fileNamed: "Level29")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level29.setScale(0.4)
                level29.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 130)
                level29.zPosition = 11
                addChild(level29)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level29.position.x, y: level29.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel28 == false {
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
            if winLevel29 == true {
                if winLevel30 == false {
                let level30 = SKButton(imageName: "buttonLevel/30", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel30") {
                        
                        let scene = LevelDialogue30(fileNamed: "LevelDialogue30")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(30, forKey: "levelNumber")
                        
                        let scene = Level30(fileNamed: "Level30")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel30")
                
            })
            level30.setScale(0.4)
            level30.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 130)
            level30.zPosition = 11
            addChild(level30)
                } else if winLevel30 == true {
                    let level30 = SKButton(imageName: "buttonLevelWin/30", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(30, forKey: "levelNumber")
                    
                    let scene = Level30(fileNamed: "Level30")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level30.setScale(0.4)
                level30.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 130)
                level30.zPosition = 11
                addChild(level30)
                    
                    let cloud = SKEmitterNode(fileNamed: "Level.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level30.position.x, y: level30.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel29 == false {
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
