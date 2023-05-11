//
//  BoxStackScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 10.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat


final class BoxStackScene: ObservableObject {
    
    let material = Material(bounce: 256, friction: 256, density: .unit, airLinearFriction: .unit, airAngularFriction: .unit)
    private var matrix: Matrix = .empty

    @Published
    private (set) var boxes: [Box] = []
    private (set) var handlers: [BodyHandler] = []
    
    
    private let lopper = Looper()
    private var world = World(boundary: Boundary(size: Size(x: 10.fix, y: 10.fix)), settings: .default)
    
    func onAppear() {
        self.initWorld()
        lopper.start(onUpdate: iterate)
    }
    
    func onDisappear() {
        lopper.stop()
    }
    
    func initSize(screenSize: CGSize) {
        guard !matrix.screenSize.isIntSame(screenSize) else {
            return
        }
        matrix = Matrix(screenSize: screenSize, scale: 10)
    }
    
    func makeView() -> BoxStackSceneView {
        BoxStackSceneView(scene: self)
    }

    private func initWorld() {
        world.reset()
        var flor = Body(id: 100, transform: .init(position: .init(x: 0, y: -10.5.fix)), isDynamic: false, material: material)
        flor.attach(shape: .init(size: .init(x: 50.fix, y: 1.fix)))
        handlers.append(world.add(body: flor))
        
        for i in 0..<10 {
            var a = Body(
                id: Int64(i),
                transform: .init(position: .init(x: (i - 5).fix, y: (i * 5).fix), angle: 0.fix),
                material: material,
                applyGravity: true
            )
            a.attach(shape: .init(size: .init(x: 5.fix, y: 5.fix)))
            handlers.append(world.add(body: a))
        }
        
        
//        var a = Body(id: 0, transform: .init(position: .init(x: 0.fix, y: 8.fix), angle: 0.4.fix), material: material, applyGravity: true)
//        a.attach(shape: .init(size: .init(x: 5.fix, y: 5.fix)))
//
//        var b = Body(id: 1, transform: .init(position: .init(x: 0.fix, y: 0)), material: material, applyGravity: true)
//        b.attach(shape: .init(size: .init(x: 5.fix, y: 5.fix)))
//        handlers.append(world.add(body: a))
//        handlers.append(world.add(body: b))
        
    }
    
    func iterate(context: LoopContext) {
        guard !matrix.isZero else { return }

        world.iterate()
        boxes.removeAll()
        
        for i in 0..<handlers.count {
            let handler = handlers[i]
            let actor = world.actor(handler: handler)
            let center = matrix.screen(worldPoint: actor.body.transform.position.float.point)
            let radians = actor.body.transform.angle.double
            let a = matrix.screen(world: actor.body.shape.size.x.double)
            let b = matrix.screen(world: actor.body.shape.size.y.double)
            
            boxes.append(Box(
                id: Int(handler.id),
                center: center,
                radians: radians,
                size: CGSize(width: a, height: b),
                color: .green)
            )
        }
    }
}

