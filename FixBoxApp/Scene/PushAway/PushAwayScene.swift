//
//  PushAwayScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 27.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat
import SpriteKit


final class PushAwayScene: ObservableObject {

    func makeView() -> PushAwaySceneView {
        PushAwaySceneView(scene: self)
    }
    
    func makeSpriteScene(screenSize: CGSize) -> SKScene {
        let scene = SpriteScene(size: screenSize, scale: 50, gravity: .gravity)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {

    override func didCreate() {
        let material = Material(bounce: 0, friction: 1024, density: 5.fix, airLinearFriction: .unit, airAngularFriction: .unit)
        
        self.addBox(size: .init(width: 2, height: 2), position: .init(x: 0, y: -3), angle: 0.04, material: material)
        self.addBox(size: .init(width: 16, height: 8), position: .init(x: 0, y: -5), material: material, isDynamic: false)
    }
    
}
