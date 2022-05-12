//
//  BubbleData.swift
//  Bubbles selection
//
//  Created by Aleksei Bochkov on 08/04/22.
//

import UIKit

//Struct which contains all configured data for a bubble. Has default values
public struct BubbleData {
    let radius: CGFloat
    let attributedText: NSAttributedString?
    let image: UIImage?
    let fillColor: UIColor
    let borderColor: UIColor
    let borderWidth: CGFloat
    let selectedColor: UIColor
    let selectedRatio: CGFloat
    
    public init(radius: CGFloat = 40,
         attributedText: NSAttributedString? = nil,
         image: UIImage? = nil,
         fillColor: UIColor = .white,
         borderColor: UIColor = .black,
         borderWidth: CGFloat = 1,
         selectedColor: UIColor = .red,
         selectedRatio: CGFloat = 1.5)
    {
        self.radius = radius
        self.attributedText = attributedText
        self.image = image
        self.fillColor = fillColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.selectedColor = selectedColor
        self.selectedRatio = selectedRatio
    }
}
