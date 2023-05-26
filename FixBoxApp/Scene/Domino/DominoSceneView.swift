//
//  DominoSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 24.05.2023.
//

import SwiftUI
import SpriteKit

struct DominoSceneView: View {
    
    @ObservedObject
    var scene: DominoScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        SpriteView(scene: scene.makeSpriteScene(screenSize: size))
    }
}
