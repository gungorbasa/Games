//
//  Images.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

enum Images {
    enum Tabbar {
        case gameControllerActive
        case gameControllerPassive
        case favoritesActive
        case favoritesPassive

        var image: UIImage? {
            switch self {
            case .gameControllerActive:
                return UIImage(named: "gamecontroller_active")
            case .gameControllerPassive:
                return UIImage(named: "gamecontroller_passive")
            case .favoritesActive:
                return UIImage(named: "favorites_active")
            case .favoritesPassive:
                return UIImage(named: "favorites_passive")
            }
        }
    }
}
