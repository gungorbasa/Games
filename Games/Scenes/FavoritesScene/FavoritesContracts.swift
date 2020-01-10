//
//  FavoritesContracts.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol FavoritesInteractorProtocol: class {

    var delegate: FavoritesInteractorDelegate? { get set }
}

enum FavoritesInteractorOutput {

}

protocol FavoritesInteractorDelegate: class {

    func handleOutput(_ output: FavoritesInteractorOutput)
}

// MARK: - Presenter
protocol FavoritesPresenterProtocol: class {

}

enum FavoritesPresenterOutput: Equatable {

}

// MARK: - View
protocol FavoritesViewProtocol: class {

    func handleOutput(_ output: FavoritesPresenterOutput)
}

// MARK: - Router
enum FavoritesRoute: Equatable {

}

protocol FavoritesRouterProtocol: class {

    func navigate(to route: FavoritesRoute)
}
