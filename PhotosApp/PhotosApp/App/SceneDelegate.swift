//
//  SceneDelegate.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let mainPageView = MainPageView()
        let rootController = MainPageVC(mainPageView: mainPageView)
        let navigatorController = UINavigationController(rootViewController: rootController)
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
    }
}

