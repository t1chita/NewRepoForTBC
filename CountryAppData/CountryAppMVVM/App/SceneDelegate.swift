//
//  SceneDelegate.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigatorController = UINavigationController(rootViewController: LoginPageViewController())
        navigatorController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
    }
}
