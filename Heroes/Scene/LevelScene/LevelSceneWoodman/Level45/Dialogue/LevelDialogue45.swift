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

class LevelDialogue45: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue45")
    let dial2 = SKSpriteNode(imageNamed: "dialogue45_2")
    let dial3 = SKSpriteNode(imageNamed: "dialogue45_3")
    
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    let label2 = SKLabelNode(fontNamed: "Antikvar Shadow")
    let label3 = SKLabelNode(fontNamed: "Antikvar Shadow")
    
    var close: SKButton!
    var close2: SKButton!
    var close3: SKButton!
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
                self.spawnDialogue2()
                self.closeButton2()
                self.close.removeFromParent()
                
            })
            close.setScale(0.45)
            close.position = CGPoint(x: CGFloat(185), y: CGFloat(55))
            close.zPosition = 3003
            addChild(close)
        }
        func closeButton2() {
             close2 = SKButton(imageName: "closeButton", buttonAction: {
                self.dial2.removeFromParent()
                self.label2.removeFromParent()
                self.close2.removeFromParent()
                self.spawnDialogue3()
                self.closeButton3()
            })
            close2.setScale(0.45)
            close2.position = CGPoint(x: CGFloat(185), y: CGFloat(55))
            close2.zPosition = 3003
            addChild(close2)
        }
        func closeButton3() {
             close3 = SKButton(imageName: "closeButton", buttonAction: {
                
                UserDefaults.standard.set(45, forKey: "levelNumber")
                
                let scene = Level45(fileNamed: "Level45")
                let transition = SKTransition.fade(withDuration: 2)
                scene?.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transition)
                
            })
            close3.setScale(0.45)
            close3.position = CGPoint(x: CGFloat(185), y: CGFloat(55))
            close3.zPosition = 3003
            addChild(close3)
        }
    //MARK: - Preview
        func spawnDialogue() {
            dial.setScale(0.5)
            dial.position = CGPoint(x: 0, y: -30)
            dial.zPosition = 3001
            addChild(dial)
            
            
            label.text = NSLocalizedString("Где мой брат чудовище?!", comment: "45")
            label.fontColor = .black
            label.fontSize = 26
            label.numberOfLines = 6
            label.preferredMaxLayoutWidth = 400
            label.position = CGPoint(x: 0, y: -40)
            label.zPosition = 3002
            addChild(label)
            
            background.setScale(1)
            background.position = CGPoint(x: self.frame.midX + 20, y: self.frame.midY)
            background.zPosition = 3000
            addChild(background)
        }
        
        func spawnDialogue2() {
            
            dial2.setScale(0.5)
            dial2.position = CGPoint(x: 0, y: -30)
            dial2.zPosition = 3001
            addChild(dial2)
            
            
            label2.text = NSLocalizedString("РрррРРрРр", comment: "45_2")
            label2.fontColor = .black
            label2.fontSize = 26
            label2.numberOfLines = 6
            label2.preferredMaxLayoutWidth = 380
            label2.position = CGPoint(x: 0, y: -40)
            label2.zPosition = 3002
            addChild(label2)
        }
        func spawnDialogue3() {
            
            dial3.setScale(0.5)
            dial3.position = CGPoint(x: 0, y: -30)
            dial3.zPosition = 3001
            addChild(dial3)
            
            label3.text = NSLocalizedString("Глупое создание. В виде облака вы мне больше нравитесь!!", comment: "45_3")
            label3.fontColor = .black
            label3.fontSize = 26
            label3.numberOfLines = 6
            label3.preferredMaxLayoutWidth = 350
            label3.position = CGPoint(x: 0, y: -80)
            label3.zPosition = 3002
            addChild(label3)
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
