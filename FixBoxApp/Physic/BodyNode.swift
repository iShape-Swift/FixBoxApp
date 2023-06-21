//
//  BodyNode.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import SpriteKit
import iFixBox
import Foundation


class BodyNode: SKNode {

    private let label = SKLabelNode()
    let main = SKNode()
    
    override init() {
        super.init()
        
        self.addChild(main)
        
        // Create the velocity label
        label.text = ""
        label.fontColor = .white
        label.fontSize = 12
        label.position = CGPoint(x: 0, y: 0)
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
    
    func update(body: Body, matrix: Matrix) {
        let pos = matrix.screen(worldPoint: body.transform.position.point)
        let angle = body.transform.angle.double
        position = pos
        main.zRotation = angle

        label.text = "\(body.id)"
        
//        label.text = String(format: "Vx: %.2f, Vy: %.2f, w: %.2f", body.velocity.linear.x.float, body.velocity.linear.y.float, body.velocity.angular.float)
    }

}
