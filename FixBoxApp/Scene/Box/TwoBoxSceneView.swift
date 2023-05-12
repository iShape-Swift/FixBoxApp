//
//  TwoBoxSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI
import SpriteKit

struct TwoBoxSceneView: View {
 
    @ObservedObject
    var scene: TwoBoxScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        SpriteView(scene: scene.makeSpriteScene(screenSize: size))
    }
    
}
