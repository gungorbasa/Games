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
        let service = GameDetailsService()
        let database = UserDefaultsDatabase()
        let interactor = GameDetailsInteractor(service, database: database)
//        let interactor = GameDetailsInteractor(service)
        let presenter = GameDetailsPresenter(view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
