//
//  NextButton.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 10/05/22.
//

import UIKit

//for short and nice code in VC
class NextButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        setTitleColor(.systemBlue.withAlphaComponent(0.3), for: .highlighted)
        titleLabel?.font = .boldSystemFont(ofSize: 20.adapted())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
