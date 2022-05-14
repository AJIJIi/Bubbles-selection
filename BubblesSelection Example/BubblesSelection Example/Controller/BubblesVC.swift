//
//  BubblesVC.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 02/04/22.
//

import UIKit
import SpriteKit
//import BubblesSelection

//MARK: - Final controller with implemented BubblesView
final class BubblesVC: CustomVC {
    
    var backgroundColor: UIColor = .clear
    var magnetStrength: CGFloat = 5000
    var bubbles: [BubbleData] = []
    
    private var bubblesView: BubblesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo"
    }
    
    //Need to update size of the bubbleView!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bubblesView.updateSceneSize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBubbles()
    }
    
    //initialize bubblesView and set delegate to it if needed
    override func configureViews() {
        super.configureViews()
        bubblesView = BubblesView(backgroundColor: backgroundColor, magnetStrength: magnetStrength)
        bubblesView.bubblesDelegate = self
    }
    
    //MARK: - Layout subviews
    override func layoutViews() {
        super.layoutViews()
        
        view.addSubview(bubblesView)
        bubblesView.addEqualConstraints(
            bottom: (view.bottomAnchor, 0),
            top: (view.safeAreaLayoutGuide.topAnchor, 0),
            left: (view.safeAreaLayoutGuide.leftAnchor, 0),
            right: (view.safeAreaLayoutGuide.rightAnchor, 0)
        )
        
        view.layoutIfNeeded()
    }
}

//MARK: - Adding bubbles to the view
private extension BubblesVC {
    func addBubbles() {
        for index in 0 ... bubbles.count - 1 {
            bubblesView.addBubble(bubbles[index])
        }
    }
}

//MARK: - A function to react to changing state
extension BubblesVC: BubblesViewDelegate {
    func didChangeBubbleSelection(_ bubblesView: BubblesView, bubble: BubbleNode) {
        print("state changed")
    }
}
