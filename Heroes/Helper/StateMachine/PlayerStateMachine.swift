//
//  PlayerStateMachine.swift
//  Elon's Adventure
//
//  Created by Mirko Justiniano on 9/23/19.
//  Copyright © 2019 idevcode. All rights reserved.
//

import Foundation
import GameplayKit

fileprivate let characterAnimationKey = "Sprite Animation"

var hasAnimation: Bool = false

class PlayerState: GKState {
    unowned var playerNode: SKNode
    
    init(playerNode: SKNode) {
        self.playerNode = playerNode
        
        super.init()
    }
    
}

//MARK: - Landing
class LandingState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type/*, is JumpingState.Type, is ShotState.Type*/: return false
        default: return true
        }
    }
        
    override func didEnter(from previousState: GKState?) {
        stateMachine?.enter(IdleState.self)
    }
}
//MARK: - StunnedState
class StunnedState: PlayerState {
    var isStunned = false
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        if isStunned { return false }
        switch stateClass {
        case is IdleState.Type: return true
        default: return false
        }
    }
    
    let action = SKAction.repeat(.sequence([
        .fadeAlpha(to: 0.5, duration: 0.01),
        .wait(forDuration: 0.25),
        .fadeAlpha(to: 1.0, duration: 0.01),
        .wait(forDuration: 0.25),
    ]), count: 5)
    
    override func didEnter(from previousState: GKState?) {
        isStunned = true
        playerNode.run(action)
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            self.isStunned = false
            self.stateMachine?.enter(IdleState.self)
        }
    }
}


//MARK: - Archer



//MARK: - Idle
class IdleState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is IdleState.Type: return false
        default: return true
        }
    }
    let textures = SKTexture(imageNamed: "\(String(archerSkin!))/archer/0")
    lazy var action = { SKAction.animate(with: [textures], timePerFrame: 0.1) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)

    }
}
//MARK: - Walking
class WalkingState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is WalkingState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (0..<14).map({ return "\(String(archerSkin!))/archer/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.1)) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        
    }
}
//MARK: - NoActive
class NoActiveState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is NoActiveState.Type: return false
        default: return true
        }
    }
    
    lazy var zoomY = SKAction.scaleY(to: 1.265, duration: 0)
    lazy var zoomX = SKAction.scaleX(to: 1.4, duration: 0)
    let textures: Array<SKTexture> = (1..<25).map({ return "noActive/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.1)) } ()
    lazy var group = SKAction.group([zoomY, zoomX, action])
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(group, withKey: characterAnimationKey)
        
    }
}
//MARK: - Attack
class ShotState: PlayerState {
    var hasFinishedShot: Bool = false
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        if stateClass is StunnedState.Type { return true }
        if (hasFinishedShot /*&& stateClass is LandingState.Type*/) || stateClass is ShotState.Type { return true }
        return false
    }

    let textures: Array<SKTexture> = (0..<5).map({ return "\(String(archerSkin!))/archerShot/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.animate(with: textures, timePerFrame: 0.1) } ()

    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        hasFinishedShot = false
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { (timer) in
            self.hasFinishedShot = true
        }
    }
}

//MARK: Woodman



//MARK: - Walking
class WalkingWoodmanState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is WalkingWoodmanState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (0..<9).map({ return "woodmanWalking/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.1)) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        
    }
}

//MARK: - Attack
class AttackWoodmanState: PlayerState {
    var hasFinishedShot: Bool = false
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        if stateClass is StunnedState.Type { return true }
        if (hasFinishedShot /*&& stateClass is LandingState.Type*/) || stateClass is AttackWoodmanState.Type { return true }
        return false
    }

    let textures: Array<SKTexture> = (0..<6).map({ return "woodmanAttack/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.animate(with: textures, timePerFrame: 0.02) } ()

    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        hasFinishedShot = false
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
            self.hasFinishedShot = true
        }
    }
}
//MARK: - Idle
class IdleWoodmanState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is IdleWoodmanState.Type: return false
        default: return true
        }
    }
    
    let textures = SKTexture(imageNamed: "woodmanWalking/0")
    lazy var action = { SKAction.animate(with: [textures], timePerFrame: 0.1) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)

    }
}


//MARK: Wizard



//MARK: - Walking
class WalkingWizardState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is WalkingWizardState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (1..<12).map({ return "wizardWalking/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.1)) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        
    }
}

//MARK: - Attack
class AttackWizardState: PlayerState {
    var hasFinishedShot: Bool = false
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        if stateClass is StunnedState.Type { return true }
        if (hasFinishedShot /*&& stateClass is LandingState.Type*/) || stateClass is AttackWizardState.Type { return true }
        return false
    }

    let textures: Array<SKTexture> = (1..<3).map({ return "wizardAttack/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.animate(with: textures, timePerFrame: 0.1) } ()

    override func didEnter(from previousState: GKState?) {
//        playerNode.xScale = 0.34
//        playerNode.position = CGPoint(x: playerNode.position.x + 2, y: playerNode.position.y)
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        hasFinishedShot = false
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
            self.hasFinishedShot = true
//            self.playerNode.xScale = 0.294
        }
    }
}
//MARK: - Idle
class IdleWizardState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is IdleWizardState.Type: return false
        default: return true
        }
    }
    
    let textures = SKTexture(imageNamed: "kindWizard")
    lazy var action = { SKAction.animate(with: [textures], timePerFrame: 0.1) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)

    }
}
