//
//  GameScene.swift
//  NodeGame
//
//  Created by Michael Zetune on 11/12/17.
//  Copyright © 2017 Michael Zetune. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    //private var label : SKLabelNode?
    private var pointNode : SKShapeNode?
    private var score = 0
    private var numRed = 0
    private var maxRed = 30

    
    override func didMove(to view: SKView) {

        var time: TimeInterval = 5

        let spawn = SKAction.run { self.createNode() }
        
        let wait1 = SKAction.wait(forDuration: time, withRange: time/2)
        time /= 1.5
        let wait2 = SKAction.wait(forDuration: time, withRange: time/2)
        time /= 1.5
        let wait3 = SKAction.wait(forDuration: time, withRange: time/2)
        time /= 1.5
        let wait4 = SKAction.wait(forDuration: time, withRange: time/2)
        time /= 1.5
        let wait5 = SKAction.wait(forDuration: time, withRange: time/2)
        
        
        let sequence = SKAction.sequence([spawn, wait1, spawn, wait1, spawn, wait1, spawn, wait1, spawn, wait2, spawn, wait2, spawn, wait2, spawn, wait2, spawn, wait2, spawn, wait3, spawn, wait3, spawn, wait3, spawn, wait3, spawn, wait3, spawn, wait4, spawn, wait4, spawn, wait4, spawn, wait4, spawn, wait4, spawn, wait5,  spawn, wait5, spawn, wait5, spawn, wait5, spawn, wait5])

        self.run(sequence)

        time /= 1.5
        
        let wait = SKAction.wait(forDuration: time, withRange: time/2)
        
        let sequence2 = SKAction.sequence([spawn, wait])
        
        self.run(SKAction.repeatForever(sequence2))
        
    }

    
    func createNode() {
        
        var theNode = SKSpriteNode()
        
        if arc4random_uniform(2) == 1
        {
            if numRed > maxRed {
                self.children[1].removeFromParent()
                numRed -= 1
            }
            theNode = SKSpriteNode(imageNamed: "red-dot")
            theNode.name = "redNode"
            theNode.setScale(0.2)
            numRed += 1
            
        } else {
            theNode = SKSpriteNode(imageNamed: "green-dot")
            theNode.name = "greenNode"
            theNode.setScale(0.13)
        }
            
            theNode.alpha = 1.0
            let screenBounds = UIScreen.main.bounds
            
            let width = UInt32(screenBounds.width)
            let randomXPos = Int(arc4random_uniform(width))
            let halfWidth = Int(width) / 2
            let randomX = Double(randomXPos - halfWidth)
            
            let height = UInt32(screenBounds.height)
            let randomYPos = Int(arc4random_uniform(height))
            let halfHeight = Int(height) / 2
            let randomY = Double(randomYPos - halfHeight)
            
            theNode.position = CGPoint(x: randomX, y: randomY)
            
            self.addChild(theNode)
        
    }
    
    func updateScore() {
        if let label = self.childNode(withName: "ScoreLabel") as? SKLabelNode {
            label.text = "Score: \(score)"
        }
    }
    
    func restartGame() {
        score = 0
        numRed = 0
        if let label = self.childNode(withName: "ScoreLabel") as? SKLabelNode {
            label.text = "Game Over! Restarting..."
        }
        for child in self.children {
            if child.name != "ScoreLabel" {
                child.removeFromParent()
            }
        }
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.updateScore()
        }
        
    }

    
    func touchDown(atPoint pos : CGPoint) { // initial tap
    }
    
    func touchMoved(toPoint pos : CGPoint) { // finger moved somewhere else
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touched")
        
        for touch: AnyObject in touches {
            
            let touchLocation = touch.location(in: self)
            let touchedNode = self.atPoint(touchLocation)
            
            if (touchedNode.name == "redNode") {
                restartGame()
            }
            
            if (touchedNode.name == "greenNode") {
                touchedNode.removeFromParent()
                score += 1
                updateScore()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
