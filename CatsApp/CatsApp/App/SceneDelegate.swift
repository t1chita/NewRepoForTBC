//
//  SceneDelegate.swift
//  CatsApp
//
//  Created by Temur Chitashvili on 01.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let mainPageView = MainPageView()
        let mainPageViewModel = MainPageViewModel()
        let rootViewController = MainPageVC(mainPageViewModel: mainPageViewModel, mainPageView: mainPageView)
        let navigatorController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
    }
}

