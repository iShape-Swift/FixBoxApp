//
//  CircleScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

final class CircleScene: ObservableObject {
    
    private var matrix: Matrix = .empty

    @Published
    private (set) var radius: CGFloat = 1
    
    @Published
    private (set) var center = CGPoint(x: 0, y: 0)
    
    
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
    
    func makeView() -> CircleSceneView {
        CircleSceneView(scene: self)
    }
    
    private func onUpdateMatrix() {
        self.update()
    }
    
    private func update() {
        let r: CGFloat = 10
        radius = matrix.screen(word: r)
        center = matrix.screen(wordPoint: .zero - CGPoint(x: r, y: -r))
    }
}
