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
    
    private var matrix: Matrix = .empty

    @Published
    private (set) var boxes: [Box] = []
    private (set) var handlers: [BodyHandler] = []
    
    
    private let lopper = Looper()
    private var world = World(boundary: Boundary(size: Size(x: 10.fix, y: 10.fix)), settings: .default, gravity: .zero)
    
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
        
        var a = Body(id: 0, transform: .init(position: .init(x: -10.fix, y: 1)))
        a.attach(shape: .init(size: .init(x: 2.fix, y: 2.fix)))
        a.addVelocityToCenterOfMass(FixVec(5.fix, 1.fix))

        var b = Body(id: 1, transform: .init(position: .init(x: 10.fix, y: 0)))
        b.attach(shape: .init(size: .init(x: 5.fix, y: 5.fix)))
        
        handlers.append(world.add(body: a))
        handlers.append(world.add(body: b))
    }
    
    func iterate(context: LoopContext) {
        guard !matrix.isZero else { return }

        world.iterate()
        boxes.removeAll()
        
        for i in 0..<handlers.count {
            let actor = world.actor(handler: handlers[i])
            let center = matrix.screen(worldPoint: actor.body.transform.position.float.point)
            let radians = actor.body.transform.angle.double
            let a = matrix.screen(world: actor.body.shape.size.x.double)
            let b = matrix.screen(world: actor.body.shape.size.y.double)
            
            boxes.append(Box(
                id: i,
                center: center,
                radians: radians,
                size: CGSize(width: a, height: b),
                color: .green)
            )
        }
    }
}

