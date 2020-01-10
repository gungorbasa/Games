//
//  FavoritesPresenter.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class FavoritesPresenter: FavoritesPresenterProtocol {

    private unowned let view: FavoritesViewProtocol

    private let interactor: FavoritesInteractorProtocol
    private let router: FavoritesRouterProtocol

    init(_ view: FavoritesViewProtocol, interactor: FavoritesInteractorProtocol, router: FavoritesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
}

extension FavoritesPresenter: FavoritesInteractorDelegate {

    func handleOutput(_ output: FavoritesInteractorOutput) {

    }
}
