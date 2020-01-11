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

    private let service: GameListServing
    private let searchThreshold = 3

    init(_ service: GameListServing) {
        self.service = service
    }

    func search(_ text: String) {
        if text.count >= searchThreshold {
            
        }
    }

    func fetchGames() {
        service.fetch { [weak self] result in
            switch result {
            case .success(let games):
                self?.delegate?.handleOutput(.fetch(games))
            case .failure(let error):
                self?.delegate?.handleOutput(.show(error))
            }
        }
    }

    func fetchMoreGames() {
        service.fetchMore { [weak self] result in
            switch result {
            case .success(let games):
                self?.delegate?.handleOutput(.fetchMore(games))
            case .failure(let error):
                self?.delegate?.handleOutput(.show(error))
            }
        }
    }
}
