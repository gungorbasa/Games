//
//  GameListServiceMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

enum GameServiceMockError: Error {
  case resultNotSet
}

final class GameListServiceMock: GameListServing {

  var fetchResult: Result<[Game], Error> = .failure(GameServiceMockError.resultNotSet)
  var fetchMoreResult: Result<[Game], Error> = .failure(GameServiceMockError.resultNotSet)

  func fetch(_ completion: @escaping (Result<[Game], Error>) -> Void) {
    completion(fetchResult)
  }

  func fetchMore(_ completion: @escaping (Result<[Game], Error>) -> Void) {
    completion(fetchMoreResult)
  }
}
