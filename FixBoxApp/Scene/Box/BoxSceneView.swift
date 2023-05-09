//
//  BoxSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

struct BoxSceneView: View {
 
    @ObservedObject
    var scene: BoxScene
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
        }
    }
    
    private func content(size: CGSize) -> some View {
        scene.initSize(screenSize: size)
        return ZStack {
            Color.white

            Path { path in
                path.addLines(scene.points)
                path.closeSubpath()
            }
            .strokedPath(.init(lineWidth: 2))
            .foregroundColor(.blue)
            
        }
    }
    
}
