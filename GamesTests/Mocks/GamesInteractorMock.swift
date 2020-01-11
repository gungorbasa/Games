//
//  GamesInteractorMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

@testable import Games

final class GamesInteractorMock: GamesInteractorProtocol {
    var delegate: GamesInteractorDelegate?

    var searchIsCalled = false
    var fetchGamesIsCalled = false
    var fetchMoreGamesIsCalled = false

    func search(_ text: String) {
        searchIsCalled = true
    }

    func fetchGames() {
        fetchGamesIsCalled = true
    }

    func fetchMoreGames() {
        fetchMoreGamesIsCalled = true
    }
}
