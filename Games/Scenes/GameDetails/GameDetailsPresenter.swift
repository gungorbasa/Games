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
    private var isFavorited: Bool = false

    init(_ view: GameDetailsViewProtocol, interactor: GameDetailsInteractorProtocol, router: GameDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }

    func onViewDidLoad() {

    }

    func onViewWillAppear() {
        let title = isFavorited ?
            Localization.GameDetails.favorited.translation :
            Localization.GameDetails.favorite.translation
        let selector = isFavorited ? #selector(unfavor) : #selector(favor)

        view.setRightBarButton(
            title: title,
            target: self,
            selector: selector
        )
    }

    func onViewWillDisappear() {
        view.removeRightBarButtonItem()
    }

    @objc func favor() {

    }

    @objc func unfavor() {

    }
}

extension GameDetailsPresenter: GameDetailsInteractorDelegate {

    func handleOutput(_ output: GameDetailsInteractorOutput) {

    }
}
