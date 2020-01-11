//
//  Game.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct Game: Codable {
    let id: Int
    let name: String
    let released: String
    let background_image: String
    let metacritic: Int?
    let genres: [Genre]
}
