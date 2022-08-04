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
class LevelDialogue35: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue35")
    let dial2 = SKSpriteNode(imageNamed: "dialogue35_2")
    let dial3 = SKSpriteNode(imageNamed: "dialogue35_3")
    let dial4 = SKSpriteNode(imageNamed: "dialogue35_4")
    let dial5 = SKSpriteNode(imageNamed: "dialogue35_5")
    
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
                
                UserDefaults.standard.set(35, forKey: "levelNumber")
                
                let scene = Level35(fileNamed: "Level35")
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
            
            var positionY: CGFloat!
            switch Locale.current.languageCode {
            case "es":
                positionY = -60
            default:
                positionY = -80
            }
            
            label.text = NSLocalizedString("Здравствуй дедушка. Что ты делаешь в такой глуши?", comment: "35")
            label.fontColor = .black
            label.fontSize = 26
            label.numberOfLines = 6
            label.preferredMaxLayoutWidth = 350
            label.position = CGPoint(x: 0, y: positionY)
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
            
            var sizeX: CGFloat!
            switch Locale.current.languageCode {
            case "ru":
                sizeX = 380
            default:
                sizeX = 350
            }
            
            label2.text = NSLocalizedString("Для кого-то глуш, а для кого-то дом. Моя хижина здесь недалеко. Зайдешь в гости?", comment: "35_2")
            label2.fontColor = .black
            label2.fontSize = 26
            label2.numberOfLines = 6
            label2.preferredMaxLayoutWidth = sizeX
            label2.position = CGPoint(x: 0, y: -90)
            label2.zPosition = 3002
            addChild(label2)
        }
        func spawnDialogue3() {
            
            dial3.setScale(0.5)
            dial3.position = CGPoint(x: 0, y: -30)
            dial3.zPosition = 3001
            addChild(dial3)
            
            var sizeX: CGFloat!
            var positionY: CGFloat!
            switch Locale.current.languageCode {
            case "ru":
                sizeX = 380
                positionY = -80
            case "es":
                sizeX = 350
                positionY = -80
            default:
                sizeX = 350
                positionY = -70
            }
            
            label3.text = NSLocalizedString("Спасибо, но мне нужно спешить! Моего брата похитили.", comment: "35_3")
            label3.fontColor = .black
            label3.fontSize = 26
            label3.numberOfLines = 6
            label3.preferredMaxLayoutWidth = sizeX
            label3.position = CGPoint(x: 0, y: positionY)
            label3.zPosition = 3002
            addChild(label3)
        }
        func spawnDialogue4() {
            
            dial4.setScale(0.5)
            dial4.position = CGPoint(x: 0, y: -30)
            dial4.zPosition = 3001
            addChild(dial4)
            
            var positionY: CGFloat!
            switch Locale.current.languageCode {
            case "es":
                positionY = -120
            default:
                positionY = -100
            }
            
            label4.text = NSLocalizedString("Я видел как какого-то парня зеленые твари тащили за реку, что за лесом. Они обитают в пещерах, туда и утащили.", comment: "35_4")
            label4.fontColor = .black
            label4.fontSize = 26
            label4.numberOfLines = 6
            label4.preferredMaxLayoutWidth = 380
            label4.position = CGPoint(x: 0, y: positionY)
            label4.zPosition = 3002
            addChild(label4)
        }
        func spawnDialogue5() {
            
            dial5.setScale(0.5)
            dial5.position = CGPoint(x: 0, y: -30)
            dial5.zPosition = 3001
            addChild(dial5)
            
            label5.text = NSLocalizedString("Спасибо дедушка, поспешу в пещеры!!", comment: "35_5")
            label5.fontColor = .black
            label5.fontSize = 26
            label5.numberOfLines = 6
            label5.preferredMaxLayoutWidth = 350
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
