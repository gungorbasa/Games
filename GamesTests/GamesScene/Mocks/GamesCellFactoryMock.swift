//
//  GamesCellFactoryMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

final class GamesCellFactoryMock: GameCellFactoring {

  var viewModels: [GamesTableViewCellViewModel] = []

  func games(from models: [Game]) -> [GamesTableViewCellViewModel] {
    return viewModels
  }
}
