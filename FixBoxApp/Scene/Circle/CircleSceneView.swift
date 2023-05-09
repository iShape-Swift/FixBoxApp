//
//  CircleSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

struct CircleSceneView: View {
 
    @ObservedObject
    var scene: CircleScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        scene.initSize(screenSize: size)
        return ZStack {
            Color.white

            Circle()
                .size(width: 2 * scene.radius, height: 2 * scene.radius)
                .offset(scene.center)
                .stroke(lineWidth: 2)
                .foregroundColor(.green)
            
        }
    }
    
}
