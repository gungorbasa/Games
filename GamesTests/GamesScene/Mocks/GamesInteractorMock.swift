//
//  GamesInteractorMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

final class GamesInteractorMock: GamesInteractorProtocol {

  var isSearchCalled = false
  var isFetchGamesCalled = false
  var isFetchMoreGamesCalled = false

  var delegate: GamesInteractorDelegate?

  func search(_ text: String) {
    isSearchCalled = true
  }

  func fetchGames() {
    isFetchGamesCalled = true
  }

  func fetchMoreGames() {
    isFetchMoreGamesCalled = true
  }
}
