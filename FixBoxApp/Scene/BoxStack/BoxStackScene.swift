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
        let scene = SpriteScene(size: screenSize, scale: 20, gravity: .gravity)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {

    override func didCreate() {
        let material = Material(bounce: 0, friction: 1024, density: .unit, airLinearFriction: .unit, airAngularFriction: .unit)
        
        self.addBox(size: .init(width: 2, height: 2), position: .zero, material: material)
        self.addBox(size: .init(width: 2, height: 2), position: CGPoint(x: 0, y: -2), material: material)
        
        self.addBox(size: .init(width: 20, height: 2), position: .init(x: 0, y: -10), isDynamic: false)
    }
    
}

