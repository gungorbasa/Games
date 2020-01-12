//
//  Localization.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

enum Localization {
    enum Tabbar: String {
        case games = "Games"
        case favorites = "Favorites"

        // In the future we can use this for localization
        var translation: String {
            return self.rawValue
        }
    }

    enum GamesScreen {
        case title
        case critic

        var translation: String {
            switch self {
            case .title:
                return "Games"
            case .critic:
                return "metacritic"
            }

        }
    }

    enum GameDetails {
        case favorite
        case favorited

        var translation: String {
            switch self {
            case .favorite:
                return "Favorite"
            case .favorited:
                return "Favorited"
            }
        }
    }
}
