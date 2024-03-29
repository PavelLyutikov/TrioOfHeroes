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
class LevelDialogue27: SKScene {

    var close: SKButton!
    let dial = SKSpriteNode(imageNamed: "dialogue27")
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
            
            UserDefaults.standard.set(27, forKey: "levelNumber")
            
            let scene = Level27(fileNamed: "Level27")
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
        var positionX: CGFloat!
        var fontSize: CGFloat!
        switch Locale.current.languageCode {
        case "ru":
            positionY = -10
            positionX = -40
            fontSize = 22
        case "zh":
            positionY = -20
            positionX = -40
            fontSize = 22
        case "zh-Hans":
            positionY = -20
            positionX = -40
            fontSize = 22
        case "zh-Hant":
            positionY = -20
            positionX = -40
            fontSize = 22
        case "es":
            positionY = -15
            positionX = -55
            fontSize = 22
        case "ja":
            positionY = -15
            positionX = -40
            fontSize = 22
        case "de":
            positionY = -20
            positionX = -55
            fontSize = 20
        default:
            positionY = 10
            positionX = -40
            fontSize = 22
        }
        
        label.text = NSLocalizedString("Не думаю, что эти деревья сломал ветер, кажется мне, что это был великан, чьи следы мы нашли.", comment: "27")
        label.fontColor = .black
        label.fontSize = fontSize
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 250
        label.position = CGPoint(x: positionX, y: positionY)
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
