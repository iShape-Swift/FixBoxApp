//
//  BoxScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

final class BoxScene: ObservableObject {
    
    private var matrix: Matrix = .empty

    @Published
    private (set) var points: [CGPoint] = []
    
    
    func initSize(screenSize: CGSize) {
        guard !matrix.screenSize.isIntSame(screenSize) else {
            return
        }
        matrix = Matrix(screenSize: screenSize, scale: 10)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.onUpdateMatrix()
        }
    }
    
    func makeView() -> BoxSceneView {
        BoxSceneView(scene: self)
    }
    
    private func onUpdateMatrix() {
        self.update()
    }
    
    private func update() {
        points = matrix.screen(wordPoints: [
            CGPoint(x: -10, y: -15),
            CGPoint(x: -10, y:  15),
            CGPoint(x:  10, y:  15),
            CGPoint(x:  10, y: -15)
        
        ])
    }
}
