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
    private let factory: GameCellFactoring

    init(
        _ view: GamesViewProtocol,
        interactor: GamesInteractorProtocol,
        router: GamesRouterProtocol,
        factory: GameCellFactoring
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.factory = factory
        self.interactor.delegate = self
    }

    func viewDidLoad() {
        view.handleOutput(.navigationBar(title: Localization.GamesScreen.title.translation))
        interactor.fetchGames()
    }

    func fetchMoreGames() {
        interactor.fetchMoreGames()
    }

    func searchBar(textDidChange searchText: String) {
        interactor.search(searchText)
    }
}

extension GamesPresenter: GamesInteractorDelegate {

    func handleOutput(_ output: GamesInteractorOutput) {
        switch output {
        case .fetch(let games):
            DispatchQueue.main.async {
                self.viewModels = self.factory.games(from: games)
                self.view.handleOutput(.reloadData)
            }
        case .fetchMore(let games):
            DispatchQueue.main.async {
                self.viewModels.append(contentsOf: self.factory.games(from: games))
                self.view.handleOutput(.reloadData)
            }
        case .show(let error):
            print(error.localizedDescription)
        }
    }
}
