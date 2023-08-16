//
//  SceneDelegate.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let win = UIWindow(windowScene: windowScene)
        let nav = UINavigationController()
        let vc = FirstViewController()
        nav.setViewControllers([vc], animated: true)
        win.rootViewController = nav
        win.makeKeyAndVisible()
        self.window = win
    }

}

