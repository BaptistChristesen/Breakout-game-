//
//  GameScene.swift
//  Breakout
//
//  Created by caden christesen on 3/8/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var ball = SKShapeNode()
    var paddle = SKSpriteNode()
    var brick = SKSpriteNode()
    override func didMove(to view: SKView) {
        createBackground()
    }
    func resetGame(){
        makeBall()
        makePaddle()
        makeBrick()
    }
    func createBackground(){
        let stars = SKTexture(imageNamed: "Stars")
        for i in 0...1{
            let starsBackground = SKSpriteNode(texture: stars)
            starsBackground.zPosition = -1
            starsBackground.position = CGPoint(x: 0, y: starsBackground.size.height * CGFloat(i))
            addChild(starsBackground)
            let moveDown = SKAction.moveBy(x: 0, y: -starsBackground.size.height, duration: 20)
            let moveReset = SKAction.moveBy(x: 0, y: starsBackground.size.height, duration: 0)
            let moveLoop = SKAction.sequence([moveDown, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            starsBackground.run(moveForever)
        }
    }
    func makeBall(){
        ball.removeFromParent()
        ball = SKShapeNode(circleOfRadius: 10)
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
        ball.strokeColor = .black
        ball.fillColor = .yellow
        ball.name = "ball"
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        
        ball.physicsBody?.isDynamic = false
        
        ball.physicsBody?.usesPreciseCollisionDetection = true
        
        ball.physicsBody?.friction = 0
        
        ball.physicsBody?.affectedByGravity = false
        
        ball.physicsBody?.restitution = 1
        
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
        
        addChild(ball)
    }
    func makePaddle(){
        paddle.removeFromParent()
        paddle = SKSpriteNode(color: .white, size: CGSize(width: frame.width/4, height: 20))
        paddle.position = CGPoint(x: frame.midX, y: frame.minY + 125)
        paddle.name = "paddle"
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.isDynamic = false
        addChild(paddle)
    }
    func makeBrick(){
        brick.removeFromParent()
        brick = SKSpriteNode(color: .blue, size: CGSize(width:50, height: 20))
        brick.position = CGPoint(x: frame.midX, y: frame.maxY - 50)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        addChild(brick)
    }
}
