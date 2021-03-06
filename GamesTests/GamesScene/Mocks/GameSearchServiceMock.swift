//
//  GameSearchServiceMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

final class GameSearchSeviceMock: GameSearchServing {
  
  var fetchResult: Result<[Game], Error> = .failure(GameServiceMockError.resultNotSet)
  var fetchMoreResult: Result<[Game], Error> = .failure(GameServiceMockError.resultNotSet)

  func fetch(_ query: String, completion: @escaping (Result<[Game], Error>) -> Void) {
    completion(fetchResult)
  }

  func fetchMore(_ completion: @escaping (Result<[Game], Error>) -> Void) {
    completion(fetchMoreResult)
  }
}
