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
class LevelDialogue38: SKScene {

    var close: SKButton!
    let dial = SKSpriteNode(imageNamed: "dialogue38")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    let background = SKSpriteNode(imageNamed: "caveBackgroundDialogue")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
            spawnDialogue()
            closeButton()
    }
//MARK: - CloseButton
    func closeButton() {
         close = SKButton(imageName: "closeButton", buttonAction: {
            
            UserDefaults.standard.set(38, forKey: "levelNumber")
            
            let scene = Level38(fileNamed: "Level38")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(245), y: CGFloat(105))
        close.zPosition = 3003
        addChild(close)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: 80, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        var sizeX: CGFloat!
        var positionX: CGFloat!
        switch Locale.current.languageCode {
        case "ru":
            sizeX = 350
            positionX = 0
        case "es":
            sizeX = 310
            positionX = 0
        default:
            sizeX = 320
            positionX = 0
        }
        
        label.text = NSLocalizedString("Это ведь сапог моего брата, значит мы на правильном пути!", comment: "38")
        label.fontColor = .black
        label.fontSize = 26
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = sizeX
        label.position = CGPoint(x: positionX, y: 10)
        label.zPosition = 3002
        addChild(label)
        
        
        background.setScale(1.0)
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
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
