//
//  GameDetailsRouter.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GameDetailsRouter: GameDetailsRouterProtocol {

    unowned let view: UIViewController

    init(_ view: UIViewController) {
        self.view = view
    }

    func navigate(to route: GameDetailsRoute) {

    }
}
