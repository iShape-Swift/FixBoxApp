//
//  BoxAndFloorScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat
import SpriteKit

final class BoxAndFloorScene: ObservableObject {

    func makeView() -> BoxAndFloorSceneView {
        BoxAndFloorSceneView(scene: self)
    }
    
    func makeSpriteScene(screenSize: CGSize) -> SKScene {
        let scene = SpriteScene(size: screenSize, scale: 80, gravity: CGPoint(x: 0, y: -10).fixVec)
        scene.scaleMode = .fill
        return scene
    }
   
}

private final class SpriteScene: PhysicScene {

    override func didCreate() {
        self.addBox(size: .init(width: 2, height: 2), position: .init(x: 0, y: 5), angle: 0.04)
        self.addBox(size: .init(width: 16, height: 2), position: .init(x: 0, y: -5), isDynamic: false)
    }
    
}
