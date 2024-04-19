//
//  SceneDelegate.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigatorController = UINavigationController(rootViewController: MainPageVC())
        navigatorController.isNavigationBarHidden = true
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
    }
}
