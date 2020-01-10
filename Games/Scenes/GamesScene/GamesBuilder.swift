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
//        let networkWorker = NetworkWorker(app.networking)
//        let service = RestaurantListService(networkWorker, database: DbWorker(Database()))
//        //        MovieListInteractor(app.service)
        let interactor = GamesInteractor()
//        let interactor = GamesInteractor(service)
        let presenter = GamesPresenter(view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}