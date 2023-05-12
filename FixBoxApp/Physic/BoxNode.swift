//
//  BoxNode.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import SpriteKit
import SwiftUI

final class BoxNode: BodyNode {
    
    init(size: CGSize, color: Color) {
        super.init()

        let stroke = NSColor(color)
        let fill = NSColor(color.opacity(0.2))
        
        // Create the rectangle shape node
        let rectangleShape = SKShapeNode(rectOf: size)
        rectangleShape.fillColor = fill
        rectangleShape.strokeColor = stroke
        rectangleShape.lineWidth = 2
        main.addChild(rectangleShape)
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
}
