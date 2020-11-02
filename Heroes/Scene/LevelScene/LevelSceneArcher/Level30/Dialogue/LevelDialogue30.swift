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

class LevelDialogue30: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue30")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    var close: SKButton!
    let dial2 = SKSpriteNode(imageNamed: "dialogue30_2")
    let label2 = SKLabelNode(fontNamed: "Antikvar Shadow")
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
            self.spawnDialogue2()
            self.closeButton2()
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(285), y: CGFloat(105))
        close.zPosition = 3003
        addChild(close)
    }
    func closeButton2() {
         close2 = SKButton(imageName: "closeButton", buttonAction: {
            
            UserDefaults.standard.set(30, forKey: "levelNumber")
            
            let scene = Level30(fileNamed: "Level30")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
            
        })
        close2.setScale(0.5)
        close2.position = CGPoint(x: CGFloat(285), y: CGFloat(105))
        close2.zPosition = 3003
        addChild(close2)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: 60, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        label.text = NSLocalizedString("ГРБУХГРБАМ!!!", comment: "30")
        label.fontColor = .black
        label.fontSize = 30
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 400
        label.position = CGPoint(x: 60, y: -10)
        label.zPosition = 3002
        addChild(label)
        
        
        background.setScale(1.0)
        background.position = CGPoint(x: self.frame.midX + 20, y: self.frame.midY)
        background.zPosition = 3000
        addChild(background)
    }
    func spawnDialogue2() {
        
        dial2.setScale(0.6)
        dial2.position = CGPoint(x: 60, y: 0)
        dial2.zPosition = 3001
        addChild(dial2)
        
        label2.text = NSLocalizedString("Вот мы и нашли его!", comment: "30_2")
        label2.fontColor = .black
        label2.fontSize = 30
        label2.numberOfLines = 10
        label2.preferredMaxLayoutWidth = 400
        label2.position = CGPoint(x: 60, y: -10)
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
