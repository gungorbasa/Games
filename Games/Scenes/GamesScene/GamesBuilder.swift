//
//  GamesBuilder.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GamesBuilder {

    static func make() -> GamesViewController {
        let storyboard = UIStoryboard(name: "Games", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "GamesViewController") as! GamesViewController
        // TODO: Injections
        let router = GamesRouter(view)
        let service = GameListService()
        let searchService = GameSearchService()
//        let networkWorker = NetworkWorker(app.networking)
//        let service = RestaurantListService(networkWorker, database: DbWorker(Database()))
//        //        MovieListInteractor(app.service)
        let interactor = GamesInteractor(service, gameSearchService: searchService)
        let factory = GameCellFactory()
        let presenter = GamesPresenter(view, interactor: interactor, router: router, factory: factory)
        view.presenter = presenter
        return view
    }
}
