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
class LevelDialogue15: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue15")
    let dial2 = SKSpriteNode(imageNamed: "dialogue15_2")
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
            self.spawnDialogue2()
            self.closeButton2()
            self.close.removeFromParent()
            
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(175), y: CGFloat(55))
        close.zPosition = 3003
        addChild(close)
    }
    func closeButton2() {
         close2 = SKButton(imageName: "closeButton", buttonAction: {
            
            UserDefaults.standard.set(15, forKey: "levelNumber")
            
            let scene = Level15(fileNamed: "Level15")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        })
        close2.setScale(0.5)
        close2.position = CGPoint(x: CGFloat(175), y: CGFloat(55))
        close2.zPosition = 3003
        addChild(close2)
    }
//MARK: - Preview
    func spawnDialogue() {
        dial.setScale(0.5)
        dial.position = CGPoint(x: -10, y: -30)
        dial.zPosition = 3001
        addChild(dial)
        
        var positionY: CGFloat!
        switch Locale.current.languageCode {
        case "ja":
            positionY = -70
        default:
            positionY = -90
        }
        
        label.text = NSLocalizedString("Кто ты такой, чтобы вставать на моем пути жалкий лучник?! Лучше уноси ноги - пока цел!", comment: "15")
        label.fontColor = .black
        label.fontSize = 26
        label.numberOfLines = 6
        label.preferredMaxLayoutWidth = 360
        label.position = CGPoint(x: -10, y: positionY)
        label.zPosition = 3002
        addChild(label)
        
        background.setScale(1)
        background.position = CGPoint(x: self.frame.midX + 20, y: self.frame.midY)
        background.zPosition = 3000
        addChild(background)
    }
    
    func spawnDialogue2() {
        dial2.setScale(0.5)
        dial2.position = CGPoint(x: -10, y: -30)
        dial2.zPosition = 3001
        addChild(dial2)
        
        label2.text = NSLocalizedString("Да этот колдун настроен серьезно, жаль его! В следующую нашу встречу ты так просто не отделаешься!!", comment: "15_2")
        label2.fontColor = .black
        label2.fontSize = 26
        label2.numberOfLines = 6
        label2.preferredMaxLayoutWidth = 380
        label2.position = CGPoint(x: -10, y: -90)
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
