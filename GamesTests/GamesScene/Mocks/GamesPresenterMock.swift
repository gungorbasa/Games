//
//  GamesPresenterMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

final class GamesPresenterMock: GamesPresenterProtocol {

  var result: GamesInteractorOutput?
  var isViewDidLoadCalled = false
  var isViewWillAppearCalled = false
  var isPrefetchRowsCalled = false
  var isTextDidChangeCalled = false
  var isSearchBarCancelButtonCalled = false
  var isDidSelectRowCalled = false
  var isNumberOfRowsInSectionCalled = false
  var isViewModelForRowCalled = false

  func onViewDidLoad() {
    isViewDidLoadCalled = true
  }

  func onViewWillAppear() {
    isViewWillAppearCalled = true
  }

  func onPrefetchRows(at indexPath: [IndexPath]) {
    isPrefetchRowsCalled = true
  }

  func onSearchBar(textDidChange searchText: String) {
    isTextDidChangeCalled = true
  }

  func onSearchBarCancelButtonClicked() {
    isSearchBarCancelButtonCalled = true
  }

  func onDidSelectRow(at: IndexPath) {
    isDidSelectRowCalled = true
  }

  func numberOfRowsInSection() -> Int {
    isNumberOfRowsInSectionCalled = true
    return 0
  }

  func viewModelForRow(at index: Int) -> ReusableCellViewModel? {
    isViewWillAppearCalled = true
    return nil
  }
}

extension GamesPresenterMock: GamesInteractorDelegate {
  func handleOutput(_ output: GamesInteractorOutput) {
    result = output
  }
}
