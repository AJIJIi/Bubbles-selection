//
//  UISlider+.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 10/05/22.
//

import UIKit

//for short and nice code in VC
extension UISlider {
    convenience init(min: Float, max: Float, initial: Float) {
        self.init(frame: .zero)
        minimumValue = min
        maximumValue = max
        setValue(initial, animated: false)
    }
}
