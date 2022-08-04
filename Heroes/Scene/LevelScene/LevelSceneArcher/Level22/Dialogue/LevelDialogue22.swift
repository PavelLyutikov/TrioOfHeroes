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

@available(iOS 11.0, *)
class LevelDialogue22: SKScene {

    var close: SKButton!
    let dial = SKSpriteNode(imageNamed: "dialogue22")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    let background = SKSpriteNode(imageNamed: "backgroundDialogue")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
            spawnDialogue()
            closeButton()
    }
//MARK: - CloseButton
    func closeButton() {
         close = SKButton(imageName: "closeButton", buttonAction: {
            
            UserDefaults.standard.set(22, forKey: "levelNumber")
            
            let scene = Level22(fileNamed: "Level22")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(225), y: CGFloat(105))
        close.zPosition = 3003
        addChild(close)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: 60, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        var positionY: CGFloat!
        switch Locale.current.languageCode {
        case "ru":
            positionY = 0
        case "ja":
            positionY = -10
        case "de":
            positionY = 0
        default:
            positionY = 20
        }
        
        label.text = NSLocalizedString("Ты видел этот размер ноги?! Да он словно амбар.", comment: "22")
        label.fontColor = .black
        label.fontSize = 28
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 300
        label.position = CGPoint(x: -20, y: positionY)
        label.zPosition = 3002
        addChild(label)
        
        
        background.setScale(1.0)
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
