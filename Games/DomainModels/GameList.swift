//
//  GameList.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct GameList: Codable {
    let next: String?
    let results: [Game]
}
