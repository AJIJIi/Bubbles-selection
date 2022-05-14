//
//  AppDelegate.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 02/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            return true
        } else {
            window = UIWindow()
            window?.makeKeyAndVisible()
            window?.rootViewController = UINavigationController(rootViewController: OnboardingVC())
            return true
        }
    }
}

