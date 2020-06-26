//
//  GamesViewTest.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/26/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Games

final class GamesViewTest: XCTestCase {

  private var view: GamesViewController?
  private let presenter = GamesPresenterMock()

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    let storyboard = UIStoryboard(name: "Games", bundle: nil)
    let view = storyboard.instantiateViewController(withIdentifier: "GamesViewController") as! GamesViewController
    view.presenter = presenter
    view.loadViewIfNeeded()
    self.view = view
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    view = nil
  }

  func testViewDidLoad() {
    view?.viewDidLoad()
    XCTAssertTrue(presenter.isViewDidLoadCalled, "Should call Presenter -> onViewDidLoad")
  }

  func testViewWillAppear() {
    view?.viewWillAppear(true)
    XCTAssertTrue(presenter.isViewWillAppearCalled)
  }

  func testSearchBarTextDidChange() {
    view?.searchBar(UISearchBar(), textDidChange: "Text")
    XCTAssertTrue(presenter.isTextDidChangeCalled)
  }

  func testSearchBarCancelButtonPressed() {
    view?.searchBarCancelButtonClicked(UISearchBar())
    XCTAssertTrue(presenter.isSearchBarCancelButtonCalled)
  }
}
