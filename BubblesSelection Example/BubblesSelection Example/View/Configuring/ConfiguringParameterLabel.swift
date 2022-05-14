//
//  ConfiguringParameterLabel.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 10/05/22.
//

import UIKit

//for short and nice code in VC
class ConfiguringParameterLabel: UILabel {
    init(_ text: String) {
        super.init(frame: .zero)
        self.text = text
        font = .systemFont(ofSize: 15.adapted())
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
