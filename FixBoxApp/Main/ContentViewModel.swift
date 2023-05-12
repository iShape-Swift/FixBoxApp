//
//  ContentViewModel.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

final class ContentViewModel: ObservableObject {

    private let twoCircleScene = TwoCircleScene()
    private let twoBoxScene = TwoBoxScene()
    private let boxAndFloorScene = BoxAndFloorScene()
    private let boxStackScene = BoxStackScene()
    
    var scenes: [FixScene] = [
        .twoCircle,
        .twoBox,
        .boxAndFloor,
        .boxStack
    ]
    private (set) var index = PersistInt(key: "FixSceneIndex", nilValue: FixScene.twoCircle.rawValue)
    
    
    @Published
    var selection: FixScene = .twoCircle {
        didSet {
            index.value = selection.rawValue
        }
    }

    @ViewBuilder var contentView: some View {
        switch selection {
        case .twoCircle:
            twoCircleScene.makeView()
        case .twoBox:
            twoBoxScene.makeView()
        case .boxAndFloor:
            boxAndFloorScene.makeView()
        case .boxStack:
            boxStackScene.makeView()
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
