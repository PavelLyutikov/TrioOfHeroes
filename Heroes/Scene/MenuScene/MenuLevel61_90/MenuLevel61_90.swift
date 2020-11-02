//
//  MenuLevel1_30.swift
//  Elon's Adventure
//
//  Created by mac on 28.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit
import SpriteKit

class MenuLevel61_90: GameScene {
    
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
//        spawnLevelButton()
        spawnArrowUI()
        swipe()
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
        let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
        
        let transition = SKTransition.push(with: .right, duration: 1.0)
        scene!.scaleMode = .aspectFill
        self.view?.presentScene(scene!, transition: transition)
        
        self.centreView.removeFromSuperview()
    }
    func upLeft() {
        
    }

//MARK: - Background
    func spawnBackground() {
       
        backgroundColor = .black
        
        let label = SKLabelNode(fontNamed: "Antikvar Shadow")
        label.text = "To Be Continued..."
        label.color = .white
        label.fontSize = 36
        addChild(label)
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
                
                let arrow2 = SKSpriteNode(imageNamed: "arrowNext")
                arrow2.setScale(-0.8)
                arrow2.position = CGPoint(x: self.frame.midX - positionX, y: self.frame.midY - positionY)
                arrow2.zPosition = 11
                arrow2.alpha = 0.5
                addChild(arrow2)
            }
