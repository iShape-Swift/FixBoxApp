//
//  CGFloat+FixFloat.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import CoreGraphics
import iFixFloat

extension CGFloat {
    
    var fix: FixFloat {
        Float(self).fix
    }

}

extension FixFloat {
    
    var cgFloat: CGFloat {
        CGFloat(self.double)
    }
    
}
