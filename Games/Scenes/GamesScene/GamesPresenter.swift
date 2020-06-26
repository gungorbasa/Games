//
//  GamesPresenter.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class GamesPresenter: GamesPresenterProtocol {

  enum ModelState {
    case list, search(String)
  }

  private var viewModels: [ReusableCellViewModel] = []

  private var games: [Game] = []

  private unowned let view: GamesViewProtocol

  private let interactor: GamesInteractorProtocol
  private let router: GamesRouterProtocol
  private let factory: GameCellFactoring
  private var state: ModelState = .list

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

  func onViewDidLoad() {
    interactor.fetchGames()
  }

  func onViewWillAppear() {
    view.handleOutput(.navigationBar(title: Localization.GamesScreen.title.translation))
  }

  func onPrefetchRows(at indexPaths: [IndexPath]) {
    let threshold = viewModels.count - 2
    guard (indexPaths.last?.row ?? 0 > threshold || indexPaths.first?.row ?? 0 > threshold) else { return }
    switch state {
    case .list:
      interactor.fetchMoreGames()
    case .search(let query):
      interactor.search(query)
    }
  }

  func onSearchBar(textDidChange searchText: String) {
    state = .search(searchText)
    interactor.search(searchText)
  }

  func onSearchBarCancelButtonClicked() {
    state = .list
    interactor.fetchGames()
  }

  func onDidSelectRow(at: IndexPath) {
    guard at.row < games.count else { return }
    router.navigate(to: .details(games[at.row]))
  }

  func numberOfRowsInSection() -> Int {
    return viewModels.count
  }

  func viewModelForRow(at index: Int) -> ReusableCellViewModel? {
    guard index < viewModels.count else { return nil }
    return viewModels[index]
  }
}

extension GamesPresenter: GamesInteractorDelegate {

  func handleOutput(_ output: GamesInteractorOutput) {
    DispatchQueue.main.async {
      switch output {
        case .fetch(let games):
          self.games = games
          self.viewModels = self.factory.games(from: games)
          self.view.handleOutput(.reloadData)
        case .fetchMore(let games):
          self.viewModels.append(contentsOf: self.factory.games(from: games))
          self.games.append(contentsOf: games)
          self.view.handleOutput(.reloadData)
        case .search(let games):
          self.games.append(contentsOf: games)
          self.viewModels = self.factory.games(from: games)
          self.view.handleOutput(.reloadData)
      case .show(let error):
        print(error.localizedDescription)
      }
    }
  }
}
