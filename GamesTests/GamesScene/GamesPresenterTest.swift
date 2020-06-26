//
//  GamesPresenterTest.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Games

final class GamesPresenterTest: XCTestCase {

  private let view = GamesViewMock()
  private let interactor = GamesInteractorMock()
  private let router = GamesRouterMock()
  private let factory = GamesCellFactoryMock()
  private var presenter: GamesPresenterProtocol? = nil

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    interactor.isFetchGamesCalled = false
    interactor.isFetchGamesCalled = false
    interactor.isSearchCalled = false
    view.result = nil
    presenter = GamesPresenter(
      view,
      interactor: interactor,
      router: router,
      factory: factory
    )
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    presenter = nil
  }

  // Makes sure interactor's fetchGames is called
  func testOnViewDidLoad() {
    presenter?.onViewDidLoad()
    XCTAssertTrue(interactor.isFetchGamesCalled, "Should call Interactor -> FetchGame")
  }

  // Makes Sure navigationBarTitle is set on viewWillAppear
  func testOnViewWillAppear() {
    view.result = nil

    presenter?.onViewWillAppear()

    switch view.result {
    case .navigationBar(let title):
      XCTAssert(title == Localization.GamesScreen.title.translation, "Wrong Title")
    default:
      XCTFail("Should call set navigation title")
    }
  }

  // Makes sure interactor -> search is called onSearchBar(textDidChange: "a")
  func testOnSearchBarTextDidChange() {
    presenter?.onSearchBar(textDidChange: "a")
    XCTAssertTrue(interactor.isSearchCalled, "Interctor -> Search method should be called")
  }

  // Makes sure fetchGames is called onSearchBarCancelButtonClicked()
  func testOnSearchBarCancelButtonClicked() {
    presenter?.onSearchBarCancelButtonClicked()
    XCTAssertTrue(interactor.isFetchGamesCalled, "Should call Interactor -> FetchGame")
  }


  func testOnPrefetchRowsForList() {
    // Given state is list
    presenter?.onViewDidLoad()

    // Where is called
    presenter?.onPrefetchRows(at: [IndexPath(item: 0, section: 0)])

    // Then
    XCTAssertTrue(interactor.isFetchMoreGamesCalled, "FetchMore should be called")
    XCTAssertFalse(interactor.isSearchCalled, "Search method should not be called")
  }

  func testOnPrefetchRowsForSearch() {
    // Given state is search
    presenter?.onSearchBar(textDidChange: "asdasd")

    // Where is called
    presenter?.onPrefetchRows(at: [IndexPath(item: 0, section: 0)])

    // Then
    XCTAssertTrue(interactor.isSearchCalled, "Search method should be called")
    XCTAssertFalse(interactor.isFetchMoreGamesCalled, "FetchMore should not be called")
  }
}
