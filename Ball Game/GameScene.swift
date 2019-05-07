

import SpriteKit
import GameplayKit

class GameScene: SKScene {

var Cannon = SKSpriteNode(imageNamed: "Slingshot")
var ball = SKSpriteNode(imageNamed: "Ball")
var marble = SKSpriteNode(imageNamed: "Marble")
    override func didMove(to view: SKView) {
        
      
    
        var border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        
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
    func CreateBalls() {
      let Balls = SKSpriteNode(imageNamed: "Marble")
        
        
    }
    
    
    
    
    
    override func  touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
       
        let toucheslocation = touch.location(in: self)


}

    
    
    func RandomPoint() -> CGPoint {
        
   let xpos = Int.random(in: 0...Int(self.size.width))
   let ypos = Int.random(in: 0...Int(self.size.width))
        
        return CGPoint(x: xpos, y: ypos)
    }

    func RandomNumber() -> CGFloat {
        
        let Number = CGFloat.random(in: 0...300)
        
        return Number
    }











}
