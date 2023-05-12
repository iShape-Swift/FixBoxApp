//
//  BoxAndFloorSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import SwiftUI
import SpriteKit

struct BoxAndFloorSceneView: View {
    
    @ObservedObject
    var scene: BoxAndFloorScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        SpriteView(scene: scene.makeSpriteScene(screenSize: size))
    }
}
