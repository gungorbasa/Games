//
//  FavoritesRouter.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class FavoritesRouter: FavoritesRouterProtocol {
  
  unowned let view: UIViewController
  
  init(_ view: UIViewController) {
    self.view = view
  }
  
  func navigate(to route: FavoritesRoute) {
    let navigationController = view.tabBarController?.navigationController
    switch route {
    case .details(let game):
      let viewController = GameDetailsBuilder.make()
      viewController.presenter.game = game
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
}
