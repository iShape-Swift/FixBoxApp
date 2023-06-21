//
//  BoxStackScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 10.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat
import SpriteKit


final class BoxStackScene: ObservableObject {

    func makeView() -> BoxStackSceneView {
        BoxStackSceneView(scene: self)
    }
    
    func makeSpriteScene(screenSize: CGSize) -> SKScene {
        let scene = SpriteScene(size: screenSize, scale: 40, gravity: .gravity)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {

    override func didCreate() {
        let material = Material(bounce: 368, friction: 768, density: .unit, airLinearFriction: .unit, airAngularFriction: .unit)
        
        self.addBox(size: .init(width: 2, height: 2), position: CGPoint(x: 0.0, y: 2), material: material)
        self.addBox(size: .init(width: 2, height: 2), position: CGPoint(x: 0.4, y: 0), material: material)
        self.addBox(size: .init(width: 2, height: 2), position: CGPoint(x: 0.8, y: -2), material: material)
        self.addBox(size: .init(width: 2, height: 2), position: CGPoint(x: 1.2, y: -4), material: material)
        
        self.addBox(size: .init(width: 32, height: 2), position: .init(x: 0, y: -10), isDynamic: false)
    }
    
}

