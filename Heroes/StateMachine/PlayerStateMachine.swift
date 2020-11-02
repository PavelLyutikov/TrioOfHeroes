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

//MARK: - Jump
class JumpingWoodmanState: PlayerState {
    var hasFinishedJumping: Bool = false
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        if stateClass is StunnedState.Type { return true }
        if (hasFinishedJumping && stateClass is LandingState.Type) || stateClass is JumpingWoodmanState.Type { return true }
        return false
    }
    
    let textures: Array<SKTexture> = (0..<3).map({ return "woodmanJump/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.animate(with: textures, timePerFrame: 0.1) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        hasFinishedJumping = false
        playerNode.run(.applyForce(CGVector(dx: 0, dy: 240), duration: 0.1))
        let jumpAction = SKAction.applyImpulse(CGVector(dx: 0, dy: 35), duration: 0.1)
        playerNode.run(jumpAction)
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            self.hasFinishedJumping = true
        }
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
//MARK: - Idle
class IdleState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is IdleState.Type: return false
        default: return true
        }
    }
    
    let textures = SKTexture(imageNamed: "player/0")
    lazy var action = { SKAction.animate(with: [textures], timePerFrame: 0.1) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)

    }
}
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
//MARK: - Walking
class WalkingState: PlayerState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is WalkingState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (0..<14).map({ return "player/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.1)) } ()
    
    override func didEnter(from previousState: GKState?) {
        playerNode.removeAction(forKey: characterAnimationKey)
        playerNode.run(action, withKey: characterAnimationKey)
        
    }
}
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
class ShotState: PlayerState {
    var hasFinishedShot: Bool = false
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        if stateClass is StunnedState.Type { return true }
        if (hasFinishedShot /*&& stateClass is LandingState.Type*/) || stateClass is ShotState.Type { return true }
        return false
    }

    let textures: Array<SKTexture> = (0..<5).map({ return "shot/\($0)" }).map(SKTexture.init)
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
