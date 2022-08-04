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
class LevelDialogue40: SKScene {

    var close: SKButton!
    let dial = SKSpriteNode(imageNamed: "dialogue40")
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
            
            UserDefaults.standard.set(40, forKey: "levelNumber")
            
            let scene = Level40(fileNamed: "Level40")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(305), y: CGFloat(105))
        close.zPosition = 3003
        addChild(close)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: 80, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        var positionY: CGFloat!
        switch Locale.current.languageCode {
        case "ru":
            positionY = -60
        case "ja":
            positionY = -60
        default:
            positionY = -40
        }
        
        label.text = NSLocalizedString("Так мы ничего не узнаем, нужно изловить одного живым.", comment: "40")
        label.fontColor = .black
        label.fontSize = 30
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 400
        label.position = CGPoint(x: 80, y: positionY)
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
