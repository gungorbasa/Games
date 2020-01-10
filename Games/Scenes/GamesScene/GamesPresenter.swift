//
//  GamesPresenter.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class GamesPresenter: GamesPresenterProtocol {

    private unowned let view: GamesViewProtocol

    private let interactor: GamesInteractorProtocol
    private let router: GamesRouterProtocol

    init(_ view: GamesViewProtocol, interactor: GamesInteractorProtocol, router: GamesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
}

extension GamesPresenter: GamesInteractorDelegate {

    func handleOutput(_ output: GamesInteractorOutput) {

    }
}
