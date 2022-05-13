//
//  OnboardingVC.swift
//  Bubbles selection
//
//  Created by Aleksei Bochkov on 08/04/22.
//

import UIKit

//Explains what this app is about
final class OnboardingVC: CustomVC {
    
    private let explanationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.adapted())
        label.text = "This app demonstrates workflow of the framework \"Bubbles selection\". It's added to the CocoaPods and Swift Package manager.\n\nOn the next screen you'll be able to change parameters of the framework and to see the result by applying them. Also you can try random demonstration in order to see all posibilities of the framework at once.\n\nThis project was made by Aleksei Bochkov ❤"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let nextButton = NextButton(title: "Got it")
    
    override func configureViews() {
        super.configureViews()
        title = "About"
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - Layout views
    override func layoutViews() {
        super.layoutViews()
        
        view.addSubview(explanationLabel)
        explanationLabel.addEqualConstraints(
            bottom: (view.safeAreaLayoutGuide.bottomAnchor, -100),
            top: (view.safeAreaLayoutGuide.topAnchor, 15),
            left: (view.safeAreaLayoutGuide.leftAnchor, 15),
            centerX: (view.safeAreaLayoutGuide.centerXAnchor, 0)
        )
        
        view.addSubview(nextButton)
        nextButton.addEqualConstraints(
            bottom: (view.safeAreaLayoutGuide.bottomAnchor, -10),
            centerX: (view.safeAreaLayoutGuide.centerXAnchor, 0),
            height: 50,
            width: 100
        )
    }
}

//MARK: - Target functions
private extension OnboardingVC {
    @objc func nextButtonTapped() {
        navigationController?.pushViewController(ConfiguringVC(), animated: true)
    }
}
