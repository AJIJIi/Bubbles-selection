//
//  Utilities.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 02/04/22.
//

import UIKit

extension Int {
    //arithmetic mean for width and height ratios
    func adapted() -> CGFloat {
        return (self.adaptedHeight() + self.adaptedWidth()) / 2
    }
    
    //width ratio
    func adaptedWidth() -> CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.width / AppConstants.designedDeviceWidth
    }
    
    //height ratio
    func adaptedHeight() -> CGFloat {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        return CGFloat(self) * (UIScreen.main.bounds.height - topPadding - bottomPadding) / AppConstants.designedDeviceHeight
    }
}

extension UIView {
    //AutoLayout function
    func addEqualConstraints(bottom: (NSLayoutYAxisAnchor, CGFloat)? = nil,
                             top: (NSLayoutYAxisAnchor, CGFloat)? = nil,
                             left: (NSLayoutXAxisAnchor, CGFloat)? = nil,
                             right: (NSLayoutXAxisAnchor, CGFloat)? = nil,
                             centerX: (NSLayoutXAxisAnchor, CGFloat)? = nil,
                             centerY: (NSLayoutYAxisAnchor, CGFloat)? = nil,
                             height: CGFloat? = nil,
                             width: CGFloat? = nil)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom.0, constant: bottom.1).isActive = true
        }
        if let top = top {
            topAnchor.constraint(equalTo: top.0, constant: top.1).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left.0, constant: left.1).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right.0, constant: right.1).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX.0, constant: centerX.1).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY.0, constant: centerY.1).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
