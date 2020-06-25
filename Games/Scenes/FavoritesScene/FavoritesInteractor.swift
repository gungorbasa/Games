//
//  FavoritesInteractor.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class FavoritesInteractor: FavoritesInteractorProtocol {
  
  weak var delegate: FavoritesInteractorDelegate?
  
  private let database: Database
  private let favoritesPath = "Favorites"
  
  init(database: Database) {
    self.database = database
  }
  
  func fetchFavorites() {
    let games: [Game] = database.get(favoritesPath) ?? []
    delegate?.handleOutput(.favorites(games))
  }
  
  func removeFromFavorites(id: String) {
    let games: [Game] = database.get(favoritesPath) ?? []
    let result = games.filter { "\($0.id)" != id}
    database.add(favoritesPath, value: result)
  }
}
