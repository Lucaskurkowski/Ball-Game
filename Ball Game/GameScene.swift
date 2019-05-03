

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var Cannon = SKSpriteNode(imageNamed: "Slingshot")
    
    override func didMove(to view: SKView) {
        
        
        
        
        
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
    
    override func  touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
       
        let toucheslocation = touch.location(in: self)


}


}
