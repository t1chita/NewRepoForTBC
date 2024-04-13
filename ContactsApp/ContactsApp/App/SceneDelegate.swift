//
//  SceneDelegate.swift
//  ContactsApp
//
//  Created by Temur Chitashvili on 12.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let navigatorController = UINavigationController(rootViewController: SquadContactsVC())
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
        navigatorController.navigationBar.prefersLargeTitles = true
    }
}
