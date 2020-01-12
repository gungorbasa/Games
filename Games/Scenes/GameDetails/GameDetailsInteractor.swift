//
//  GameDetailsInteractor.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class GameDetailsInteractor: GameDetailsInteractorProtocol {

    weak var delegate: GameDetailsInteractorDelegate?
    private let service: GameDetailsServing
    private let database: Database
    private let favoritesKey: String = "Favorites"

    init(_ service: GameDetailsServing, database: Database) {
        self.service = service
        self.database = database
    }

    func gameDetails(for id: String) {
        service.fetch(details: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let details):
                self.delegate?.handleOutput(.details(details))
            case .failure(let error):
                self.delegate?.handleOutput(.error(error))
            }
        }
    }

    func favor(_ game: Game) {
        var favorites: [Game] = database.get(favoritesKey) ?? []
        favorites.append(game)
        database.add(favoritesKey, value: favorites)
    }

    func unfavor(_ game: Game) {
        let favorites: [Game] = database.get(favoritesKey) ?? []
        let removed = favorites.filter { $0.id != game.id }
        database.remove(favoritesKey)
        database.add(favoritesKey, value: removed)
    }
}
