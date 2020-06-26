//
//  GameDetailsPresenter.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class GameDetailsPresenter: GameDetailsPresenterProtocol {

  private unowned let view: GameDetailsViewProtocol

  private let interactor: GameDetailsInteractorProtocol
  private let router: GameDetailsRouterProtocol
  private var isFavorited: Bool {
    return self.interactor.isFavorited(game)
  }
  private let factory: GameDetailsFactoring

  private var viewModels: [ReusableCellViewModel] = []
  private var game: Game

  init(
    game: Game,
    view: GameDetailsViewProtocol,
    interactor: GameDetailsInteractorProtocol,
    router: GameDetailsRouterProtocol,
    factory: GameDetailsFactoring = GameDetailsFactory()
  ) {
    self.game = game
    self.view = view
    self.interactor = interactor
    self.router = router
    self.factory = factory
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.gameDetails(for: "\(game.id)")
  }

  func onViewWillAppear() {
    setFavoriteTitle()
  }

  private func setFavoriteTitle() {
    let title = isFavorited ?
      Localization.GameDetails.favorited.translation :
      Localization.GameDetails.favorite.translation
    let selector = isFavorited ? #selector(GameDetailsPresenter.unfavor) : #selector(GameDetailsPresenter.favor)

    view.setRightBarButton(
      title: title,
      target: self,
      selector: selector
    )
  }

  func onViewWillDisappear() {
    view.removeRightBarButtonItem()
  }

  func numberOfRowsIn(section: Int) -> Int {
    return viewModels.count
  }

  func viewModelForRow(at index: Int) -> ReusableCellViewModel? {
    return index < viewModels.count ? viewModels[index]: nil
  }

  func onDidSelectRow(_ indexPath: IndexPath) {
    guard viewModels.count > indexPath.row else { return }
    if let urlVM = viewModels[indexPath.row] as? URLTableViewCellViewModel {
      router.navigate(to: .safari(urlVM.url))
    }
  }

  @objc func favor() {
    interactor.favor(game)
    setFavoriteTitle()
  }

  @objc func unfavor() {
    interactor.unfavor(game)
    setFavoriteTitle()
  }
}

extension GameDetailsPresenter: GameDetailsInteractorDelegate {

  func handleOutput(_ output: GameDetailsInteractorOutput) {
    DispatchQueue.main.async {
      switch output {
      case .details(let details):
        self.viewModels = self.factory.cell(from: details)
        self.view.handleOutput(.setHeader(self.factory.headerView(from: details)))
        self.view.handleOutput(.reload)
      case .error(let error):
        self.view.handleOutput(.showMessage(error.localizedDescription))
      }
    }
  }
}
