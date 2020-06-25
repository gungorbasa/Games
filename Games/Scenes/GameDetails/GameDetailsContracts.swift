//
//  GameDetailsContracts.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol GameDetailsInteractorProtocol: class {
  
  var delegate: GameDetailsInteractorDelegate? { get set }
  
  func gameDetails(for id: String)
  func favor(_ game: Game)
  func unfavor(_ game: Game)
  func isFavorited(_ game: Game) -> Bool
}

enum GameDetailsInteractorOutput {
  case details(GameDetails)
  case error(Error)
}

protocol GameDetailsInteractorDelegate: class {
  
  func handleOutput(_ output: GameDetailsInteractorOutput)
}

// MARK: - Presenter
protocol GameDetailsPresenterProtocol: class {
  
  var viewModels: [ReusableCellViewModel] { get }
  var game: Game! { get set }
  
  func onViewDidLoad()
  func onViewWillAppear()
  func onViewWillDisappear()
  func onDidSelectRow(_ indexPath: IndexPath)
  func favor()
  func unfavor()
}

enum GameDetailsPresenterOutput: Equatable {
  case reload
  case setHeader(GameDetailsHeaderViewModel)
  case showMessage(String)
}

// MARK: - View
protocol GameDetailsViewProtocol: class {
  
  func setRightBarButton(title: String, target: Any?, selector: Selector)
  func removeRightBarButtonItem()
  func handleOutput(_ output: GameDetailsPresenterOutput)
}

// MARK: - Router
enum GameDetailsRoute: Equatable {
  case safari(String)
}

protocol GameDetailsRouterProtocol: class {
  
  func navigate(to route: GameDetailsRoute)
}
