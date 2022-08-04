//
//  GameOver.swift
//  Elon's Adventure
//
//  Created by Mirko Justiniano on 9/24/19.
//  Copyright © 2019 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

@available(iOS 11.0, *)
class GameOver: GameScene {
    
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    
    override func sceneDidLoad() {
        
        backgroundColor = .black
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
            if self.sound == true {
                self.run(Sound.killSkeleton.action)
            }
            
        }
        
        spawnBackground()
        spawnLabel()
        moveScene()
    }
    
    func spawnBackground() {
        let background = SKSpriteNode(imageNamed: "gameOver/0")
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 50)
        background.setScale(0.8)
        background.zPosition = 3
        addChild(background)
        
        Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { _ in

        var textures: [SKTexture] = []
                for i in 0...26 {
                    textures.append(SKTexture(imageNamed: "gameOver/\(i)"))
                }

        let action = SKAction.animate(with: textures, timePerFrame: 0.06)
        background.run(SKAction.sequence([action]))
        }
    }
    
    func spawnLabel() {

        label.text = NSLocalizedString("Game Over", comment: "gameOver")
        label.fontColor = .white
        label.fontSize = 80
        label.position = CGPoint(x: 0, y: -150)
        label.zPosition = 5
        label.alpha = 0
        addChild(label)
        
        let aplhaAction = SKAction.fadeAlpha(to: 1, duration: 1.3)
        label.run(SKAction.sequence([aplhaAction]))
    }
    
    func moveScene() {
        
        if winLevel60 == true {
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                
                if self.backgroundMusic == true {
                    backgroungGameArcherMusicPlayer.stop()
                }
                
                UserDefaults.standard.setValue(0, forKey: "levelNumber")
                
                UserDefaults.standard.set(false, forKey: "menuMusicOn")
                
            let scene = MenuLevel61_90(fileNamed: "MenuLevel61_90")
            
            let transition = SKTransition.fade(withDuration: 1.0)
            scene!.scaleMode = .aspectFill
            
            self.view?.presentScene(scene!, transition: transition)
            self.removeAllActions()
            }
        } else {
        
                if winLevel30 == false {
                    
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        
                        if self.backgroundMusic == true {
                            backgroungGameArcherMusicPlayer.stop()
                        }
                        
                        UserDefaults.standard.setValue(0, forKey: "levelNumber")
                        
                        UserDefaults.standard.set(false, forKey: "menuMusicOn")
                        
                    let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
                    
                    let transition = SKTransition.fade(withDuration: 1.0)
                    scene!.scaleMode = .aspectFill
                    
                    self.view?.presentScene(scene!, transition: transition)
                    self.removeAllActions()
                    }
                } else if winLevel30 == true {
                    
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        
                        if self.backgroundMusic == true {
                            backgroungGameArcherMusicPlayer.stop()
                        }
                        
                        UserDefaults.standard.setValue(0, forKey: "levelNumber")
                        
                        UserDefaults.standard.set(false, forKey: "menuMusicOn")
                        
                    let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
                    
                    let transition = SKTransition.fade(withDuration: 1.0)
                    scene!.scaleMode = .aspectFill
                    
                    self.view?.presentScene(scene!, transition: transition)
                    self.removeAllActions()
                    }
                }
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
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
    }
}
