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
class LevelDialogue20: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue20")
    let dial2 = SKSpriteNode(imageNamed: "dialogue20_2")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    let label2 = SKLabelNode(fontNamed: "Antikvar Shadow")
    var close: SKButton!
    var close2: SKButton!
    let background = SKSpriteNode(imageNamed: "backgroundDialogue")
    
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
            self.closeButton2()
            self.spawnDialogue2()
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(145), y: CGFloat(105))
        close.zPosition = 3003
        addChild(close)
    }
    func closeButton2() {
         close2 = SKButton(imageName: "closeButton", buttonAction: {
            
            UserDefaults.standard.set(20, forKey: "levelNumber")
            
            let scene = Level20(fileNamed: "Level20")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        })
        close2.setScale(0.5)
        close2.position = CGPoint(x: CGFloat(145), y: CGFloat(85))
        close2.zPosition = 3003
        addChild(close2)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: -80, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        var positionY: CGFloat!
        switch Locale.current.languageCode {
        case "ja":
            positionY = -60
        case "de":
            positionY = -60
        default:
            positionY = -50
        }
        
        label.text = NSLocalizedString("Лучник оказался еще той занозой, я его недооценил. Он должен служить мне.", comment: "20")
        label.fontColor = .black
        label.fontSize = 28
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 400
        label.position = CGPoint(x: -80, y: positionY)
        label.zPosition = 3002
        addChild(label)
        
        
        background.setScale(1.0)
        background.position = CGPoint(x: self.frame.midX + 20, y: self.frame.midY)
        background.zPosition = 3000
        addChild(background)
    }
    func spawnDialogue2() {
        
        dial2.setScale(0.6)
        dial2.position = CGPoint(x: -80, y: 0)
        dial2.zPosition = 3001
        addChild(dial2)
        
        var positionY: CGFloat!
        switch Locale.current.languageCode {
        case "ja":
            positionY = -115
        default:
            positionY = -110
        }
        
        label2.text = NSLocalizedString("Посмотрим как ты справишься с ним!", comment: "20_2")
        label2.fontColor = .black
        label2.fontSize = 28
        label2.numberOfLines = 10
        label2.preferredMaxLayoutWidth = 250
        label2.position = CGPoint(x: 30, y: positionY)
        label2.zPosition = 3002
        addChild(label2)
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
