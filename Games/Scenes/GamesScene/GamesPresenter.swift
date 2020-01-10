//
//  GamesPresenter.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class GamesPresenter: GamesPresenterProtocol {

    var viewModels: [ReusableCellViewModel] = []

    private unowned let view: GamesViewProtocol

    private let interactor: GamesInteractorProtocol
    private let router: GamesRouterProtocol

    init(_ view: GamesViewProtocol, interactor: GamesInteractorProtocol, router: GamesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }

    func viewDidLoad() {
        view.handleOutput(.navigationBar(title: Localization.GamesScreen.title.translation))
        interactor.fetchGames()
    }

    func searchBar(textDidChange searchText: String) {
        interactor.search(searchText)
    }
}

extension GamesPresenter: GamesInteractorDelegate {

    func handleOutput(_ output: GamesInteractorOutput) {

    }
}
