//
//  ChatSceneRouter.swift
//  Games
//
//  Created Gungor Basa on 6/29/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class ChatSceneRouter: ChatSceneRouterProtocol {

    unowned let view: UIViewController

    init(_ view: UIViewController) {
        self.view = view
    }

    func navigate(to route: ChatSceneRoute) {

    }
}
