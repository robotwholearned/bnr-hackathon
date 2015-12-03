//
//  GameScene.swift
//  TheMostAwesome
//
//  Created by Sandquist, Cassandra - Cassandra on 12/3/15.
//  Copyright (c) 2015 Sandquist, Cassandra - Cassandra. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 45;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.81)
        self.physicsWorld.contactDelegate = self
        let borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        borderBody.friction = 0.0
        borderBody.categoryBitMask = 1
        borderBody.contactTestBitMask = 1
        self.physicsBody = borderBody
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
    
        print("contact detected")
        var firstBody:SKPhysicsBody
        var secondBody:SKPhysicsBody
        
        if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
        {
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
        }
        else
        {
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        removeChildrenInArray([firstBody.node!, secondBody.node!])
        
        print("yayayayayay")
        
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
                sprite.physicsBody?.categoryBitMask = 2
                sprite.physicsBody?.contactTestBitMask = 2
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
