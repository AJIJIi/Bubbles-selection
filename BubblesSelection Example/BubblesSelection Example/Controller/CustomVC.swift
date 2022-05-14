//
//  CustomVC.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 03/04/22.
//

import UIKit

//Base class for all my controllers
class CustomVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .dynamicColor(light: .white, dark: .black)
        configureViews()
        view.layoutIfNeeded()
        layoutViews()
    }
    
    func configureViews() {} //to set parameters for subviews
    func layoutViews() {} //to set layout rules
}
