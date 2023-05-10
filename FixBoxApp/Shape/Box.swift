//
//  Box.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 10.05.2023.
//

import SwiftUI

struct Box: Identifiable {
    let id: Int
    let center: CGPoint
    let radians: CGFloat
    let size: CGSize
    let color: Color
}

struct BoxShape: View {

    let box: Box
    
    var body: some View {
        Path { path in
            
            let a = 0.5 * box.size.width
            let b = 0.5 * box.size.height
            
            path.move(to: CGPoint(x: -a, y: -b))
            path.addLine(to: CGPoint(x: -a, y: b))
            path.addLine(to: CGPoint(x: a, y: b))
            path.addLine(to: CGPoint(x: a, y: -b))
            
            path.closeSubpath()
        }
        .strokedPath(.init(lineWidth: 2))
        .rotation(Angle(radians: box.radians), anchor: .topLeading)
        .offset(.init(x: box.center.x, y: box.center.y))
        .foregroundColor(box.color)
    }

}
