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

class LevelDialogue31: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue31")
    let dial2 = SKSpriteNode(imageNamed: "dialogue31_2")
    let dial3 = SKSpriteNode(imageNamed: "dialogue31_3")
    let dial4 = SKSpriteNode(imageNamed: "dialogue31_4")
    let dial5 = SKSpriteNode(imageNamed: "dialogue31_5")
    
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    let label2 = SKLabelNode(fontNamed: "Antikvar Shadow")
    let label3 = SKLabelNode(fontNamed: "Antikvar Shadow")
    let label4 = SKLabelNode(fontNamed: "Antikvar Shadow")
    let label5 = SKLabelNode(fontNamed: "Antikvar Shadow")
    
    var close: SKButton!
    var close2: SKButton!
    var close3: SKButton!
    var close4: SKButton!
    var close5: SKButton!
    let background = SKSpriteNode(imageNamed: "backgroundDialogue")
    
    let labelMain = SKLabelNode(fontNamed: "Antikvar Shadow")
    let mainBackground = SKSpriteNode(imageNamed: "dialogueBackgroundBlack")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
            spawnDialogue()
            closeButton()
            mainPreview()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.spawnAction()
        }
    }
//MARK: - MainPreview
        func mainPreview() {
            mainBackground.zPosition = 3005
            mainBackground.setScale(8.0)
            mainBackground.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            addChild(mainBackground)
            
            
            labelMain.text = NSLocalizedString("В тоже время - в другой части леса...", comment: "31_0")
            labelMain.fontColor = .white
            labelMain.fontSize = 30
            labelMain.numberOfLines = 6
//            labelMain.preferredMaxLayoutWidth = 400
            labelMain.position = CGPoint(x: 0, y: 0)
            labelMain.zPosition = 3010
            addChild(labelMain)
        }
        func spawnAction() {
            let action = SKAction.fadeAlpha(to: 0, duration: 2)
            mainBackground.run(SKAction.sequence([action]))
            labelMain.run(SKAction.sequence([action]))
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
                self.dial3.removeFromParent()
                self.label3.removeFromParent()
                self.close3.removeFromParent()
                self.spawnDialogue4()
                self.closeButton4()
            })
            close3.setScale(0.45)
            close3.position = CGPoint(x: CGFloat(185), y: CGFloat(55))
            close3.zPosition = 3003
            addChild(close3)
        }
        func closeButton4() {
             close4 = SKButton(imageName: "closeButton", buttonAction: {
                self.dial4.removeFromParent()
                self.label4.removeFromParent()
                self.close4.removeFromParent()
                self.spawnDialogue5()
                self.closeButton5()
            })
            close4.setScale(0.45)
            close4.position = CGPoint(x: CGFloat(185), y: CGFloat(55))
            close4.zPosition = 3003
            addChild(close4)
        }
        func closeButton5() {
             close5 = SKButton(imageName: "closeButton", buttonAction: {
                
                UserDefaults.standard.set(31, forKey: "levelNumber")
                
                let scene = Level31(fileNamed: "Level31")
                let transition = SKTransition.fade(withDuration: 2)
                scene?.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: transition)
                
            })
            close5.setScale(0.45)
            close5.position = CGPoint(x: CGFloat(185), y: CGFloat(55))
            close5.zPosition = 3003
            addChild(close5)
        }
    //MARK: - Preview
        func spawnDialogue() {
            dial.setScale(0.5)
            dial.position = CGPoint(x: 0, y: -30)
            dial.zPosition = 3001
            addChild(dial)
            
            
            label.text = NSLocalizedString("Пора заканчивать на сегодня, солнце уже содится.", comment: "31")
            label.fontColor = .black
            label.fontSize = 30
            label.numberOfLines = 6
            label.preferredMaxLayoutWidth = 400
            label.position = CGPoint(x: 0, y: -80)
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
            
            
            label2.text = NSLocalizedString("Брат, берегись!!!", comment: "31_2")
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
            
            
            label3.text = NSLocalizedString("Какого черта?!?", comment: "31_3")
            label3.fontColor = .black
            label3.fontSize = 26
            label3.numberOfLines = 6
            label3.preferredMaxLayoutWidth = 380
            label3.position = CGPoint(x: 0, y: -40)
            label3.zPosition = 3002
            addChild(label3)
        }
        func spawnDialogue4() {
            
            dial4.setScale(0.5)
            dial4.position = CGPoint(x: 0, y: -30)
            dial4.zPosition = 3001
            addChild(dial4)
            
            
            label4.text = NSLocalizedString("РррРредарРрр", comment: "31_4")
            label4.fontColor = .black
            label4.fontSize = 26
            label4.numberOfLines = 6
            label4.preferredMaxLayoutWidth = 380
            label4.position = CGPoint(x: 0, y: -40)
            label4.zPosition = 3002
            addChild(label4)
        }
        func spawnDialogue5() {
            
            dial5.setScale(0.5)
            dial5.position = CGPoint(x: 0, y: -30)
            dial5.zPosition = 3001
            addChild(dial5)
            
            
            label5.text = NSLocalizedString("Сегодня вы отведаете только мой топор!", comment: "31_5")
            label5.fontColor = .black
            label5.fontSize = 26
            label5.numberOfLines = 6
            label5.preferredMaxLayoutWidth = 380
            label5.position = CGPoint(x: 0, y: -60)
            label5.zPosition = 3002
            addChild(label5)
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
