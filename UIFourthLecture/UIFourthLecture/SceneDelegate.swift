//
//  SceneDelegate.swift
//  UIFourthLecture
//
//  Created by Temur Chitashvili on 09.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = UINavigationController(rootViewController: MainPageVC())
        window?.makeKeyAndVisible()
    }
}
