//
//  FixScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

enum FixScene: Int, Identifiable {
    
    var id: FixScene { self }
    
    case twoCircle
    case twoBox
    case boxStack
    
    var title: String {
        switch self {
        case .twoCircle:
            return "twoCircle"
        case .twoBox:
            return "twoBox"
        case .boxStack:
            return "boxStack"
        }
    }
    
}
