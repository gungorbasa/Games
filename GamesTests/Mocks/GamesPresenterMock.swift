//
//  GamesPresenterMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

@testable import Games

final class GamesPresenterMock: GamesPresenterProtocol {

    var viewModels: [ReusableCellViewModel] = []

    var viewDidLoadIsCalled = false
    var fetchMoreGamesIsCalled = false
    var searchIsCalled = false

    func onViewDidLoad() {

    }

    func onPrefetchRows() {

    }

    func onSearchBar(textDidChange searchText: String) {

    }

    func onSearchBarCancelButtonClicked() {

    }

    func onDidSelectRow() {
        
    }
}
