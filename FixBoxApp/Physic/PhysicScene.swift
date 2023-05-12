//
//  PhysicScene.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 12.05.2023.
//

import SpriteKit
import iFixBox
import iFixFloat

class PhysicScene: SKScene {

    private var shapes = [Int64: BodyNode]()
    private var contactsShapes = [ContactNode]()
    private var handlers = [BodyHandler]()
    private var matrix: Matrix = .empty
    private var world: World
    
    init(size: CGSize, scale: Float, gravity: FixVec = .zero) {
        matrix = Matrix(screenSize: size, scale: scale, inverseY: false)
        world = World(boundary: Boundary(size: Size(x: 100.fix, y: 100.fix)), settings: .default, gravity: gravity, isDebug: true)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.gray
        shapes.removeAll()
        handlers.removeAll()
        world.reset()
        self.didCreate()
    }

    override func update(_ currentTime: TimeInterval) {
        world.iterate()
        
        for handler in handlers {
            let actor = world.actor(handler: handler)
            if let shape = shapes[actor.handler.id] {
                shape.update(body: actor.body, matrix: matrix)
            }
        }

        if world.isDebug {
            self.update(contacts: world.contacts)
        }
    }
    
    func add(body: Body) {
        let handler = world.add(body: body)
        handlers.append(handler)
        let node: BodyNode
        switch body.shape.form {
        case .circle:
            let radius = matrix.screen(world: body.shape.radius.double)
            node = CircleNode(radius: radius, color: .green)
        case .rect:
            let a = matrix.screen(world: body.shape.size.x.double)
            let b = matrix.screen(world: body.shape.size.y.double)
            node = BoxNode(size: CGSize(width: a, height: b), color: .green)
        case .polygon:
            return
        }

        shapes[handler.id] = node
        addChild(node)
    }
    
    func addCircle(id: Int64 = -1, radius: CGFloat, position: CGPoint, angle: CGFloat = 0, velocity: CGPoint = .zero, angularVelocity: CGFloat = 0, material: Material = .ordinary, isDynamic: Bool = true) {
        let transform = Transform(position: position.fixVec, angle: angle.fix)
        let bodyId = id >= 0 ? id : self.findFreeId()
        var body = Body(id: bodyId, transform: transform, isDynamic: isDynamic, material: material)
        body.attach(shape: .init(radius: radius.fix))
        
        let fixAngVel = angularVelocity.fix
        
        if fixAngVel != 0 {
            body.addAngularVelocity(fixAngVel)
        }
        
        let fixVel = velocity.fixVec
        
        if fixVel != .zero {
            body.addVelocityToCenterOfMass(fixVel)
        }
        
        self.add(body: body)
    }
    
    func addBox(id: Int64 = -1, size: CGSize, position: CGPoint, angle: CGFloat = 0, velocity: CGPoint = .zero, angularVelocity: CGFloat = 0, material: Material = .ordinary, isDynamic: Bool = true) {
        let transform = Transform(position: position.fixVec, angle: angle.fix)
        let bodyId = id >= 0 ? id : self.findFreeId()
        var body = Body(id: bodyId, transform: transform, isDynamic: isDynamic, material: material)
        body.attach(shape: .init(size: .init(size.width.fix, size.height.fix)))
        
        let fixAngVel = angularVelocity.fix
        
        if fixAngVel != 0 {
            body.addAngularVelocity(fixAngVel)
        }
        
        let fixVel = velocity.fixVec
        
        if fixVel != .zero {
            body.addVelocityToCenterOfMass(fixVel)
        }
        
        self.add(body: body)
    }
    
    func didCreate() {
        
    }
    
    func findFreeId() -> Int64 {
        var i = Int64(handlers.count)
        while shapes[i] != nil {
            i += 1
        }
        return i
    }
    
    func update(contacts: [Contact]) {
        while contactsShapes.count < contacts.count {
            let node = ContactNode()
            contactsShapes.append(node)
            addChild(node)
        }
        
        var i = contacts.count
        while i < contactsShapes.count {
            contactsShapes[i].isHidden = true
            i += 1
        }
        
        for j in 0..<contacts.count {
            let contact = contacts[j]
            contactsShapes[j].update(contact: contact, matrix: matrix)
        }
        
    }
    
}
