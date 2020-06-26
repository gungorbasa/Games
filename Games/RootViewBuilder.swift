//
//  RootViewBuilder.swift
//  Games
//
//  Created by Gungor Basa on 6/26/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class RootViewBuilder {

  @available(iOS 13.0, *)
  static func make(_ scene: UIScene) -> UIWindow? {
    guard let windowScene = (scene as? UIWindowScene) else { return nil }
    let window = UIWindow(windowScene: windowScene)
    let navController = UINavigationController()
    navController.navigationBar.prefersLargeTitles = true
    navController.viewControllers = [GamesTabBarController()]
    window.rootViewController = navController
    
    return window
  }

  static func make() -> UIWindow? {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let navController = UINavigationController()
    navController.navigationBar.prefersLargeTitles = true
    navController.viewControllers = [GamesTabBarController()]
    window.rootViewController = navController

    return window
  }
}
