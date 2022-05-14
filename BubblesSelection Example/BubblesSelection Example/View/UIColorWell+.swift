//
//  UIColorWell+.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 10/05/22.
//

import UIKit

//for short and nice code in VC
extension UIColorWell {
    convenience init(title: String, initialColor: UIColor) {
        self.init(frame: .zero)
        self.title = title
        selectedColor = initialColor
    }
}
