//
//  GamesContracts.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol GamesInteractorProtocol: class {

    var delegate: GamesInteractorDelegate? { get set }
}

enum GamesInteractorOutput {

}

protocol GamesInteractorDelegate: class {

    func handleOutput(_ output: GamesInteractorOutput)
}

// MARK: - Presenter
protocol GamesPresenterProtocol: class {

}

enum GamesPresenterOutput: Equatable {

}

// MARK: - View
protocol GamesViewProtocol: class {

    func handleOutput(_ output: GamesPresenterOutput)
}

// MARK: - Router
enum GamesRoute: Equatable {

}

protocol GamesRouterProtocol: class {

    func navigate(to route: GamesRoute)
}
