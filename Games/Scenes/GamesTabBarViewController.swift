//
//  GamesTabbarViewController.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GamesTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let gamesViewController = GamesBuilder.make()
        let favoritesViewController = FavoritesBuilder.make()
        gamesViewController.tabBarItem = UITabBarItem(
            title: Localization.Tabbar.games.translation,
            image: Images.Tabbar.gameControllerActive.image,
            selectedImage: Images.Tabbar.gameControllerPassive.image
        )
        favoritesViewController.tabBarItem = UITabBarItem(
            title: Localization.Tabbar.favorites.translation,
            image: Images.Tabbar.favoritesPassive.image,
            selectedImage: Images.Tabbar.favoritesActive.image
        )
        viewControllers = [gamesViewController, favoritesViewController]
    }
}
