//
//  GameDetails.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct GameDetails: Codable {
  let id: Int
  let name: String
  let description_raw: String?
  let background_image: String?
  let website: String?
  let reddit_url: String?
}
