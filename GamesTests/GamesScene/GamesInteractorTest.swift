//
//  GamesInteractorTest.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Games

class GamesInteractorTest: XCTestCase {

  private var interactor: GamesInteractorProtocol? = nil
  private let gameListService = GameListServiceMock()
  private let gameSearchService = GameSearchSeviceMock()
  private let presenter = GamesPresenterMock()
  private let game1 = Game(
    id: 1,
    name: "1",
    released: "Today",
    background_image: "image",
    metacritic: nil,
    genres: [Genre(id: 1, name: "1")]
  )
  private let game2 = Game(
    id: 2,
    name: "2",
    released: "Today",
    background_image: "image",
    metacritic: nil,
    genres: [Genre(id: 2, name: "2")]
  )

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    interactor = GamesInteractor(
      gameListService,
      gameSearchService: gameSearchService
    )
    gameListService.fetchResult = .failure(GameServiceMockError.resultNotSet)
    gameListService.fetchMoreResult = .failure(GameServiceMockError.resultNotSet)

    gameSearchService.fetchResult = .failure(GameServiceMockError.resultNotSet)
    gameSearchService.fetchMoreResult = .failure(GameServiceMockError.resultNotSet)

    interactor?.delegate = presenter
    presenter.result = nil
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    interactor = nil
  }

  func testOnFetchGames() {
    // Given
    gameListService.fetchResult = .success([game1])

    // When
    interactor?.fetchGames()

    // Then
    switch presenter.result {
    case .fetch(let games):
      XCTAssertEqual(games, [game1], "Result should be [game1]")
    default:
      XCTFail("Should call fetch with corresponding games")
    }
  }

  func testOnFetchMoreGames() {
    // Given
    gameListService.fetchMoreResult = .success([game2])

    // When
    interactor?.fetchMoreGames()

    // Then
    switch presenter.result {
    case .fetchMore(let games):
      XCTAssertEqual(games, [game2], "Result should be [game2]")
    default:
      XCTFail("Should call fetchMore with corresponding games")
    }
  }

  func testOnSearchSuccess() {
    // Given
    gameSearchService.fetchResult = .success([game1, game2])

    // When
    interactor?.search("asdassfd")

    // Then
    switch presenter.result {
    case .search(let games):
      XCTAssertEqual(games, [game1, game2], "Result should be [game1, game2]")
    default:
      XCTFail("Should call search with corresponding games")
    }
  }

  func testOnSearchFail() {
    // Given
    gameSearchService.fetchResult = .success([game1, game2])

    // When
    interactor?.search("")

    // Then
    if presenter.result != nil {
      XCTFail("Should not call search. Search term length is smaller than threshold")
    }
  }
}
