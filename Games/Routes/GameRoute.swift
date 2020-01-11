//
//  GameListRoute.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
// https://api.rawg.io/api/games?amp=&page=1&page_size=10

enum GameRoute: Routing {
    case games
    case search(_ query: String)
    case dynamic(_ url: String)

    var host: String {
        switch self {
        case .games, .search:
            return "https://api.rawg.io/api/"
        case .dynamic(let urlString):
            return urlString
        }

    }
    var path: String {
        switch self {
        case .games, .search:
            return "games?"
        default:
            return ""
        }
    }

    var parameters: [String : Any] {
        switch self {
        case .games:
            return ["page": "1", "page_size": "10"]
        case .search(let query):
            return ["page": "1", "page_size": "10", "search": query]
        default:
            return [:]
        }
    }

    var method: HTTPMethod {
        return .get
    }
}
