//
//  ChatSceneBuilder.swift
//  Games
//
//  Created Gungor Basa on 6/29/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class ChatSceneBuilder {

    static func make() -> ChatSceneViewController {
        let storyboard = UIStoryboard(name: "ChatScene", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ChatSceneViewController") as! ChatSceneViewController
        // TODO: Injections
        let router = ChatSceneRouter(view)
//        let networkWorker = NetworkWorker(app.networking)
//        let service = RestaurantListService(networkWorker, database: DbWorker(Database()))
//        //        MovieListInteractor(app.service)
        let interactor = ChatSceneInteractor()
//        let interactor = ChatSceneInteractor(service)
        let presenter = ChatScenePresenter(view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
