//
//  Sound.swift
//  Elon's Adventure
//
//  Created by Mirko Justiniano on 9/24/19.
//  Copyright © 2019 idevcode. All rights reserved.
//

import Foundation
import SpriteKit

enum Sound: String {
    case jump, pop, close, arrow, arrowKill, killSkeleton, goblinKill, teleport, walk, male, maleWoodman, coins
    
    var action: SKAction {
        return SKAction.playSoundFileNamed(rawValue + "Sound.wav", waitForCompletion: false)
    }
}

extension SKAction {
    static let playGameMusic: SKAction = playSoundFileNamed("backMusic.mp3", waitForCompletion: false)
}
