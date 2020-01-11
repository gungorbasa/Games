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

    init(_ view: GameDetailsViewProtocol, interactor: GameDetailsInteractorProtocol, router: GameDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
}

extension GameDetailsPresenter: GameDetailsInteractorDelegate {

    func handleOutput(_ output: GameDetailsInteractorOutput) {

    }
}
