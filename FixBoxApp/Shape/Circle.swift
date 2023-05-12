//
//  Circle.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 10.05.2023.
//

import SwiftUI

struct Circle: Identifiable {
    let id: Int
    let center: CGPoint
    let radius: CGFloat
    let radians: CGFloat
    let color: Color
}

struct CircleShape: View {

    let circle: Circle
    
    var body: some View {
        Path { path in
            path.addEllipse(in: .init(
                x: -circle.radius,
                y: -circle.radius,
                width: 2 * circle.radius,
                height: 2 * circle.radius)
            )
            path.closeSubpath()
            
            path.move(to: .zero)
            path.addLine(to: .init(x: circle.radius, y: 0))
        }
        .strokedPath(.init(lineWidth: 2))
        .rotation(Angle(radians: -circle.radians), anchor: .topLeading)
        .offset(.init(x: circle.center.x, y: circle.center.y))
        .foregroundColor(circle.color)
    }

}
