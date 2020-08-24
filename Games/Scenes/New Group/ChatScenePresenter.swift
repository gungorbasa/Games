//
//  ChatScenePresenter.swift
//  Games
//
//  Created Gungor Basa on 6/29/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class ChatScenePresenter: ChatScenePresenterProtocol {

    private unowned let view: ChatSceneViewProtocol

    private let interactor: ChatSceneInteractorProtocol
    private let router: ChatSceneRouterProtocol

    init(_ view: ChatSceneViewProtocol, interactor: ChatSceneInteractorProtocol, router: ChatSceneRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
}

extension ChatScenePresenter: ChatSceneInteractorDelegate {

    func handleOutput(_ output: ChatSceneInteractorOutput) {

    }
}
