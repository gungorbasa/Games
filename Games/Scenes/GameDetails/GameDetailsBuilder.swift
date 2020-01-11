//
//  GameDetailsBuilder.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GameDetailsBuilder {

    static func make() -> GameDetailsViewController {
        let storyboard = UIStoryboard(name: "GameDetails", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "GameDetailsViewController") as! GameDetailsViewController
        // TODO: Injections
        let router = GameDetailsRouter(view)
//        let networkWorker = NetworkWorker(app.networking)
//        let service = RestaurantListService(networkWorker, database: DbWorker(Database()))
//        //        MovieListInteractor(app.service)
        let interactor = GameDetailsInteractor()
//        let interactor = GameDetailsInteractor(service)
        let presenter = GameDetailsPresenter(view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
