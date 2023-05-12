//
//  ContactNode.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import SpriteKit
import SwiftUI
import iFixBox

final class ContactNode: SKNode {

    override init() {
        super.init()

        let color: NSColor = .white
        
        // Create the circle shape node
        let circleShape = SKShapeNode(circleOfRadius: 4)
        circleShape.fillColor = color
        addChild(circleShape)
        
        let lineShape = SKShapeNode()
        let linePath = CGMutablePath()
        linePath.move(to: .zero)
        linePath.addLine(to: CGPoint(x: 40, y: 0))
        lineShape.path = linePath
        lineShape.strokeColor = color
        lineShape.lineWidth = 2
        addChild(lineShape)
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
    
    func update(contact: Contact, matrix: Matrix) {
        let pos = matrix.screen(worldPoint: contact.point.point)
        let angle = atan2(contact.normal.point.y, contact.normal.point.x)
        self.position = pos
        self.zRotation =  angle
        self.isHidden = false
    }
}
