//
//  LevelDialogue1.swift
//  Elon's Adventure
//
//  Created by mac on 20.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class LevelDialogue59: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue59")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    var close: SKButton!
    let background = SKSpriteNode(imageNamed: "caveBackgroundDialogue")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
            spawnDialogue()
            closeButton()
    }
    
//MARK: - CloseButton
        func closeButton() {
             close = SKButton(imageName: "closeButton", buttonAction: {
                
                UserDefaults.standard.set(0, forKey: "levelNumber")
                
                let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
                let transition = SKTransition.fade(withDuration: 2)
                scene?.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transition)
                
                
            })
            close.setScale(0.45)
            close.position = CGPoint(x: CGFloat(185), y: CGFloat(55))
            close.zPosition = 3003
            addChild(close)
        }
    //MARK: - Preview
        func spawnDialogue() {
            dial.setScale(0.5)
            dial.position = CGPoint(x: 0, y: -30)
            dial.zPosition = 3001
            addChild(dial)
            
            
            label.text = NSLocalizedString("Брат ты слишком слаб чтобы сражаться. Ты должен бежать к Ардану и расказать ему все, лишь он может помочь нам! Беги брат, я справлюсь!!", comment: "59")
            label.fontColor = .black
            label.fontSize = 24
            label.numberOfLines = 6
            label.preferredMaxLayoutWidth = 350
            label.position = CGPoint(x: -10, y: -100)
            label.zPosition = 3002
            addChild(label)
            
            background.setScale(1)
            background.position = CGPoint(x: self.frame.midX + 20, y: self.frame.midY)
            background.zPosition = 3000
            addChild(background)
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