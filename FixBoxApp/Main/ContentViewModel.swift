//
//  ContentViewModel.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

final class ContentViewModel: ObservableObject {

    private let circleScene = CircleScene()
    private let boxScene = BoxScene()
    
    var scenes: [FixScene] = [.circle, .box]
    private (set) var index = PersistInt(key: "FixSceneIndex", nilValue: FixScene.circle.rawValue)
    
    
    @Published
    var selection: FixScene = .circle {
        didSet {
            index.value = selection.rawValue
        }
    }

    @ViewBuilder var contentView: some View {
        switch selection {
        case .circle:
            circleScene.makeView()
        case .box:
            boxScene.makeView()
        }
    }
    
    func onAppear() {
        if index.value != selection.rawValue {
            if let last = FixScene(rawValue: index.value) {
                selection = last
            }
        }
    }
}
