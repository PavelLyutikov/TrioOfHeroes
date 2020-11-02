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

class LevelDialogue2: SKScene {

    let dial = SKSpriteNode(imageNamed: "dialogue2")
    let label = SKLabelNode(fontNamed: "Antikvar Shadow")
    var close: SKButton!
    let background = SKSpriteNode(imageNamed: "backgroundDialogue")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
            spawnDialogue()
            closeButton()
    }
//MARK: - CloseButton
    func closeButton() {
         close = SKButton(imageName: "closeButton", buttonAction: {
            
            UserDefaults.standard.set(2, forKey: "levelNumber")
            
            let scene = Level2(fileNamed: "Level2")
            let transition = SKTransition.fade(withDuration: 2)
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: transition)
        })
        close.setScale(0.5)
        close.position = CGPoint(x: CGFloat(285), y: CGFloat(105))
        close.zPosition = 3003
        addChild(close)
    }
//MARK: - Preview
    func spawnDialogue() {
        
        dial.setScale(0.6)
        dial.position = CGPoint(x: 60, y: 0)
        dial.zPosition = 3001
        addChild(dial)
        
        label.text = NSLocalizedString("Жители деревни действительно были правы. Но кто стоит за этим? Раньше я не наблюдал блуждающих скелетов самих по себе...", comment: "2")
        label.fontColor = .black
        label.fontSize = 28
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 450
        label.position = CGPoint(x: 60, y: -80)
        label.zPosition = 3002
        addChild(label)
        
        
        background.setScale(1.0)
        background.position = CGPoint(x: self.frame.midX + 20, y: self.frame.midY)
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
