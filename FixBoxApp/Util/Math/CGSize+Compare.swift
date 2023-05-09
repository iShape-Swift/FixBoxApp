//
//  CGSize+Compare.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import CoreGraphics

extension CGSize {
    
    func isIntSame(_ size: CGSize) -> Bool {
        Int(size.width) == Int(width) && Int(size.height) == Int(height)
    }
    
}
