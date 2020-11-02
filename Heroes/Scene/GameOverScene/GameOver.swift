//
//  GameOver.swift
//  Elon's Adventure
//
//  Created by Mirko Justiniano on 9/24/19.
//  Copyright © 2019 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

class GameOver: GameScene {
    
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    
    override func sceneDidLoad() {
        backgroundColor = .black
        
        spawnLabel()
        moveScene()
    }
    
    func spawnLabel() {

        label.text = NSLocalizedString("Game Over", comment: "gameOver")
        label.fontColor = .white
        label.fontSize = 50
        label.position = CGPoint(x: 0, y: 0)
        label.zPosition = 1
        addChild(label)
    }
    
    func moveScene() {
        if winLevel30 == false {
            
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                
                if self.backgroundMusic == true {
                    backgroungGameArcherMusicPlayer.stop()
                }
                
                UserDefaults.standard.setValue(0, forKey: "levelNumber")
                
                UserDefaults.standard.set(false, forKey: "menuMusicOn")
                
            let scene = MenuLevel1_30(fileNamed: "MenuLevel1_30")
            
            let transition = SKTransition.fade(withDuration: 2.0)
            scene!.scaleMode = .aspectFill
            
            self.view?.presentScene(scene!, transition: transition)
            self.removeAllActions()
            }
        } else if winLevel30 == true {
            
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                
                if self.backgroundMusic == true {
                    backgroungGameArcherMusicPlayer.stop()
                }
                
                UserDefaults.standard.setValue(0, forKey: "levelNumber")
                
                UserDefaults.standard.set(false, forKey: "menuMusicOn")
                
            let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
            
            let transition = SKTransition.fade(withDuration: 2.0)
            scene!.scaleMode = .aspectFill
            
            self.view?.presentScene(scene!, transition: transition)
            self.removeAllActions()
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
        
//        if score >= 1 {
//            UserDefaults.standard.set(true, forKey: "winLevel32")
//
//            let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
//            let transition = SKTransition.fade(withDuration: 2)
//            scene?.scaleMode = .aspectFill
//            self.view?.presentScene(scene!, transition: transition)
//        }
    }
}
