//
//  FavoritesPresenter.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import UIKit

final class FavoritesPresenter: FavoritesPresenterProtocol {
  
  private unowned let view: FavoritesViewProtocol
  
  private let interactor: FavoritesInteractorProtocol
  private let router: FavoritesRouterProtocol
  // This should be injected with a protocol
  private let factory = GameCellFactory()
  
  var viewModels: [ReusableCellViewModel] = []
  var games: [Game] = []
  
  init(_ view: FavoritesViewProtocol, interactor: FavoritesInteractorProtocol, router: FavoritesRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.interactor.delegate = self
  }
  
  func onViewWillAppear() {
    interactor.fetchFavorites()
  }
  
  func onDidSelectRow(at: IndexPath) {
    router.navigate(to: .details(games[at.row]))
  }
  
  func commit(editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      guard indexPath.row < games.count else { return }
      let game = games[indexPath.row]
      interactor.removeFromFavorites(id: "\(game.id)")
      interactor.fetchFavorites()
    }
  }
}

extension FavoritesPresenter: FavoritesInteractorDelegate {
  
  func handleOutput(_ output: FavoritesInteractorOutput) {
    DispatchQueue.main.async {
      switch output {
      case .favorites(let games):
        self.games = games
        self.viewModels = self.factory.games(from: games)
        self.view.handleOutput(.reload)
        let countString = games.count == 0 ? "" : " \(games.count)"
        self.view.handleOutput(.set(title: "\(Localization.Favorites.favorites.translation)\(countString)"))
      }
    }
    
  }
}
