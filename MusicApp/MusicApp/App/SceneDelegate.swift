//
//  SceneDelegate.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let mainPageView = MainPageView()
        let mainPageViewModel = MainPageViewModel()
        let mainPageVC = MainPageVC(mainPageView: mainPageView, mainPageViewModel: mainPageViewModel)
        let navigatorController = UINavigationController(rootViewController: mainPageVC)
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
    }
}

