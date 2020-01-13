//
//  FavoritesContracts.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Interactor
protocol FavoritesInteractorProtocol: class {

    var delegate: FavoritesInteractorDelegate? { get set }

    func fetchFavorites()
    func removeFromFavorites(id: String)
}

enum FavoritesInteractorOutput {

    case favorites([Game])
}

protocol FavoritesInteractorDelegate: class {

    func handleOutput(_ output: FavoritesInteractorOutput)
}

// MARK: - Presenter
protocol FavoritesPresenterProtocol: class {

    var viewModels: [ReusableCellViewModel] { get }

    func onViewWillAppear()
    func onDidSelectRow(at: IndexPath)
    func commit(editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
}

enum FavoritesPresenterOutput: Equatable {
    case reload
    case set(title: String)
}

// MARK: - View
protocol FavoritesViewProtocol: class {

    func handleOutput(_ output: FavoritesPresenterOutput)
}

// MARK: - Router
enum FavoritesRoute: Equatable {
    case details(Game)
}

protocol FavoritesRouterProtocol: class {

    func navigate(to route: FavoritesRoute)
}
