//
//  TwoCircleScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI
import iFixBox
import iFixFloat

final class TwoCircleScene: ObservableObject {
    
    private var matrix: Matrix = .empty

    @Published
    private (set) var circles: [Circle] = []
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
    
    func makeView() -> TwoCircleSceneView {
        TwoCircleSceneView(scene: self)
    }

    private func initWorld() {
        world.reset()
        
        var a = Body(id: 0, transform: .init(position: .init(x: -10.fix, y: 1)))
        a.attach(shape: .init(radius: 1.fix))
        a.addVelocityToCenterOfMass(FixVec(5.fix, 1.fix))

        var b = Body(id: 1, transform: .init(position: .init(x: 10.fix, y: 0)))
        b.attach(shape: .init(radius: 4.fix))
        
        handlers.append(world.add(body: a))
        handlers.append(world.add(body: b))
    }
    
    func iterate(context: LoopContext) {
        guard !matrix.isZero else { return }

        world.iterate()
        circles.removeAll()
        
        for i in 0..<handlers.count {
            let actor = world.actor(handler: handlers[i])
            let center = matrix.screen(worldPoint: actor.body.transform.position.float.point)
            let radians = actor.body.transform.angle.double
            let radius = matrix.screen(world: actor.body.shape.radius.double)
            
            circles.append(Circle(
                id: i,
                center: center,
                radius: radius,
                radians: radians,
                color: .green)
            )
        }
    }
}
