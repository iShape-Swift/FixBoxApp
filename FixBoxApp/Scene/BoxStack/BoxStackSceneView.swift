//
//  BoxStackSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 10.05.2023.
//

import SwiftUI

struct BoxStackSceneView: View {
    
    @ObservedObject
    var scene: BoxStackScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        scene.initSize(screenSize: size)
        return ZStack {
            Color.white

            ForEach(scene.boxes) { box in
                BoxShape(box: box)
            }
            
        }.onAppear() {
            scene.onAppear()
        }.onDisappear {
            scene.onDisappear()
        }
    }
}
