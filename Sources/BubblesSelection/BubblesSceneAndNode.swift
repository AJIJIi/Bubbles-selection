//
//  BubblesScene.swift
//  Bubbles selection
//
//  Created by Aleksei Bochkov on 08/04/22.
//

import SpriteKit

/*A bubble. Identify it by a "name" property.
 Don't create it by yourself and don't change it.
 Only check "isSelected" property*/

public class BubbleNode: SKSpriteNode {
    
    private let shapeNode: SKShapeNode
    private let labelNode: SKLabelNode
    fileprivate var radius: CGFloat
    private let selectedColor: UIColor
    private let selectedRatio: CGFloat
    private let deselectedColor: UIColor
    
    public var isSelected = false {
        didSet {
            if isSelected {
                animateSelection()
            } else {
                animateDeselection()
            }
            guard let bubblesView = scene?.view as? BubblesView else { return }
            bubblesView.bubblesDelegate?.didChangeBubbleSelection(bubblesView, bubble: self)
        }
    }
    
    fileprivate init(_ data: BubbleData) {
        shapeNode = SKShapeNode(circleOfRadius: data.radius)
        labelNode = SKLabelNode()
        self.radius = data.radius
        self.selectedRatio = data.selectedRatio
        self.selectedColor = data.selectedColor
        self.deselectedColor = data.fillColor
        super.init(texture: nil, color: .clear, size: CGSize(width: radius * 2, height: radius * 2))
        name = UUID().uuidString
        
        physicsBody = SKPhysicsBody(circleOfRadius: radius)
        physicsBody?.isDynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
        physicsBody?.mass = 0.3
        physicsBody?.friction = 0
        physicsBody?.linearDamping = 1
        
        addChild(shapeNode)
        
        if #available(iOS 11.0, *) {
            labelNode.numberOfLines = 0
            labelNode.preferredMaxLayoutWidth = radius * 2
        }
        labelNode.verticalAlignmentMode = .center
        labelNode.horizontalAlignmentMode = .center
        
        update(data)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update(_ data: BubbleData) {
        
        shapeNode.fillColor = deselectedColor
        shapeNode.strokeColor = data.borderColor
        shapeNode.lineWidth = data.borderWidth
        if let image = data.image {
            shapeNode.fillTexture = SKTexture(image: image)
        }
        
        guard let attributedText = data.attributedText else {
            labelNode.removeFromParent()
            return
        }
        
        if #available(iOS 11.0, *) {
            labelNode.attributedText = attributedText
        }
        shapeNode.addChild(labelNode)
    }
    
    //If you don't want selection/deselection animation set selectedRation == 1 and selectedColor == fillColor
    private func animateSelection() {
        setScale(selectedRatio)
        shapeNode.fillColor = selectedColor
    }
    
    private func animateDeselection() {
        setScale(1)
        shapeNode.fillColor = deselectedColor
    }
}

/*A SpriteKitScene.
 Don't work with it, use BubbleView and it's functions instead*/

class BubblesScene: SKScene {
    
    private var movingNodeName: String?
    private var movedTooFar: Bool? //use it to check if it's a tap or not
    private var touchInitialLocation: CGPoint?
    private var magneticField: SKFieldNode!
    
    init(backgroundColor: UIColor, magnetStrength: CGFloat) {
        super.init(size: .zero)
        self.backgroundColor = backgroundColor
        physicsWorld.gravity = .zero
        scaleMode = .aspectFit
        addMagneticNode(strength: magnetStrength)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBubble(_ data: BubbleData) {
        let bubbleNode = BubbleNode(data)
        bubbleNode.position = CGPoint(x: Bool.random() ? 0 : frame.maxX,
                                      y: CGFloat.random(in: 0...frame.maxY))
        addChild(bubbleNode)
    }
    
    //Used once at the initializing BubbleView
    func addMagneticNode(strength: CGFloat) {
        magneticField = SKFieldNode.radialGravityField()
        magneticField.region = SKRegion(radius: 10000)
        magneticField.minimumRadius = 10000
        magneticField.strength = Float(strength)
        updateMagneticFieldPosition()
        magneticField.categoryBitMask = 0x1
        addChild(magneticField)
    }
    
    //Needs to be in another function because frameworks uses it when subviews were did layout
    func updateMagneticFieldPosition() {
        magneticField.position = CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            touchInitialLocation = location //save for future
            movedTooFar = false //initial value
            if let node = nodes(at: location).first(where: {$0 is BubbleNode}) {
                node.physicsBody?.fieldBitMask = 0x2 //when finger is hold on a bubble it doesn't magnet
                movingNodeName = node.name //save for future
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            guard let movingNodeName = movingNodeName else { return }
            
            for child in children {
                if child.name == movingNodeName, //find the node which saved in touchesBegan
                   let bubble = child as? BubbleNode,
                   location.x >= bubble.radius, //check that the point is not too far
                   location.x <= size.width - bubble.radius,
                   location.y >= bubble.radius,
                   location.y <= size.height - bubble.radius {
                    child.run(SKAction.move(to: location, duration: 0.1))
                    if let movedTooFar = movedTooFar, !movedTooFar, let touchInitialLocation = touchInitialLocation, Utilities.distance(location, touchInitialLocation) > bubble.radius {
                        self.movedTooFar = true
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let movedTooFar = movedTooFar, !movedTooFar {
            for touch in touches {
                let location = touch.location(in: self)
                if let movingNodeName = movingNodeName, let bubble = nodes(at: location).first(where: {$0 is BubbleNode && $0.name == movingNodeName}) as? BubbleNode {
                    bubble.isSelected.toggle() //if it was a tap on a bubble we select/deselect it
                }
            }
        }
        
        for child in children {
            if child.name == movingNodeName {
                child.physicsBody?.fieldBitMask = 0x1 //returning back magnetism for moving node
                break
            }
        }
        
        //setting default values
        movingNodeName = nil
        movedTooFar = nil
        touchInitialLocation = nil
    }
}

