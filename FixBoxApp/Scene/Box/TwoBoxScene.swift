//
//  TwoBoxScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat
import SpriteKit


final class TwoBoxScene: ObservableObject {

    func makeView() -> TwoBoxSceneView {
        TwoBoxSceneView(scene: self)
    }
    
    func makeSpriteScene(screenSize: CGSize) -> SKScene {
        let scene = SpriteScene(size: screenSize, scale: 20)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {

    override func didCreate() {
        let material = Material(bounce: 0, friction: 1024, density: 5.fix, airLinearFriction: .unit, airAngularFriction: .unit)
        
        self.addBox(size: .init(width: 4.0, height: 4.0), position: CGPoint(x: -10, y: 2), angle: 0.25 * .pi, velocity: CGPoint(x: 2, y: 0), material: material)
        self.addBox(size: .init(width: 4.0, height: 4.0), position: CGPoint(x:  10, y: -2), angle: 0.25 * .pi, velocity: CGPoint(x: -2, y: 0), material: material)
    }
    
}
