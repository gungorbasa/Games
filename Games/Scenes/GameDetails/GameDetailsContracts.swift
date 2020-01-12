//
//  GameDetailsContracts.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol GameDetailsInteractorProtocol: class {

    var delegate: GameDetailsInteractorDelegate? { get set }

    func gameDetails(for id: String)
    func favor(_ game: Game)
    func unfavor(_ game: Game)
}

enum GameDetailsInteractorOutput {
    case details(GameDetails)
    case error(Error)
}

protocol GameDetailsInteractorDelegate: class {

    func handleOutput(_ output: GameDetailsInteractorOutput)
}

// MARK: - Presenter
protocol GameDetailsPresenterProtocol: class {

    var game: Game! { get set }

    func onViewDidLoad()
    func onViewWillAppear()
    func onViewWillDisappear()
}

enum GameDetailsPresenterOutput: Equatable {
    case reload
    case showMessage(String)
}

// MARK: - View
protocol GameDetailsViewProtocol: class {

    func setRightBarButton(title: String, target: Any?, selector: Selector)
    func removeRightBarButtonItem()
    func handleOutput(_ output: GameDetailsPresenterOutput)
}

// MARK: - Router
enum GameDetailsRoute: Equatable {

}

protocol GameDetailsRouterProtocol: class {

    func navigate(to route: GameDetailsRoute)
}
