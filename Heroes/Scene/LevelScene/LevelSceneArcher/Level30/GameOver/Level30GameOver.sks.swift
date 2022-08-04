//
//  GameOverLevel30.swift
//  Elon's Adventure
//
//  Created by mac on 28.09.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit
import SpriteKit

@available(iOS 11.0, *)
class Level30GameOver: GameScene {

    let dial = SKSpriteNode(imageNamed: "dialogue30_3")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    var close: SKButton!

    let background = SKSpriteNode(imageNamed: "backgroundDialogue")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        if backgroundMusic == true {
            playBackgroundMenuMusic(fileName: "backMusicMenu.mp3")
            bossSound.stop()
        }
            
        spawnDialogue()
        closeButton()
    }
//MARK: - CloseButton
    func closeButton() {
         close = SKButton(imageName: "closeButton", buttonAction: {
            
            let scene = MenuLevel31_60(fileNamed: "MenuLevel31_60")
            
            if self.backgroundMusic == true {
                backgroungGameArcherMusicPlayer.stop()
            }
            
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(145), y: CGFloat(85))
        close.zPosition = 3003
        addChild(close)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: -80, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        var positionY: CGFloat!
        var positionX: CGFloat!
        var size: CGFloat!
        switch Locale.current.languageCode {
        case "ru":
            positionY = -110
            positionX = 20
            size = 28
        case "ja":
            positionY = -115
            positionX = 30
            size = 24
        case "de":
            positionY = -115
            positionX = 30
            size = 28
        default:
            positionY = -90
            positionX = 20
            size = 28
        }
        
        label.text = NSLocalizedString("Ты будешь моей марионеткой, лучник!!", comment: "30_gameOver")
        label.fontColor = .black
        label.fontSize = size
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
}
