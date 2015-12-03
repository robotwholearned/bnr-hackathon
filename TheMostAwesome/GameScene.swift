//
//  GameScene.swift
//  TheMostAwesome
//
//  Created by Sandquist, Cassandra - Cassandra on 12/3/15.
//  Copyright (c) 2015 Sandquist, Cassandra - Cassandra. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 45;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.81)
        
        let borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        borderBody.friction = 0.0
        self.physicsBody = borderBody
        
        
        /*let ballNode = SKSpriteNode.init(color: UIColor.blueColor(), size: CGSize(width: 10,height: 10))
        ballNode.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(ballNode)*/
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
            
            for touch in touches {
                let location = touch.locationInNode(self)
                
                let sprite = SKSpriteNode(imageNamed:"Golfball")
                
                sprite.xScale = 1
                sprite.yScale = 1
                sprite.name = "ball"
                sprite.position = location //CGPointMake(self.frame.size.width/3, self.frame.size.height/3)
                sprite.physicsBody = SKPhysicsBody(circleOfRadius: sprite.frame.size.width/2)
                sprite.physicsBody?.friction = 0
                sprite.physicsBody?.restitution = 1.0
                sprite.physicsBody?.linearDamping = 0
                sprite.physicsBody?.allowsRotation = true
                sprite.physicsBody?.applyImpulse(CGVector(dx: 10.0, dy: -10.0))
                
                self.addChild(sprite)
                
                addAnAction(sprite)
                addAction2(sprite)
        }
    }
    
    func addAnAction(sprite: SKSpriteNode){
        let action1 = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        sprite.runAction(SKAction.repeatActionForever(action1))
    }
    func addAction2(sprite:SKSpriteNode){
        let vector = CGVectorMake(25.0, 25.0)
        let action2 = SKAction.moveBy(vector, duration: 2.0)
        sprite.runAction(SKAction.repeatActionForever(action2))
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
