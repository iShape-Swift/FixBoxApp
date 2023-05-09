//
//  FixScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

enum FixScene: Int, Identifiable {
    
    var id: FixScene { self }
    
    case circle
    case box
    
    var title: String {
        switch self {
        case .circle:
            return "circle"
        case .box:
            return "box"
        }
    }
    
}
