//
//  BoxStackSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 10.05.2023.
//

import SwiftUI
import SpriteKit

struct BoxStackSceneView: View {
    
    @ObservedObject
    var scene: BoxStackScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        SpriteView(scene: scene.makeSpriteScene(screenSize: size))
    }
}
