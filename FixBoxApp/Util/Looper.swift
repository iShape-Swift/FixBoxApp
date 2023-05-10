//
//  Looper.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 10.05.2023.
//

import Foundation

struct LoopContext {
    
    let time: Double
    let deltaTime: Double
}

final class Looper {

    private var onUpdate: ((LoopContext) -> ())?
    private var lastTime: Date = Date()
    private var time: Double = 0
    
#if os(macOS)
    private var timer: Timer?

    func start(onUpdate: @escaping (LoopContext) -> ()) {
        self.onUpdate = onUpdate
        time = 0
        lastTime = Date()
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0/60.0, repeats: true, block: { [weak self] timer in
            self?.iterate()
        })
    }
    
    func stop() {
        onUpdate = nil
        timer?.invalidate()
        timer = nil
    }
    
#elseif os(iOS)
    private var displayLink: CADisplayLink?
    
    func start(onUpdate: @escaping (LoopContext) -> ()) {
        self.onUpdate = onUpdate
        time = 0
        lastTime = Date()

        guard displayLink == nil else { return }
        
        displayLink = CADisplayLink(target: self, selector: #selector(iterate))
        displayLink?.add(to: .main, forMode: RunLoop.Mode.default)
    }
    
    func stop() {
        self.onUpdate = nil
        displayLink?.remove(from: .main, forMode: RunLoop.Mode.default)
        displayLink = nil
    }
    
#endif

    @objc
    func iterate() {
        let nowTime = Date()
        let dt = nowTime.timeIntervalSince(lastTime)
        time += dt
        onUpdate?(LoopContext(time: time, deltaTime: dt))
        lastTime = nowTime
    }

}
