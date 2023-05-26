//
//  DominoScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 24.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat
import SpriteKit

final class DominoScene: ObservableObject {

    func makeView() -> DominoSceneView {
        DominoSceneView(scene: self)
    }
    
    func makeSpriteScene(screenSize: CGSize) -> SKScene {
        let scene = SpriteScene(size: screenSize, scale: 80, gravity: CGPoint(x: 0, y: -10).fixVec)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {

    override func didCreate() {
//        self.addBox(size: .init(width: 2, height: 2), position: .init(x: 0, y: 5), angle: 0.04)
//        self.addBox(size: .init(width: 16, height: 2), position: .init(x: 0, y: -5), isDynamic: false)
        
        let floorHeight: CGFloat = 1
        let count = 4
        let dominoHeight: CGFloat = 0.5
        
        let a = 5 * dominoHeight
        let b = 5 * dominoHeight
        let h = 0.5 * (a + b)
        
        var posY = -0.5 * (a * CGFloat(count) + floorHeight)
        self.addBox(size: .init(width: 16, height: 2), position: .init(x: 0, y: posY), isDynamic: false)
        
        posY += 0.5 * dominoHeight
        
        var n = count

        var posX = -0.5 * CGFloat(n) * a
        var y = posY + 0.5 * a
        for j in 0..<n {
            var x = posX
            for _ in 0..<n-j {
                if j > 0 {
                    self.addBox(size: .init(width: a, height: b), position: .init(x: x, y: y - h))
                }
                self.addBox(size: .init(width: b, height: a), position: .init(x: x, y: y))
                self.addBox(size: .init(width: a, height: b), position: .init(x: x, y: y + h))
                x += a
            }
            posX += 0.5 * a
            y += a + 2 * b
        }
    }
    
}
