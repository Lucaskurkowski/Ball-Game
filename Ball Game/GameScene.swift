

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate{

var Cannon = SKSpriteNode(imageNamed: "Cannon")
var ball = SKSpriteNode(imageNamed: "Ball")
var marble = SKSpriteNode(imageNamed: "Marble")
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector.zero
        physicsWorld.contactDelegate = self
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration: 0.5)
                ])
        ))
        
    
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
    addMonster()
    CreateCannon()
    }
    
  
    //Cannon Code

    
    func CreateCannon() {
        Cannon.position = CGPoint(x: 0, y: -565)
        Cannon.size.width = 150
        Cannon.size.height = 150
        
        
        addChild(Cannon)
    }

   
    
    struct PhysicsCategory {
        static let None     :UInt32 = 1
        static let All      :UInt32 = UInt32.max
        static let Monster  :UInt32 = 2
        static let Projectile :UInt32 = 4
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func Random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addMonster() {
   
        // Create sprite
let Balls = SKSpriteNode(imageNamed: "Ball")
        
        Balls.size.width = 150
        Balls.size.height = 150
        
        
        
        
        // Determine where to spawn the monster along the Y axis
        let actualX = Random(min: Balls.size.width/6 * -100, max: size.width - Balls.size.width/12)
        
        // Position the monster slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
       Balls.position = CGPoint(x: actualX, y: size.width + Balls.size.width)
        
        // Add the monster to the scene
        addChild(Balls)
        
        // Determine speed of the monster
        let actualDuration = Random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: actualX, y: -Balls.size.width),
                                       duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        Balls.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func  touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let toucheslocation = touch.location(in: self)
        let marble = SKSpriteNode(imageNamed: "Marble")
        marble.position = Cannon.position
        let offset = toucheslocation - marble.position
        marble.physicsBody?.isDynamic = true
        marble.physicsBody?.categoryBitMask = PhysicsCategory.Monster
        marble.physicsBody?.contactTestBitMask = PhysicsCategory.Projectile
        marble.physicsBody?.collisionBitMask = PhysicsCategory.None
        marble.physicsBody?.usesPreciseCollisionDetection = true
        marble.physicsBody = SKPhysicsBody(rectangleOf: marble.size)
        addChild(marble)
        let direct = offset.normalized()
        let shootAmount = direct * 1000
        let realDest = shootAmount + marble.position
        let actionMove = SKAction.move(to: realDest, duration: TimeInterval(2.0))
        let actionmovedone = SKAction.removeFromParent()
        marble.run(SKAction.sequence([actionMove,actionmovedone]))
        
}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.location(in: self)
            Cannon.run(SKAction.moveTo(x: location.x, duration: 0.3))
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.location(in: self)
            Cannon.run(SKAction.moveTo(x: location.x, duration: 0.3))
        }
    
    
  
    
    
   
        
    }






}
