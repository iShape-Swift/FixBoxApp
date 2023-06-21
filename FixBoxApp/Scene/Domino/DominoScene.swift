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
        let scene = SpriteScene(size: screenSize, scale: 40, gravity: CGPoint(x: 0, y: -10).fixVec)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {

    let material = Material(bounce: 0, friction: 800, density: .unit, airLinearFriction: .unit, airAngularFriction: .unit)
    
    override func didCreate() {
        let floorHeight: CGFloat = 1
        let n = 15
        let dominoHeight: CGFloat = 0.5
        
        let a = 5 * dominoHeight
        let b = dominoHeight
        let h = 0.5 * (a + b)
        
        var posY = -0.5 * (a * CGFloat(n) + floorHeight)
        self.addBox(size: .init(width: 32, height: floorHeight), position: .init(x: 0, y: posY), material: material, isDynamic: false)
        
        posY += dominoHeight

        var posX = -0.5 * CGFloat(n) * a
        var y = posY + 0.5 * a
        for j in 0..<n {
            var x = posX
            for _ in 0..<n-j {
                if j > 0 {
                    self.addBox(size: .init(width: a, height: b), position: .init(x: x, y: y - h), material: material)
                }
                self.addBox(size: .init(width: b, height: a), position: .init(x: x, y: y), material: material)
                self.addBox(size: .init(width: a, height: b), position: .init(x: x, y: y + h), material: material)
                x += a
            }
            posX += 0.5 * a
            y += a + 2 * b
        }
    }
    
}
