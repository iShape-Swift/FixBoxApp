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
//        ZStack {
//            Path { path in
//
//                let a = 0.5 * box.size.width
//                let b = 0.5 * box.size.height
//
//                path.move(to: CGPoint(x: -a, y: -b))
//                path.addLine(to: CGPoint(x: -a, y: b))
//                path.addLine(to: CGPoint(x: a, y: b))
//                path.addLine(to: CGPoint(x: a, y: -b))
//
//                path.closeSubpath()
//            }
//            .strokedPath(.init(lineWidth: 2))
//            .foregroundColor(box.color)
//        }
//        .frame(width: box.size.width, height: box.size.height)
//        .position(box.center)
        ZStack {
            Path { path in
                
                let a = box.size.width
                let b = box.size.height
                
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: 0, y: b))
                path.addLine(to: CGPoint(x: a, y: b))
                path.addLine(to: CGPoint(x: a, y: 0))
                
                path.closeSubpath()
            }
            .strokedPath(.init(lineWidth: 2))
            .rotation(Angle(radians: -box.radians), anchor: .center)
            .foregroundColor(box.color)
        }
//        .background(box.id == 0 ? .red : .clear)
        .frame(width: box.size.width, height: box.size.height)
        .position(box.center)
    }

}

