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
class LevelDialogue52: SKScene {

    var close: SKButton!
    let dial = SKSpriteNode(imageNamed: "dialogue52")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    var close2: SKButton!
    let dial2 = SKSpriteNode(imageNamed: "dialogue52_2")
    let label2 = SKLabelNode(fontNamed: "Antikvar Shadow")
    let background = SKSpriteNode(imageNamed: "caveBackgroundDialogue")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
            spawnDialogue()
            closeButton()
    }
//MARK: - CloseButton
    func closeButton() {
         close = SKButton(imageName: "closeButton", buttonAction: {
            self.dial.removeFromParent()
            self.label.removeFromParent()
            self.close.removeFromParent()
            self.spawnDialogue2()
            self.closeButton2()
            
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(135), y: CGFloat(105))
        close.zPosition = 3003
        addChild(close)
    }
    func closeButton2() {
         close2 = SKButton(imageName: "cancelWhite", buttonAction: {
            
            UserDefaults.standard.set(52, forKey: "levelNumber")
            
            let scene = Level52(fileNamed: "Level52")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        })
        close2.setScale(0.5)
        close2.position = CGPoint(x: CGFloat(135), y: CGFloat(85))
        close2.zPosition = 3003
        addChild(close2)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: -90, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        var positionY: CGFloat!
        switch Locale.current.languageCode {
        case "ru":
            positionY = -60
        case "es":
            positionY = -60
        case "ja":
            positionY = -60
        default:
            positionY = -40
        }
        
        label.text = NSLocalizedString("Он прошел дальше, чем я предполагал, нам нужно подкрепление.", comment: "52")
        label.fontColor = .black
        label.fontSize = 30
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 400
        label.position = CGPoint(x: -90, y: positionY)
        label.zPosition = 3002
        addChild(label)
        
        
        background.setScale(1.0)
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        background.zPosition = 3000
        addChild(background)
    }
    func spawnDialogue2() {
        
        dial2.setScale(0.6)
        dial2.position = CGPoint(x: -90, y: 0)
        dial2.zPosition = 3001
        addChild(dial2)
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
