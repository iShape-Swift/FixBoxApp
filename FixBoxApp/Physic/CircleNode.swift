//
//  CircleNode.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import SpriteKit
import SwiftUI

final class CircleNode: BodyNode {

    init(radius: CGFloat, color: Color) {
        super.init()

        let stroke = NSColor(color)
        let fill = NSColor(color.opacity(0.2))
        
        // Create the circle shape node
        let circleShape = SKShapeNode(circleOfRadius: radius)
        circleShape.fillColor = fill
        circleShape.strokeColor = stroke
        circleShape.lineWidth = 2
        main.addChild(circleShape)
        
        let lineShape = SKShapeNode()
        let linePath = CGMutablePath()
        linePath.move(to: .zero)
        linePath.addLine(to: CGPoint(x: radius, y: 0))
        lineShape.path = linePath
        lineShape.strokeColor = stroke
        circleShape.lineWidth = 2
        main.addChild(lineShape)
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
}
