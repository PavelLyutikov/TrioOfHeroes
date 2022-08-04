//
//  EnemyStateMachine.swift
//  Elon's Adventure
//
//  Created by mac on 28.08.2020.
//  Copyright © 2020 idevcode. All rights reserved.

import Foundation
import GameplayKit

fileprivate let characterAnimationKey = "Sprite Animation"

class EnemyState: GKState {
    unowned var enemyNode: SKNode
    
    init(enemyNode: SKNode) {
        self.enemyNode = enemyNode
        
        super.init()
    }
}
//MARK: - Skeleton
class KillState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is KillState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (1..<25).map({ return "skeletonKill/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeat(.animate(with: textures, timePerFrame: 0.05), count: 1) } ()
    
    lazy var zoomY = SKAction.scaleY(to: 0.0076, duration: 0)
    lazy var moveX = SKAction.moveTo(y: enemyNode.position.y + 8, duration: 0)
    lazy var groupAnimation = SKAction.group([zoomY, moveX, action])
    lazy var fadeAlp = SKAction.fadeAlpha(to: 0, duration: 1)
    lazy var soulMoveX = SKAction.moveTo(y: enemyNode.position.y + 100, duration: 1)
    lazy var group = SKAction.group([soulMoveX, fadeAlp])
    
    lazy var remove = SKAction.removeFromParent()
    lazy var sequence = SKAction.sequence([groupAnimation, group, remove])
    
    override func didEnter(from previousState: GKState?) {
        enemyNode.removeAction(forKey: characterAnimationKey)
        enemyNode.run(sequence, withKey: characterAnimationKey)
    }
}

class LandingEnemyState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type/*, is JumpingState.Type*/: return false
        default: return true
        }
    }

    override func didEnter(from previousState: GKState?) {
        stateMachine?.enter(IdleState.self)
    }
}

class IdleEnemyState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is IdleState.Type: return false
        default: return true
        }
    }

    let textures = SKTexture(imageNamed: "skeleton/0")
    lazy var action = { SKAction.animate(with: [textures], timePerFrame: 0.1) } ()

    override func didEnter(from previousState: GKState?) {
        enemyNode.removeAction(forKey: characterAnimationKey)
        enemyNode.run(action, withKey: characterAnimationKey)
    }
}

class WalkingEnemyState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is WalkingState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (0..<9).map({ return "skeleton/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.14)) } ()
    
    let walkAction = SKAction.applyImpulse(CGVector(dx: 9, dy: 0), duration: 0.5)
    lazy var repeatWalk = { SKAction.repeat(walkAction, count: 20) } ()
    
    let scaleX = SKAction.scaleX(to: -0.01, duration: 0.001)
    let scaleXPlus = SKAction.scaleX(to: 0.01, duration: 0.001)
    let walkActionBack = SKAction.applyImpulse(CGVector(dx: -9, dy: 0), duration: 0.5)
    lazy var repeatWalkBack = { SKAction.repeat(walkActionBack, count: 20) } ()
    
    lazy var groupAction = { SKAction.sequence([repeatWalk, scaleX, repeatWalkBack, scaleXPlus]) } ()
    lazy var fullRepeat = { SKAction.repeatForever(groupAction) } ()
    
    override func didEnter(from previousState: GKState?) {
        enemyNode.removeAction(forKey: characterAnimationKey)
        enemyNode.run(action, withKey: characterAnimationKey)
        enemyNode.run(fullRepeat)
    }
}


//MARK: - Goblin
class AttackGoblinState: EnemyState {
    
    var shotInterval: Int = 0
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is WalkingState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (6..<34).map({ return "goblin/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.1)) } ()
    
    override func didEnter(from previousState: GKState?) {
            enemyNode.removeAction(forKey: characterAnimationKey)
            enemyNode.run(action, withKey: characterAnimationKey)
 
    }
}
class KillGoblinState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is KillGoblinState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (1..<21).map({ return "goblinKillAnimation/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeat(.animate(with: textures, timePerFrame: 0.05), count: 1) } ()
    
    lazy var zoomY = SKAction.scaleY(to: 0.43, duration: 0)
    lazy var zoomX = SKAction.scaleX(to: -0.45, duration: 0)
    lazy var moveX = SKAction.moveTo(x: enemyNode.position.x + 7, duration: 0)
    lazy var moveY = SKAction.moveTo(y: enemyNode.position.y - 3, duration: 0)
    lazy var groupAnimation = SKAction.group([zoomY, zoomX, moveX, moveY, action])
    
    lazy var remove = SKAction.removeFromParent()
    lazy var sequence = SKAction.sequence([groupAnimation, remove])
    
    override func didEnter(from previousState: GKState?) {
        enemyNode.removeAction(forKey: characterAnimationKey)
        enemyNode.run(sequence, withKey: characterAnimationKey)
        
    }
    
}
//MARK: - Wizard
class KillBadWizardState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is KillBadWizardState.Type: return false
        default: return true
        }
    }
    lazy var remove = SKAction.removeFromParent()
    
    override func didEnter(from previousState: GKState?) {
        enemyNode.removeAction(forKey: characterAnimationKey)
        enemyNode.run(remove, withKey: characterAnimationKey)
        
        }
    }
    
class WalkingBadWizardState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is LandingState.Type, is WalkingState.Type: return false
        default: return true
        }
    }
    
    let textures: Array<SKTexture> = (1..<29).map({ return "badWizardAnimation/\($0)" }).map(SKTexture.init)
    lazy var action = { SKAction.repeatForever(.animate(with: textures, timePerFrame: 0.1)) } ()
    
    let walkAction = SKAction.applyImpulse(CGVector(dx: 4, dy: 2), duration: 1.0)
    let walkAction2 = SKAction.applyImpulse(CGVector(dx: 0, dy: -2), duration: 1.0)
    let walkAction3 = SKAction.applyImpulse(CGVector(dx: -4, dy: 2), duration: 1.0)
    let walkAction4 = SKAction.applyImpulse(CGVector(dx: 0, dy: -2), duration: 1.0)
    
    lazy var groupAction = { SKAction.sequence([walkAction, walkAction2, walkAction3, walkAction4]) } ()
    
    lazy var fullRepeat = { SKAction.repeatForever(groupAction) } ()
    
    override func didEnter(from previousState: GKState?) {
        enemyNode.removeAction(forKey: characterAnimationKey)
        enemyNode.run(action, withKey: characterAnimationKey)
        enemyNode.run(fullRepeat)
    }
}
