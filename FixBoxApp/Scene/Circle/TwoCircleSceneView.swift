//
//  TwoCircleSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

struct TwoCircleSceneView: View {
 
    @ObservedObject
    var scene: TwoCircleScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        scene.initSize(screenSize: size)
        return ZStack {
            Color.white

            ForEach(scene.circles) { circle in
                CircleShape(circle: circle)
            }
            
        }.onAppear() {
            scene.onAppear()
        }.onDisappear {
            scene.onDisappear()
        }
    }
    
}
