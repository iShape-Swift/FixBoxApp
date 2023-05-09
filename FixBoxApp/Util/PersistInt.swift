//
//  PersistInt.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import Foundation

final class PersistInt {
    
    private let key: String
    private let nilValue: Int
    
    var value: Int {
        get {
            guard UserDefaults.standard.value(forKey: key) != nil else {
                return nilValue
            }
            return UserDefaults.standard.integer(forKey: key)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    init(key: String, nilValue: Int = 0) {
        self.key = key
        self.nilValue = nilValue
    }
    
}
