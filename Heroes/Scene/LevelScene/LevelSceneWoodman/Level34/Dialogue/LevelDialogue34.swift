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
class LevelDialogue34: SKScene {

    var close: SKButton!
    let dial = SKSpriteNode(imageNamed: "dialogue34")
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
            
            UserDefaults.standard.set(34, forKey: "levelNumber")
            
            let scene = Level34(fileNamed: "Level34")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        })
        close.setScale(0.45)
        close.position = CGPoint(x: CGFloat(185), y: CGFloat(65))
        close.zPosition = 3003
        addChild(close)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.5)
        dial.position = CGPoint(x: 0, y: -20)
        dial.zPosition = 3001
        addChild(dial)
        
        var sizeX: CGFloat!
        var positionY: CGFloat!
        switch Locale.current.languageCode {
        case "ru":
            sizeX = 400
            positionY = -80
        case "es":
            sizeX = 350
            positionY = -80
        case "ja":
            sizeX = 350
            positionY = -90
        default:
            sizeX = 350
            positionY = -70
        }
        
        label.text = NSLocalizedString("Твой брат доставляет мне много хлопот, ты станешь приманкой чтобы заманить его в ловушку!", comment: "34")
        label.fontColor = .black
        label.fontSize = 26
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = sizeX
        label.position = CGPoint(x: 0, y: positionY)
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
