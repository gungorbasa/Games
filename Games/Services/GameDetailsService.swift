//
//  GameDetailsService.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol GameDetailsServing {
  
  func fetch(details id: String, completion: @escaping (Result<GameDetails, Error>) -> Void)
}

final class GameDetailsService: GameDetailsServing {
  
  private let networking: Networking
  
  init(_ networking: Networking = NativeNetworking()) {
    self.networking = networking
  }
  
  func fetch(details id: String, completion: @escaping (Result<GameDetails, Error>) -> Void) {
    networking.run(
    route: GameRoute.details(id)) { (result: Result<GameDetails, Error>) in
      completion(result)
    }
  }
}
