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

    private let searchThreshold = 3

    func search(_ text: String) {
        if text.count >= searchThreshold {

        }
    }

    func fetchGames() {

    }

    func fetchMoreGames() {
        
    }
}
