//
//  UIColor+.swift
//  BubblesSelection example app
//
//  Created by Aleksei Bochkov on 10/05/22.
//

import UIKit

extension UIColor {
    //generate almost random color which is good for example
    static func random(isDark: Bool) -> UIColor {
        let colorRange = isDark ? 0...CGFloat(0.5) : CGFloat(0.5)...1
        return UIColor(red: CGFloat.random(in: colorRange),
                       green: CGFloat.random(in: colorRange),
                       blue: CGFloat.random(in: colorRange),
                       alpha: CGFloat.random(in: 0.75...1))
    }
    
    //for dark theme
    public class func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor {
                switch $0.userInterfaceStyle {
                case .dark:
                    return dark
                default:
                    return light
                }
            }
        } else {
            return light
        }
    }
}
