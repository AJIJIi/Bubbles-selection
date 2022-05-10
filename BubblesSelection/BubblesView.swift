//
//  BubblesView.swift
//  Bubbles selection
//
//  Created by Aleksei Bochkov on 15/04/22.
//

import SpriteKit

/* The main class which you use.
 */
public class BubblesView: SKView {
    
    private var bubblesScene: BubblesScene!
    public var bubblesDelegate: BubblesViewDelegate?
    
    public init(backgroundColor: UIColor, magnetStrength: CGFloat) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        self.bubblesScene = BubblesScene(backgroundColor: backgroundColor, magnetStrength: magnetStrength)
        
        presentScene(bubblesScene)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Call this function in viewDidLayoutSubviews() of ViewController which contains your BubbleView
    public func updateSceneSize() {
        bubblesScene.size = frame.size
        bubblesScene.updateMagneticFieldPosition()
    }
    
    public func updateBackgroundColor(_ color: UIColor) {
        bubblesScene.backgroundColor = color
    }
    
    public func addBubble(_ data: BubbleData) {
        bubblesScene.addBubble(data)
    }
}
