//
//  GamesRouter.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GamesRouter: GamesRouterProtocol {

  unowned let view: UIViewController

  init(_ view: UIViewController) {
    self.view = view
  }

  func navigate(to route: GamesRoute) {
    let navigationController = view.tabBarController?.navigationController
    switch route {
    case .details(let game):
      let viewController = GameDetailsBuilder.make(game)
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
}
