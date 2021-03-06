//
//  GamesBuilder.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GamesBuilder {

  static func make() -> UIViewController {
    let storyboard = UIStoryboard(name: "Games", bundle: nil)
    let view = storyboard.instantiateViewController(withIdentifier: "GamesViewController") as! GamesViewController
    // TODO: Injections
    let router = GamesRouter(view)
    //      let service = GameListService(networking: AlamofireNetwork())
    let service = GameListService()
    let searchService = GameSearchService()
    let interactor = GamesInteractor(service, gameSearchService: searchService)
    let factory = GameCellFactory()
    let presenter = GamesPresenter(view, interactor: interactor, router: router, factory: factory)
    view.presenter = presenter
    return view
  }
}
