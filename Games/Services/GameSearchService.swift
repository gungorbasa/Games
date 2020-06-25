//
//  GameSearchService.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol GameSearchServing {
  func fetch(_ query: String, completion: @escaping (Result<[Game], Error>) -> Void)
  func fetchMore(_ completion: @escaping (Result<[Game], Error>) -> Void)
}

final class GameSearchService: GameSearchServing {
  private let networking: Networking
  private var nextPage: String?
  
  init(_ networking: Networking = NativeNetworking()) {
    self.networking = networking
  }
  
  func fetch(_ query: String, completion: @escaping (Result<[Game], Error>) -> Void) {
    networking.run(route: GameRoute.search(query)) { (result: Result<GameList, Error>) in
      switch result {
      case .success(let gameList):
        self.nextPage = gameList.next
        completion(.success(gameList.results))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func fetchMore(_ completion: @escaping (Result<[Game], Error>) -> Void) {
    networking.run(route: GameRoute.dynamic(nextPage ?? "")) { (result: Result<GameList, Error>) in
      switch result {
      case .success(let gameList):
        self.nextPage = gameList.next
        completion(.success(gameList.results))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
