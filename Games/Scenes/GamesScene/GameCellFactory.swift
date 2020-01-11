//
//  GameCellFactory.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol GameCellFactoring {
    func games(from models: [Game]) -> [GamesTableViewCellViewModel]
}

struct GameCellFactory: GameCellFactoring {
    func games(from models: [Game]) -> [GamesTableViewCellViewModel] {
        return models.map { game(from: $0) }
    }

    func game(from model: Game) -> GamesTableViewCellViewModel {
        let genres = model.genres.map { $0.name }.joined(separator: ", ")
        return GamesTableViewCellViewModel(
            imageUrl: model.background_image,
            gameTitle: model.name,
            gameScore: model.metacritic,
            gameGenres: genres
        )
    }
}
