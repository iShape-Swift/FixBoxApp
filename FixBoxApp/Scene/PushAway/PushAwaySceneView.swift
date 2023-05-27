//
//  PushAwaySceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 27.05.2023.
//

import SwiftUI
import SpriteKit

struct PushAwaySceneView: View {
 
    @ObservedObject
    var scene: PushAwayScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        SpriteView(scene: scene.makeSpriteScene(screenSize: size))
    }
    
}
