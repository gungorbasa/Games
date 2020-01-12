//
//  GameCellFactoryTest.swift
//  GamesTests
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Games

class GameCellFactoryTest: XCTestCase {
    private let genre1 = Genre(id: 0, name: "Action")
    private let genre2 = Genre(id: 1, name: "RPG")
    private lazy var game1 = Game(
        id: 0, name: "Name1",
        released: "Released1",
        background_image: "imgstring1",
        metacritic: 100,
        genres: [genre1, genre2]
    )
    private lazy var game2 = Game(
        id: 0, name: "Name2",
        released: "Released2",
        background_image: "imgstring2",
        metacritic: 95,
        genres: [genre1]
    )

    private let factory = GameCellFactory()

    func testGame() {
        let viewModel = factory.game(from: game1)
        let expected = createCellViewModel(from: game1)
        XCTAssertTrue(viewModel == expected, "Viewmodel does not match with expected")
    }

    func testGameArray() {
        let viewModels = factory.games(from: [game1, game2])
        XCTAssertTrue(viewModels.count == 2, "Game array size doesnt match")
        XCTAssertTrue(viewModels[0] == createCellViewModel(from: game1), "First viewModel doesnt match")
        XCTAssertTrue(viewModels[1] == createCellViewModel(from: game2), "Second viewModel doesnt match")
    }

    func createCellViewModel(from game: Game) -> GamesTableViewCellViewModel {
        let genreString = game.genres.map { $0.name }.joined(separator: ", ")
        return GamesTableViewCellViewModel(
            imageUrl: game.background_image,
            gameTitle: game.name,
            gameScore: game.metacritic,
            gameGenres: genreString
        )
    }
}
