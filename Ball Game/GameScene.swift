

import SpriteKit
import GameplayKit

class GameScene: SKScene {

var Cannon = SKSpriteNode(imageNamed: "Slingshot")
var ball = SKSpriteNode(imageNamed: "Ball")
var marble = SKSpriteNode(imageNamed: "Marble")
    override func didMove(to view: SKView) {
        
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration: 0.5)
                ])
        ))
        
    
        var border = SKPhysicsBody(edgeLoopFrom: self.frame)
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

    func CannonMove()  {
        
        
    }
    
    func CannonShoot() {
        
    
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
    
    
    //hey chris
    
    
   
        
    }
    
    
    
    
    
    
    
    
    
    
   











}