//MARK: - ButtonLevel_Screen > 800
        func spawnLevelButton() {
            
            if totalSize.width >= 800 {
            //1
                if winLevel30 == true {
                if winLevel31 == false {
                    let level1 = SKButton(imageName: "buttonLevel/31", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel31") {
                            
                            let scene = LevelDialogue31(fileNamed: "LevelDialogue31")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                           } else {
                            
                            UserDefaults.standard.set(31, forKey: "levelNumber")
                            
                            let scene = Level31(fileNamed: "Level31")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                           }
                        UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel31")
                        
                    })
                    level1.setScale(0.35)
                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
                    level1.zPosition = 11
                    addChild(level1)
                } else if winLevel31 == true {
                    let level1 = SKButton(imageName: "buttonLevelWin/31", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(31, forKey: "levelNumber")
                        
                        let scene = Level31(fileNamed: "Level31")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level1.setScale(0.35)
                    level1.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY + 100)
                    level1.zPosition = 11
                    addChild(level1)
                    
                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level1.position.x, y: level1.position.y - 5)
                    addChild(cloud)
                }
                } else if winLevel30 == false {
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
            if winLevel31 == true {
                if winLevel32 == false {
                let level2 = SKButton(imageName: "buttonLevel/32", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel32") {
                        
                        let scene = LevelDialogue32(fileNamed: "LevelDialogue32")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(32, forKey: "levelNumber")
                        
                        let scene = Level32(fileNamed: "Level32")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel32")
                    
                })
                level2.setScale(0.35)
                level2.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY + 100)
                level2.zPosition = 11
                addChild(level2)
                } else if winLevel32 == true {
                    let level2 = SKButton(imageName: "buttonLevelWin/32", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(32, forKey: "levelNumber")
                        
                        let scene = Level32(fileNamed: "Level32")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level2.setScale(0.35)
                    level2.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY + 100)
                    level2.zPosition = 11
                    addChild(level2)
                    
                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level2.position.x, y: level2.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel31 == false {
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
            if winLevel32 == true {
                if winLevel33 == false {
                let level3 = SKButton(imageName: "buttonLevel/33", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(33, forKey: "levelNumber")
                    
                    let scene = Level33(fileNamed: "Level33")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level3.setScale(0.35)
                level3.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 100)
                level3.zPosition = 11
                addChild(level3)
                } else if winLevel33 == true {
                let level3 = SKButton(imageName: "buttonLevelWin/33", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(33, forKey: "levelNumber")
                    
                    let scene = Level33(fileNamed: "Level33")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level3.setScale(0.35)
                level3.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY + 100)
                level3.zPosition = 11
                addChild(level3)
                    
                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level3.position.x, y: level3.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel32 == false {
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
            if winLevel33 == true {
                if winLevel34 == false {
                let level4 = SKButton(imageName: "buttonLevel/34", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel34") {
                        
                        let scene = LevelDialogue34(fileNamed: "LevelDialogue34")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(34, forKey: "levelNumber")

                        let scene = Level34(fileNamed: "Level34")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel34")
                    
                })
                level4.setScale(0.35)
                level4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 100)
                level4.zPosition = 11
                addChild(level4)
                } else if winLevel34 == true {
                    let level4 = SKButton(imageName: "buttonLevelWin/34", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(34, forKey: "levelNumber")

                        let scene = Level34(fileNamed: "Level34")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level4.setScale(0.35)
                    level4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 100)
                    level4.zPosition = 11
                    addChild(level4)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level4.position.x, y: level4.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel33 == false {
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
            if winLevel34 == true {
                if winLevel35 == false {
                let level5 = SKButton(imageName: "buttonLevel/35", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel35") {
                        
                        let scene = LevelDialogue35(fileNamed: "LevelDialogue35")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(35, forKey: "levelNumber")

                        let scene = Level35(fileNamed: "Level35")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel35")
                    
                })
                level5.setScale(0.35)
                level5.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY + 100)
                level5.zPosition = 11
                addChild(level5)
                } else if winLevel35 == true {
                    let level5 = SKButton(imageName: "buttonLevelWin/35", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(35, forKey: "levelNumber")

                        let scene = Level35(fileNamed: "Level35")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level5.setScale(0.35)
                    level5.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY + 100)
                    level5.zPosition = 11
                    addChild(level5)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level5.position.x, y: level5.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel34 == false {
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
            if winLevel35 == true {
                if winLevel36 == false {
                let level6 = SKButton(imageName: "buttonLevel/36", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(36, forKey: "levelNumber")

                    let scene = Level36(fileNamed: "Level36")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level6.setScale(0.35)
                level6.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY + 100)
                level6.zPosition = 11
                addChild(level6)
                } else if winLevel36 == true {
                    let level6 = SKButton(imageName: "buttonLevelWin/36", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(36, forKey: "levelNumber")

                        let scene = Level36(fileNamed: "Level36")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level6.setScale(0.35)
                    level6.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY + 100)
                    level6.zPosition = 11
                    addChild(level6)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level6.position.x, y: level6.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel35 == false {
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
            if winLevel36 == true {
                if winLevel37 == false {
                let level7 = SKButton(imageName: "buttonLevel/37", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(37, forKey: "levelNumber")

                    let scene = Level37(fileNamed: "Level37")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level7.setScale(0.35)
                level7.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 100)
                level7.zPosition = 11
                addChild(level7)
                } else if winLevel37 == true {
                    let level7 = SKButton(imageName: "buttonLevelWin/37", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(37, forKey: "levelNumber")

                        let scene = Level37(fileNamed: "Level37")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level7.setScale(0.35)
                    level7.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 100)
                    level7.zPosition = 11
                    addChild(level7)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level7.position.x, y: level7.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel36 == false {
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
            if winLevel37 == true {
                if winLevel38 == false {
                let level8 = SKButton(imageName: "buttonLevel/38", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel38") {
                        
                        let scene = LevelDialogue38(fileNamed: "LevelDialogue38")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(38, forKey: "levelNumber")

                        let scene = Level38(fileNamed: "Level38")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel38")
                    
                })
                level8.setScale(0.35)
                level8.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 100)
                level8.zPosition = 11
                addChild(level8)
                } else if winLevel38 == true {
                    let level8 = SKButton(imageName: "buttonLevelWin/38", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(38, forKey: "levelNumber")

                        let scene = Level38(fileNamed: "Level38")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level8.setScale(0.35)
                    level8.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 100)
                    level8.zPosition = 11
                    addChild(level8)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level8.position.x, y: level8.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel37 == false {
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
            if winLevel38 == true {
                if winLevel39 == false {
                let level9 = SKButton(imageName: "buttonLevel/39", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(39, forKey: "levelNumber")

                    let scene = Level39(fileNamed: "Level39")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level9.setScale(0.35)
                level9.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY + 100)
                level9.zPosition = 11
                addChild(level9)
                } else if winLevel39 == true {
                    let level9 = SKButton(imageName: "buttonLevelWin/39", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(39, forKey: "levelNumber")

                        let scene = Level39(fileNamed: "Level39")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level9.setScale(0.35)
                    level9.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY + 100)
                    level9.zPosition = 11
                    addChild(level9)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level9.position.x, y: level9.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel38 == false {
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
            if winLevel39 == true {
                if winLevel40 == false {
                let level10 = SKButton(imageName: "buttonLevel/40", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel40") {
                        
                        let scene = LevelDialogue40(fileNamed: "LevelDialogue40")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(40, forKey: "levelNumber")

                        let scene = Level40(fileNamed: "Level40")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel40")
                    
                })
                level10.setScale(0.35)
                level10.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY + 100)
                level10.zPosition = 11
                addChild(level10)
                } else if winLevel40 == true {
                    let level10 = SKButton(imageName: "buttonLevelWin/40", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(40, forKey: "levelNumber")

                        let scene = Level40(fileNamed: "Level40")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level10.setScale(0.35)
                    level10.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY + 100)
                    level10.zPosition = 11
                    addChild(level10)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level10.position.x, y: level10.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel39 == false {
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
            if winLevel40 == true {
                if winLevel41 == false {
                let level11 = SKButton(imageName: "buttonLevel/41", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(41, forKey: "levelNumber")

                    let scene = Level11(fileNamed: "Level41")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level11.setScale(0.35)
                level11.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 15)
                level11.zPosition = 11
                addChild(level11)
                } else if winLevel41 == true {
                    let level11 = SKButton(imageName: "buttonLevelWin/41", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(41, forKey: "levelNumber")

                        let scene = Level41(fileNamed: "Level41")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level11.setScale(0.35)
                    level11.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 15)
                    level11.zPosition = 11
                    addChild(level11)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level11.position.x, y: level11.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel40 == false {
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
            if winLevel41 == true {
                if winLevel42 == false {
                let level12 = SKButton(imageName: "buttonLevel/42", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(42, forKey: "levelNumber")

                    let scene = Level42(fileNamed: "Level42")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level12.setScale(0.35)
                level12.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 15)
                level12.zPosition = 11
                addChild(level12)
                } else if winLevel42 == true {
                    let level12 = SKButton(imageName: "buttonLevelWin/42", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(42, forKey: "levelNumber")

                        let scene = Level42(fileNamed: "Level42")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level12.setScale(0.35)
                    level12.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 15)
                    level12.zPosition = 11
                    addChild(level12)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level12.position.x, y: level12.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel41 == false {
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
            if winLevel42 == true {
                if winLevel43 == false {
                let level13 = SKButton(imageName: "buttonLevel/43", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(43, forKey: "levelNumber")

                    let scene = Level43(fileNamed: "Level43")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level13.setScale(0.35)
                level13.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 15)
                level13.zPosition = 11
                addChild(level13)
                } else if winLevel43 == false {
                    let level13 = SKButton(imageName: "buttonLevelWin/43", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(43, forKey: "levelNumber")

                        let scene = Level43(fileNamed: "Level43")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level13.setScale(0.35)
                    level13.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 15)
                    level13.zPosition = 11
                    addChild(level13)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level13.position.x, y: level13.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel42 == false {
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
            if winLevel43 == true {
                if winLevel44 == false {
                let level14 = SKButton(imageName: "buttonLevel/44", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(44, forKey: "levelNumber")

                    let scene = Level44(fileNamed: "Level44")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level14.setScale(0.35)
                level14.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 15)
                level14.zPosition = 11
                addChild(level14)
                } else if winLevel44 == true {
                    let level14 = SKButton(imageName: "buttonLevelWin/44", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(44, forKey: "levelNumber")

                        let scene = Level44(fileNamed: "Level44")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level14.setScale(0.35)
                    level14.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 15)
                    level14.zPosition = 11
                    addChild(level14)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level14.position.x, y: level14.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel43 == false {
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
            if winLevel44 == true {
                if winLevel45 == false {
                let level15 = SKButton(imageName: "buttonLevel/45", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel45") {
                        
                        let scene = LevelDialogue45(fileNamed: "LevelDialogue45")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(45, forKey: "levelNumber")

                        let scene = Level45(fileNamed: "Level45")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel45")
                    
                })
                level15.setScale(0.35)
                level15.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 15)
                level15.zPosition = 11
                addChild(level15)
                } else if winLevel45 == true {
                    let level15 = SKButton(imageName: "buttonLevelWin/45", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(45, forKey: "levelNumber")

                        let scene = Level45(fileNamed: "Level45")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level15.setScale(0.35)
                    level15.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 15)
                    level15.zPosition = 11
                    addChild(level15)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level15.position.x, y: level15.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel44 == false {
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
            if winLevel45 == true {
                if winLevel46 == false {
                let level16 = SKButton(imageName: "buttonLevel/46", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(46, forKey: "levelNumber")

                    let scene = Level46(fileNamed: "Level46")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level16.setScale(0.35)
                level16.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 15)
                level16.zPosition = 11
                addChild(level16)
                } else if winLevel46 == true {
                    let level16 = SKButton(imageName: "buttonLevelWin/46", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(46, forKey: "levelNumber")

                        let scene = Level46(fileNamed: "Level46")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level16.setScale(0.35)
                    level16.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 15)
                    level16.zPosition = 11
                    addChild(level16)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level16.position.x, y: level16.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel45 == false {
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
            if winLevel46 == true {
                if winLevel47 == false {
                let level17 = SKButton(imageName: "buttonLevel/47", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(47, forKey: "levelNumber")

                    let scene = Level47(fileNamed: "Level47")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level17.setScale(0.35)
                level17.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 15)
                level17.zPosition = 11
                addChild(level17)
                } else if winLevel47 == true {
                    let level17 = SKButton(imageName: "buttonLevelWin/47", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(47, forKey: "levelNumber")

                        let scene = Level47(fileNamed: "Level47")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level17.setScale(0.35)
                    level17.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 15)
                    level17.zPosition = 11
                    addChild(level17)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level17.position.x, y: level17.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel46 == false {
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
            if winLevel47 == true {
                if winLevel48 == false {
                let level18 = SKButton(imageName: "buttonLevel/48", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel48") {
                        
                        let scene = LevelDialogue48(fileNamed: "LevelDialogue48")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(48, forKey: "levelNumber")

                        let scene = Level48(fileNamed: "Level48")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel48")
                    
                })
                level18.setScale(0.35)
                level18.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 15)
                level18.zPosition = 11
                addChild(level18)
                } else if winLevel48 == true {
                    let level18 = SKButton(imageName: "buttonLevelWin/48", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(48, forKey: "levelNumber")

                        let scene = Level48(fileNamed: "Level48")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level18.setScale(0.35)
                    level18.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 15)
                    level18.zPosition = 11
                    addChild(level18)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level18.position.x, y: level18.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel47 == false {
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
            if winLevel48 == true {
                if winLevel49 == false {
                let level19 = SKButton(imageName: "buttonLevel/49", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(49, forKey: "levelNumber")

                    let scene = Level49(fileNamed: "Level49")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level19.setScale(0.35)
                level19.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 15)
                level19.zPosition = 11
                addChild(level19)
                } else if winLevel49 == true {
                    let level19 = SKButton(imageName: "buttonLevelWin/49", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(49, forKey: "levelNumber")

                        let scene = Level49(fileNamed: "Level49")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level19.setScale(0.35)
                    level19.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 15)
                    level19.zPosition = 11
                    addChild(level19)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level19.position.x, y: level19.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel48 == false {
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
            if winLevel49 == true {
                if winLevel50 == false {
                let level20 = SKButton(imageName: "buttonLevel/50", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel50") {
                        
                        let scene = LevelDialogue50(fileNamed: "LevelDialogue50")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(50, forKey: "levelNumber")

                        let scene = Level50(fileNamed: "Level50")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel50")
                    
                })
                level20.setScale(0.35)
                level20.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 15)
                level20.zPosition = 11
                addChild(level20)
                } else if winLevel50 == true {
                    let level20 = SKButton(imageName: "buttonLevelWin/50", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(50, forKey: "levelNumber")

                        let scene = Level50(fileNamed: "Level50")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level20.setScale(0.35)
                    level20.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 15)
                    level20.zPosition = 11
                    addChild(level20)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level20.position.x, y: level20.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel49 == false {
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
            if winLevel50 == true {
                if winLevel51 == false {
                let level21 = SKButton(imageName: "buttonLevel/51", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(51, forKey: "levelNumber")

                    let scene = Level51(fileNamed: "Level51")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level21.setScale(0.35)
                level21.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 115)
                level21.zPosition = 11
                addChild(level21)
                } else if winLevel51 == true {
                    let level21 = SKButton(imageName: "buttonLevelWin/51", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(51, forKey: "levelNumber")

                        let scene = Level51(fileNamed: "Level51")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level21.setScale(0.35)
                    level21.position = CGPoint(x: self.frame.midX - 270, y: self.frame.midY - 115)
                    level21.zPosition = 11
                    addChild(level21)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level21.position.x, y: level21.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel50 == false {
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
            if winLevel51 == true {
                if winLevel52 == false {
                let level22 = SKButton(imageName: "buttonLevel/52", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel52") {
                        
                        let scene = LevelDialogue52(fileNamed: "LevelDialogue52")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(52, forKey: "levelNumber")

                        let scene = Level52(fileNamed: "Level52")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel52")
                    
                })
                level22.setScale(0.35)
                level22.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 115)
                level22.zPosition = 11
                addChild(level22)
                } else if winLevel52 == true {
                    let level22 = SKButton(imageName: "buttonLevelWin/52", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(52, forKey: "levelNumber")

                        let scene = Level52(fileNamed: "Level52")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level22.setScale(0.35)
                    level22.position = CGPoint(x: self.frame.midX - 210, y: self.frame.midY - 115)
                    level22.zPosition = 11
                    addChild(level22)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level22.position.x, y: level22.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel51 == false {
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
            if winLevel52 == true {
                if winLevel53 == false {
                let level23 = SKButton(imageName: "buttonLevel/53", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(53, forKey: "levelNumber")

                    let scene = Level53(fileNamed: "Level53")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level23.setScale(0.35)
                level23.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 115)
                level23.zPosition = 11
                addChild(level23)
                } else if winLevel53 == true {
                    let level23 = SKButton(imageName: "buttonLevelWin/53", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(53, forKey: "levelNumber")

                        let scene = Level53(fileNamed: "Level53")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level23.setScale(0.35)
                    level23.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY - 115)
                    level23.zPosition = 11
                    addChild(level23)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level23.position.x, y: level23.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel52 == false {
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
            if winLevel53 == true {
                if winLevel54 == false {
                let level24 = SKButton(imageName: "buttonLevel/54", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(54, forKey: "levelNumber")

                    let scene = Level54(fileNamed: "Level54")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level24.setScale(0.35)
                level24.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 115)
                level24.zPosition = 11
                addChild(level24)
                } else if winLevel54 == true {
                    let level24 = SKButton(imageName: "buttonLevelWin/54", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(54, forKey: "levelNumber")

                        let scene = Level54(fileNamed: "Level54")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level24.setScale(0.35)
                    level24.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 115)
                    level24.zPosition = 11
                    addChild(level24)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level24.position.x, y: level24.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel53 == false {
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
            if winLevel54 == true {
                if winLevel55 == false {
                let level25 = SKButton(imageName: "buttonLevel/55", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel55") {
                        
                        let scene = LevelDialogue55(fileNamed: "LevelDialogue55")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(55, forKey: "levelNumber")

                        let scene = Level55(fileNamed: "Level55")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel55")
                    
                })
                level25.setScale(0.35)
                level25.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 115)
                level25.zPosition = 11
                addChild(level25)
                } else if winLevel55 == true {
                    let level25 = SKButton(imageName: "buttonLevelWin/55", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(55, forKey: "levelNumber")

                        let scene = Level55(fileNamed: "Level55")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level25.setScale(0.35)
                    level25.position = CGPoint(x: self.frame.midX - 30, y: self.frame.midY - 115)
                    level25.zPosition = 11
                    addChild(level25)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level25.position.x, y: level25.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel54 == false {
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
            if winLevel55 == true {
                if winLevel56 == false {
                let level26 = SKButton(imageName: "buttonLevel/56", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(56, forKey: "levelNumber")

                    let scene = Level56(fileNamed: "Level56")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level26.setScale(0.35)
                level26.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 115)
                level26.zPosition = 11
                addChild(level26)
                } else if winLevel56 == true {
                    let level26 = SKButton(imageName: "buttonLevelWin/56", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(56, forKey: "levelNumber")

                        let scene = Level56(fileNamed: "Level56")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level26.setScale(0.35)
                    level26.position = CGPoint(x: self.frame.midX + 30, y: self.frame.midY - 115)
                    level26.zPosition = 11
                    addChild(level26)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level26.position.x, y: level26.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel55 == false {
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
            if winLevel56 == true {
                if winLevel57 == false {
                let level27 = SKButton(imageName: "buttonLevel/57", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(57, forKey: "levelNumber")

                    let scene = Level57(fileNamed: "Level57")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level27.setScale(0.35)
                level27.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 115)
                level27.zPosition = 11
                addChild(level27)
                } else if winLevel57 == true {
                    let level27 = SKButton(imageName: "buttonLevelWin/57", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(57, forKey: "levelNumber")

                        let scene = Level57(fileNamed: "Level57")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level27.setScale(0.35)
                    level27.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 115)
                    level27.zPosition = 11
                    addChild(level27)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level27.position.x, y: level27.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel56 == false {
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
            if winLevel57 == true {
                if winLevel58 == false {
                    let level28 = SKButton(imageName: "buttonLevel/58", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(58, forKey: "levelNumber")

                        let scene = Level58(fileNamed: "Level58")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.35)
                    level28.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 115)
                    level28.zPosition = 11
                    addChild(level28)
                } else if winLevel58 == true {
                    let level28 = SKButton(imageName: "buttonLevelWin/58", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(58, forKey: "levelNumber")

                        let scene = Level58(fileNamed: "Level58")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.35)
                    level28.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 115)
                    level28.zPosition = 11
                    addChild(level28)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level28.position.x, y: level28.position.y - 5)
                    addChild(cloud)
                }

            } else if winLevel57 == false {
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
            if winLevel58 == true {
                if winLevel59 == false {
                    let level29 = SKButton(imageName: "buttonLevel/59", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                            UserDefaults.standard.set(59, forKey: "levelNumber")

                            let scene = Level59(fileNamed: "Level59")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                            
                        
                    })
                    level29.setScale(0.35)
                    level29.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 115)
                    level29.zPosition = 11
                    addChild(level29)
                } else if winLevel59 == true {
                    let level29 = SKButton(imageName: "buttonLevelWin/59", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(59, forKey: "levelNumber")

                        let scene = Level59(fileNamed: "Level59")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level29.setScale(0.35)
                    level29.position = CGPoint(x: self.frame.midX + 210, y: self.frame.midY - 115)
                    level29.zPosition = 11
                    addChild(level29)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level29.position.x, y: level29.position.y - 5)
                    addChild(cloud)
                }

            } else if winLevel58 == false {
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
            if winLevel59 == true {
                if winLevel60 == false {
                    let level30 = SKButton(imageName: "buttonLevel/60", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(60, forKey: "levelNumber")

                        let scene = Level60(fileNamed: "Level60")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level30.setScale(0.35)
                    level30.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 115)
                    level30.zPosition = 11
                    addChild(level30)
                } else if winLevel60 == true {
                    let level30 = SKButton(imageName: "buttonLevelWin/60", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(60, forKey: "levelNumber")

                        let scene = Level60(fileNamed: "Level60")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level30.setScale(0.35)
                    level30.position = CGPoint(x: self.frame.midX + 270, y: self.frame.midY - 115)
                    level30.zPosition = 11
                    addChild(level30)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level30.position.x, y: level30.position.y - 5)
                    addChild(cloud)
                }

            } else if winLevel59 == false {
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
            if winLevel30 == true {
            if winLevel31 == false {
            let level1 = SKButton(imageName: "buttonLevel/31", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel31") {
                    
                    let scene = LevelDialogue31(fileNamed: "LevelDialogue31")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(31, forKey: "levelNumber")

                    let scene = Level31(fileNamed: "Level31")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel31")
                
            })
            level1.setScale(0.4)
            level1.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY + 110)
            level1.zPosition = 11
            addChild(level1)
            } else if winLevel31 == true {
                let level1 = SKButton(imageName: "buttonLevelWin/31", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    UserDefaults.standard.set(31, forKey: "levelNumber")

                    let scene = Level31(fileNamed: "Level31")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                })
                level1.setScale(0.4)
                level1.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY + 110)
                level1.zPosition = 11
                addChild(level1)

                let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                cloud.zPosition = 1
                cloud.position = CGPoint(x: level1.position.x, y: level1.position.y - 5)
                addChild(cloud)
            }
            } else if winLevel30 == false {
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

            if winLevel31 == true {
                if winLevel32 == false {
                let level2 = SKButton(imageName: "buttonLevel/32", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel32") {
                        
                        let scene = LevelDialogue32(fileNamed: "LevelDialogue32")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(32, forKey: "levelNumber")

                        let scene = Level32(fileNamed: "Level32")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel32")
                    
                })
                level2.setScale(0.4)
                level2.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY + 110)
                level2.zPosition = 11
                addChild(level2)
                } else if winLevel32 == true {
                    let level2 = SKButton(imageName: "buttonLevelWin/32", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(32, forKey: "levelNumber")

                        let scene = Level32(fileNamed: "Level32")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level2.setScale(0.4)
                    level2.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY + 110)
                    level2.zPosition = 11
                    addChild(level2)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level2.position.x, y: level2.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel31 == false {
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
            if winLevel32 == true {
                if winLevel33 == false {
            let level3 = SKButton(imageName: "buttonLevel/33", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(33, forKey: "levelNumber")

                let scene = Level33(fileNamed: "Level33")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level3.setScale(0.4)
            level3.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY + 110)
            level3.zPosition = 11
            addChild(level3)
                } else if winLevel33 == true {
                    let level3 = SKButton(imageName: "buttonLevelWin/33", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(33, forKey: "levelNumber")

                        let scene = Level33(fileNamed: "Level33")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level3.setScale(0.4)
                    level3.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY + 110)
                    level3.zPosition = 11
                    addChild(level3)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level3.position.x, y: level3.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel32 == false {
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
            if winLevel33 == true {
                if winLevel34 == false {
            let level4 = SKButton(imageName: "buttonLevel/34", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel34") {
                    
                    let scene = LevelDialogue34(fileNamed: "LevelDialogue34")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(34, forKey: "levelNumber")

                    let scene = Level34(fileNamed: "Level34")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel34")
                
            })
            level4.setScale(0.4)
            level4.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY + 110)
            level4.zPosition = 11
            addChild(level4)
                } else if winLevel34 == true {
                    let level4 = SKButton(imageName: "buttonLevelWin/34", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(34, forKey: "levelNumber")

                        let scene = Level34(fileNamed: "Level34")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level4.setScale(0.4)
                    level4.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY + 110)
                    level4.zPosition = 11
                    addChild(level4)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level4.position.x, y: level4.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel33 == false {
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
            if winLevel34 == true {
                if winLevel35 == false {
            let level5 = SKButton(imageName: "buttonLevel/35", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel35") {
                    
                    let scene = LevelDialogue35(fileNamed: "LevelDialogue35")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(35, forKey: "levelNumber")

                    let scene = Level35(fileNamed: "Level35")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel35")
                
            })
            level5.setScale(0.4)
            level5.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY + 110)
            level5.zPosition = 11
            addChild(level5)
                } else if winLevel35 == true {
                    let level5 = SKButton(imageName: "buttonLevelWin/35", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(35, forKey: "levelNumber")

                        let scene = Level35(fileNamed: "Level35")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level5.setScale(0.4)
                    level5.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY + 110)
                    level5.zPosition = 11
                    addChild(level5)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level5.position.x, y: level5.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel34 == false {
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
            if winLevel35 == true {
                if winLevel36 == false {
            let level6 = SKButton(imageName: "buttonLevel/36", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(36, forKey: "levelNumber")

                let scene = Level36(fileNamed: "Level36")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level6.setScale(0.4)
            level6.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY + 110)
            level6.zPosition = 11
            addChild(level6)
                } else if winLevel36 == true {
                    let level6 = SKButton(imageName: "buttonLevelWin/36", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(36, forKey: "levelNumber")

                        let scene = Level36(fileNamed: "Level36")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level6.setScale(0.4)
                    level6.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY + 110)
                    level6.zPosition = 11
                    addChild(level6)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level6.position.x, y: level6.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel35 == false {
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
            if winLevel36 == true {
                if winLevel37 == false {
            let level7 = SKButton(imageName: "buttonLevel/37", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(37, forKey: "levelNumber")

                let scene = Level37(fileNamed: "Level37")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level7.setScale(0.4)
            level7.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY + 110)
            level7.zPosition = 11
            addChild(level7)
                } else if winLevel37 == true {
                    let level7 = SKButton(imageName: "buttonLevelWin/37", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(37, forKey: "levelNumber")

                        let scene = Level37(fileNamed: "Level37")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level7.setScale(0.4)
                    level7.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY + 110)
                    level7.zPosition = 11
                    addChild(level7)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level7.position.x, y: level7.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel36 == false {
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
            if winLevel37 == true {
                if winLevel38 == false {
            let level8 = SKButton(imageName: "buttonLevel/38", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel38") {
                    
                    let scene = LevelDialogue38(fileNamed: "LevelDialogue38")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(38, forKey: "levelNumber")

                    let scene = Level38(fileNamed: "Level38")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel38")
                
            })
            level8.setScale(0.4)
            level8.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY + 110)
            level8.zPosition = 11
            addChild(level8)
                } else if winLevel38 == true {
                    let level8 = SKButton(imageName: "buttonLevelWin/38", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(38, forKey: "levelNumber")

                        let scene = Level38(fileNamed: "Level38")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level8.setScale(0.4)
                    level8.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY + 110)
                    level8.zPosition = 11
                    addChild(level8)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level8.position.x, y: level8.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel37 == false {
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
            if winLevel38 == true {
                if winLevel39 == false {
            let level9 = SKButton(imageName: "buttonLevel/39", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(39, forKey: "levelNumber")

                let scene = Level39(fileNamed: "Level39")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level9.setScale(0.4)
            level9.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY + 110)
            level9.zPosition = 11
            addChild(level9)
                } else if winLevel39 == true {
                    let level9 = SKButton(imageName: "buttonLevelWin/39", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(39, forKey: "levelNumber")

                        let scene = Level39(fileNamed: "Level39")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level9.setScale(0.4)
                    level9.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY + 110)
                    level9.zPosition = 11
                    addChild(level9)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level9.position.x, y: level9.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel38 == false {
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
            if winLevel39 == true {
                if winLevel40 == false {
            let level10 = SKButton(imageName: "buttonLevel/40", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel40") {
                    
                    let scene = LevelDialogue40(fileNamed: "LevelDialogue40")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(40, forKey: "levelNumber")

                    let scene = Level40(fileNamed: "Level40")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel40")
                
            })
            level10.setScale(0.4)
            level10.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY + 110)
            level10.zPosition = 11
            addChild(level10)
                } else if winLevel40 == true {
                    let level10 = SKButton(imageName: "buttonLevelWin/40", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(40, forKey: "levelNumber")

                        let scene = Level40(fileNamed: "Level40")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level10.setScale(0.4)
                    level10.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY + 110)
                    level10.zPosition = 11
                    addChild(level10)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level10.position.x, y: level10.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel39 == false {
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
            if winLevel40 == true {
                if winLevel41 == false {
            let level11 = SKButton(imageName: "buttonLevel/41", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(41, forKey: "levelNumber")

                let scene = Level41(fileNamed: "Level41")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level11.setScale(0.4)
            level11.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 15)
            level11.zPosition = 11
            addChild(level11)
                } else if winLevel41 == true {
                    let level11 = SKButton(imageName: "buttonLevelWin/41", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(41, forKey: "levelNumber")

                        let scene = Level41(fileNamed: "Level41")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level11.setScale(0.4)
                    level11.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 15)
                    level11.zPosition = 11
                    addChild(level11)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level11.position.x, y: level11.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel40 == false {
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
            if winLevel41 == true {
                if winLevel42 == false {
            let level12 = SKButton(imageName: "buttonLevel/42", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(42, forKey: "levelNumber")

                let scene = Level42(fileNamed: "Level42")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level12.setScale(0.4)
            level12.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 15)
            level12.zPosition = 11
            addChild(level12)
                } else if winLevel42 == true {
                    let level12 = SKButton(imageName: "buttonLevelWin/42", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(42, forKey: "levelNumber")

                        let scene = Level42(fileNamed: "Level42")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level12.setScale(0.4)
                    level12.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 15)
                    level12.zPosition = 11
                    addChild(level12)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level12.position.x, y: level12.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel41 == false {
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
            if winLevel42 == true {
                if winLevel43 == false {
            let level13 = SKButton(imageName: "buttonLevel/43", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(43, forKey: "levelNumber")

                let scene = Level43(fileNamed: "Level43")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level13.setScale(0.4)
            level13.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 15)
            level13.zPosition = 11
            addChild(level13)
                } else if winLevel43 == true {
                    let level13 = SKButton(imageName: "buttonLevelWin/43", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(43, forKey: "levelNumber")

                        let scene = Level43(fileNamed: "Level43")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level13.setScale(0.4)
                    level13.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 15)
                    level13.zPosition = 11
                    addChild(level13)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level13.position.x, y: level13.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel42 == false {
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
            if winLevel43 == true {
                if winLevel44 == false {
            let level14 = SKButton(imageName: "buttonLevel/44", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(44, forKey: "levelNumber")

                let scene = Level44(fileNamed: "Level44")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level14.setScale(0.4)
            level14.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 15)
            level14.zPosition = 11
            addChild(level14)
                } else if winLevel44 == true {
                    let level14 = SKButton(imageName: "buttonLevelWin/44", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(44, forKey: "levelNumber")

                        let scene = Level44(fileNamed: "Level44")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level14.setScale(0.4)
                    level14.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 15)
                    level14.zPosition = 11
                    addChild(level14)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level14.position.x, y: level14.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel43 == false {
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
            if winLevel44 == true {
                if winLevel45 == false {
            let level15 = SKButton(imageName: "buttonLevel/45", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel45") {
                    
                    let scene = LevelDialogue45(fileNamed: "LevelDialogue45")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(45, forKey: "levelNumber")

                    let scene = Level45(fileNamed: "Level45")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel45")
                
            })
            level15.setScale(0.4)
            level15.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 15)
            level15.zPosition = 11
            addChild(level15)
                } else if winLevel45 == true {
                    let level15 = SKButton(imageName: "buttonLevelWin/45", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(45, forKey: "levelNumber")

                        let scene = Level45(fileNamed: "Level45")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level15.setScale(0.4)
                    level15.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 15)
                    level15.zPosition = 11
                    addChild(level15)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level15.position.x, y: level15.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel44 == false {
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
            if winLevel45 == true {
                if winLevel46 == false {
            let level16 = SKButton(imageName: "buttonLevel/46", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(46, forKey: "levelNumber")

                let scene = Level46(fileNamed: "Level46")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level16.setScale(0.4)
            level16.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 15)
            level16.zPosition = 11
            addChild(level16)
                } else if winLevel46 {
                    let level16 = SKButton(imageName: "buttonLevelWin/46", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(46, forKey: "levelNumber")

                        let scene = Level46(fileNamed: "Level46")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level16.setScale(0.4)
                    level16.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 15)
                    level16.zPosition = 11
                    addChild(level16)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level16.position.x, y: level16.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel45 == false {
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
            if winLevel46 == true {
                if winLevel47 == false {
            let level17 = SKButton(imageName: "buttonLevel/47", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(47, forKey: "levelNumber")

                let scene = Level47(fileNamed: "Level47")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level17.setScale(0.4)
            level17.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 15)
            level17.zPosition = 11
            addChild(level17)
                } else if winLevel47 == true {
                    let level17 = SKButton(imageName: "buttonLevelWin/47", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(47, forKey: "levelNumber")

                        let scene = Level47(fileNamed: "Level47")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level17.setScale(0.4)
                    level17.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 15)
                    level17.zPosition = 11
                    addChild(level17)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level17.position.x, y: level17.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel46 == false {
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
            if winLevel47 == true {
                if winLevel48 == false {
            let level18 = SKButton(imageName: "buttonLevel/48", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel48") {
                    
                    let scene = LevelDialogue48(fileNamed: "LevelDialogue48")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(48, forKey: "levelNumber")

                    let scene = Level48(fileNamed: "Level48")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel48")
                
            })
            level18.setScale(0.4)
            level18.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 15)
            level18.zPosition = 11
            addChild(level18)
                } else if winLevel48 == true {
                    let level18 = SKButton(imageName: "buttonLevelWin/48", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(48, forKey: "levelNumber")

                        let scene = Level48(fileNamed: "Level48")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level18.setScale(0.4)
                    level18.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 15)
                    level18.zPosition = 11
                    addChild(level18)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level18.position.x, y: level18.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel47 == false {
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
            if winLevel48 == true {
                if winLevel49 == false {
            let level19 = SKButton(imageName: "buttonLevel/49", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(49, forKey: "levelNumber")

                let scene = Level49(fileNamed: "Level49")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level19.setScale(0.4)
            level19.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 15)
            level19.zPosition = 11
            addChild(level19)
                } else if winLevel49 == true {
                    let level19 = SKButton(imageName: "buttonLevelWin/49", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(49, forKey: "levelNumber")

                        let scene = Level49(fileNamed: "Level49")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level19.setScale(0.4)
                    level19.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 15)
                    level19.zPosition = 11
                    addChild(level19)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level19.position.x, y: level19.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel48 == false {
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
            if winLevel49 == true {
                if winLevel50 == false {
            let level20 = SKButton(imageName: "buttonLevel/50", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel50") {
                    
                    let scene = LevelDialogue50(fileNamed: "LevelDialogue50")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   } else {
                    
                    UserDefaults.standard.set(50, forKey: "levelNumber")

                    let scene = Level50(fileNamed: "Level50")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
                    
                   }
                UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel50")
                
            })
            level20.setScale(0.4)
            level20.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 15)
            level20.zPosition = 11
            addChild(level20)
                } else if winLevel50 == true {
                        let level20 = SKButton(imageName: "buttonLevelWin/50", buttonAction: {
                            
                            if self.sound == true {
                                self.run(Sound.pop.action)
                            }
                            
                            UserDefaults.standard.set(50, forKey: "levelNumber")

                            let scene = Level50(fileNamed: "Level50")
                            let transation = SKTransition.fade(withDuration: 2.0)

                            scene!.scaleMode = .aspectFill
                            self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                        })
                        level20.setScale(0.4)
                        level20.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 15)
                        level20.zPosition = 11
                        addChild(level20)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level20.position.x, y: level20.position.y - 5)
                    addChild(cloud)
                    }
            } else if winLevel49 == false {
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
            if winLevel50 == true {
                if winLevel51 == false {
                let level21 = SKButton(imageName: "buttonLevel/51", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(51, forKey: "levelNumber")

                let scene = Level51(fileNamed: "Level51")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level21.setScale(0.4)
            level21.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 130)
            level21.zPosition = 11
            addChild(level21)
                } else if winLevel51 == true {
                        let level21 = SKButton(imageName: "buttonLevelWin/51", buttonAction: {
                            
                            if self.sound == true {
                                self.run(Sound.pop.action)
                            }
                            
                        UserDefaults.standard.set(51, forKey: "levelNumber")

                        let scene = Level51(fileNamed: "Level51")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                            self.centreView.removeFromSuperview()
                    })
                    level21.setScale(0.4)
                    level21.position = CGPoint(x: self.frame.midX - 315, y: self.frame.midY - 130)
                    level21.zPosition = 11
                    addChild(level21)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level21.position.x, y: level21.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel50 == false {
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
            if winLevel51 == true {
                if winLevel52 == false {
                let level22 = SKButton(imageName: "buttonLevel/52", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel52") {
                        
                        let scene = LevelDialogue52(fileNamed: "LevelDialogue52")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(52, forKey: "levelNumber")

                        let scene = Level52(fileNamed: "Level52")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel52")
                
            })
            level22.setScale(0.4)
            level22.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 130)
            level22.zPosition = 11
            addChild(level22)
                } else if winLevel52 == true {
                    let level22 = SKButton(imageName: "buttonLevelWin/52", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(52, forKey: "levelNumber")

                    let scene = Level52(fileNamed: "Level52")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level22.setScale(0.4)
                level22.position = CGPoint(x: self.frame.midX - 245, y: self.frame.midY - 130)
                level22.zPosition = 11
                addChild(level22)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level22.position.x, y: level22.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel51 == false {
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
            if winLevel52 == true {
                if winLevel53 == false {
                let level23 = SKButton(imageName: "buttonLevel/53", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(53, forKey: "levelNumber")

                let scene = Level53(fileNamed: "Level53")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level23.setScale(0.4)
            level23.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 130)
            level23.zPosition = 11
            addChild(level23)
                } else if winLevel53 == true {
                    let level23 = SKButton(imageName: "buttonLevelWin/53", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(53, forKey: "levelNumber")

                    let scene = Level53(fileNamed: "Level53")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level23.setScale(0.4)
                level23.position = CGPoint(x: self.frame.midX - 175, y: self.frame.midY - 130)
                level23.zPosition = 11
                addChild(level23)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level23.position.x, y: level23.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel52 == false {
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
            if winLevel53 == true {
                if winLevel54 == false {
                let level24 = SKButton(imageName: "buttonLevel/54", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(54, forKey: "levelNumber")

                let scene = Level54(fileNamed: "Level54")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level24.setScale(0.4)
            level24.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 130)
            level24.zPosition = 11
            addChild(level24)
                } else if winLevel54 == true {
                    let level24 = SKButton(imageName: "buttonLevelWin/54", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(54, forKey: "levelNumber")

                    let scene = Level54(fileNamed: "Level54")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level24.setScale(0.4)
                level24.position = CGPoint(x: self.frame.midX - 105, y: self.frame.midY - 130)
                level24.zPosition = 11
                addChild(level24)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level24.position.x, y: level24.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel53 == false {
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
            if winLevel54 == true {
                if winLevel55 == false {
                let level25 = SKButton(imageName: "buttonLevel/55", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                    if !UserDefaults.standard.bool(forKey: "isFirstLaunchLevel55") {
                        
                        let scene = LevelDialogue55(fileNamed: "LevelDialogue55")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       } else {
                        
                        UserDefaults.standard.set(55, forKey: "levelNumber")

                        let scene = Level55(fileNamed: "Level55")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       }
                    UserDefaults.standard.set(true, forKey: "isFirstLaunchLevel55")
                
            })
            level25.setScale(0.4)
            level25.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 130)
            level25.zPosition = 11
            addChild(level25)
                } else if winLevel55 == true {
                    let level25 = SKButton(imageName: "buttonLevelWin/55", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(55, forKey: "levelNumber")

                    let scene = Level55(fileNamed: "Level55")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level25.setScale(0.4)
                level25.position = CGPoint(x: self.frame.midX - 35, y: self.frame.midY - 130)
                level25.zPosition = 11
                addChild(level25)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level25.position.x, y: level25.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel54 == false {
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
            if winLevel55 == true {
                if winLevel56 == false {
                let level26 = SKButton(imageName: "buttonLevel/56", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(56, forKey: "levelNumber")

                let scene = Level56(fileNamed: "Level56")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level26.setScale(0.4)
            level26.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 130)
            level26.zPosition = 11
            addChild(level26)
                } else if winLevel56 == true {
                    let level26 = SKButton(imageName: "buttonLevelWin/56", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(56, forKey: "levelNumber")

                    let scene = Level56(fileNamed: "Level56")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level26.setScale(0.4)
                level26.position = CGPoint(x: self.frame.midX + 35, y: self.frame.midY - 130)
                level26.zPosition = 11
                addChild(level26)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level26.position.x, y: level26.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel55 == false {
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
            if winLevel56 == true {
                if winLevel57 == false {
                let level27 = SKButton(imageName: "buttonLevel/57", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(57, forKey: "levelNumber")

                let scene = Level57(fileNamed: "Level57")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level27.setScale(0.4)
            level27.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 130)
            level27.zPosition = 11
            addChild(level27)
                } else if winLevel57 == true {
                    let level27 = SKButton(imageName: "buttonLevelWin/57", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(57, forKey: "levelNumber")

                    let scene = Level57(fileNamed: "Level57")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level27.setScale(0.4)
                level27.position = CGPoint(x: self.frame.midX + 105, y: self.frame.midY - 130)
                level27.zPosition = 11
                addChild(level27)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level27.position.x, y: level27.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel56 == false {
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
            if winLevel57 == true {
                if winLevel58 == false {
            let level28 = SKButton(imageName: "buttonLevel/58", buttonAction: {
                
                if self.sound == true {
                    self.run(Sound.pop.action)
                }
                
                UserDefaults.standard.set(58, forKey: "levelNumber")

                let scene = Level58(fileNamed: "Level58")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                self.centreView.removeFromSuperview()
            })
            level28.setScale(0.4)
            level28.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 130)
            level28.zPosition = 11
            addChild(level28)
                } else if winLevel58 == true {
                    let level28 = SKButton(imageName: "buttonLevelWin/58", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                        UserDefaults.standard.set(58, forKey: "levelNumber")

                        let scene = Level58(fileNamed: "Level58")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                    })
                    level28.setScale(0.4)
                    level28.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY - 130)
                    level28.zPosition = 11
                    addChild(level28)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level28.position.x, y: level28.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel57 == false {
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
            if winLevel58 == true {
                if winLevel59 == false {
                let level29 = SKButton(imageName: "buttonLevel/59", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                        UserDefaults.standard.set(59, forKey: "levelNumber")
                    
                        let scene = Level59(fileNamed: "Level59")
                        let transation = SKTransition.fade(withDuration: 2.0)

                        scene!.scaleMode = .aspectFill
                        self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                        
                       
                
            })
            level29.setScale(0.4)
            level29.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 130)
            level29.zPosition = 11
            addChild(level29)
                } else if winLevel59 == true {
                    let level29 = SKButton(imageName: "buttonLevelWin/59", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(59, forKey: "levelNumber")

                    let scene = Level59(fileNamed: "Level59")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level29.setScale(0.4)
                level29.position = CGPoint(x: self.frame.midX + 245, y: self.frame.midY - 130)
                level29.zPosition = 11
                addChild(level29)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level29.position.x, y: level29.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel58 == false {
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
            if winLevel59 == true {
                if winLevel60 == false {
                let level30 = SKButton(imageName: "buttonLevel/60", buttonAction: {
                    
                    if self.sound == true {
                        self.run(Sound.pop.action)
                    }
                    
                UserDefaults.standard.set(60, forKey: "levelNumber")

                let scene = Level60(fileNamed: "Level60")
                let transation = SKTransition.fade(withDuration: 2.0)

                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transation)
                    self.centreView.removeFromSuperview()
            })
            level30.setScale(0.4)
            level30.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 130)
            level30.zPosition = 11
            addChild(level30)
                } else if winLevel60 == true {
                    let level30 = SKButton(imageName: "buttonLevelWin/60", buttonAction: {
                        
                        if self.sound == true {
                            self.run(Sound.pop.action)
                        }
                        
                    UserDefaults.standard.set(60, forKey: "levelNumber")

                    let scene = Level60(fileNamed: "Level60")
                    let transation = SKTransition.fade(withDuration: 2.0)

                    scene!.scaleMode = .aspectFill
                    self.view?.presentScene(scene!, transition: transation)
                        self.centreView.removeFromSuperview()
                })
                level30.setScale(0.4)
                level30.position = CGPoint(x: self.frame.midX + 315, y: self.frame.midY - 130)
                level30.zPosition = 11
                addChild(level30)

                    let cloud = SKEmitterNode(fileNamed: "LevelBlue.sks")!
                    cloud.zPosition = 1
                    cloud.position = CGPoint(x: level30.position.x, y: level30.position.y - 5)
                    addChild(cloud)
                }
            } else if winLevel59 == false {
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
