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
}

enum GameDetailsInteractorOutput {

}

protocol GameDetailsInteractorDelegate: class {

    func handleOutput(_ output: GameDetailsInteractorOutput)
}

// MARK: - Presenter
protocol GameDetailsPresenterProtocol: class {

}

enum GameDetailsPresenterOutput: Equatable {

}

// MARK: - View
protocol GameDetailsViewProtocol: class {

    func handleOutput(_ output: GameDetailsPresenterOutput)
}

// MARK: - Router
enum GameDetailsRoute: Equatable {

}

protocol GameDetailsRouterProtocol: class {

    func navigate(to route: GameDetailsRoute)
}
