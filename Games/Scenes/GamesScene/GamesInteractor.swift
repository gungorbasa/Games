//
//  GamesInteractor.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class GamesInteractor: GamesInteractorProtocol {
  
  weak var delegate: GamesInteractorDelegate?
  
  private let gameListService: GameListServing
  private let gameSearchService: GameSearchServing
  private let searchThreshold = 3
  
  init(_ gameListService: GameListServing, gameSearchService: GameSearchServing) {
    self.gameListService = gameListService
    self.gameSearchService = gameSearchService
  }
  
  func search(_ text: String) {
    if text.count >= searchThreshold {
      gameSearchService.fetch(text) { [weak self] result in
        switch result {
        case .success(let games):
          self?.delegate?.handleOutput(.search(games))
        case .failure(let error):
          self?.delegate?.handleOutput(.show(error))
        }
      }
    }
  }
  
  func fetchGames() {
    gameListService.fetch { [weak self] result in
      switch result {
      case .success(let games):
        self?.delegate?.handleOutput(.fetch(games))
      case .failure(let error):
        self?.delegate?.handleOutput(.show(error))
      }
    }
  }
  
  func fetchMoreGames() {
    gameListService.fetchMore { [weak self] result in
      switch result {
      case .success(let games):
        self?.delegate?.handleOutput(.fetchMore(games))
      case .failure(let error):
        self?.delegate?.handleOutput(.show(error))
      }
    }
  }
}
