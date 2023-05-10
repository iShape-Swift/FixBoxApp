//
//  TwoBoxSceneView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

struct TwoBoxSceneView: View {
 
    @ObservedObject
    var scene: TwoBoxScene
    
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
