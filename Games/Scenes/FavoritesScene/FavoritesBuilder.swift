//
//  FavoritesBuilder.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class FavoritesBuilder {

    static func make() -> FavoritesViewController {
        let storyboard = UIStoryboard(name: "Favorites", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
        // TODO: Injections
        let router = FavoritesRouter(view)
        let database = UserDefaultsDatabase()
        let interactor = FavoritesInteractor(database: database)
        let presenter = FavoritesPresenter(view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
