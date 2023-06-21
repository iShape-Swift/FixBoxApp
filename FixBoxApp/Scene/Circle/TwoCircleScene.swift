//
//  TwoCircleScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat
import SpriteKit

final class TwoCircleScene: ObservableObject {
    
    func makeView() -> TwoCircleSceneView {
        TwoCircleSceneView(scene: self)
    }
    
    func makeSpriteScene(screenSize: CGSize) -> SKScene {
        let scene = SpriteScene(size: screenSize, scale: 20, gravity: .zero)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {
    
    override func didCreate() {
        let material = Material(bounce: 0, friction: 1024, density: .unit, airLinearFriction: .unit, airAngularFriction: .unit)
        
        self.addCircle(radius: 2.02, position: CGPoint(x: -10, y: 2), velocity: CGPoint(x: 2, y: 0), material: material)
        self.addCircle(radius: 2.02, position: CGPoint(x:  10, y: -2), velocity: CGPoint(x: -2, y: 0), material: material)
    }
    
}
