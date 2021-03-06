//
//  GamesContracts.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol GamesInteractorProtocol: class {
  
  var delegate: GamesInteractorDelegate? { get set }
  
  func search(_ text: String)
  func fetchGames()
  func fetchMoreGames()
}

enum GamesInteractorOutput {
  case fetch(_ games: [Game])
  case fetchMore(_ games: [Game])
  case search(_ games: [Game])
  case show(_ error: Error)
}

protocol GamesInteractorDelegate: class {
  
  func handleOutput(_ output: GamesInteractorOutput)
}

// MARK: - Presenter
protocol GamesPresenterProtocol: class {
  
  func onViewDidLoad()
  func onViewWillAppear()
  func onPrefetchRows(at indexPath: [IndexPath])
  func onSearchBar(textDidChange searchText: String)
  func onSearchBarCancelButtonClicked()
  func onDidSelectRow(at: IndexPath)

  func numberOfRowsInSection() -> Int
  func viewModelForRow(at index: Int) -> ReusableCellViewModel?
}

enum GamesPresenterOutput: Equatable {
  case navigationBar(title: String)
  case reloadData
}

// MARK: - View
protocol GamesViewProtocol: class {
  
  func handleOutput(_ output: GamesPresenterOutput)
}

// MARK: - Router
enum GamesRoute: Equatable {
  case details(Game)
}

protocol GamesRouterProtocol: class {
  
  func navigate(to route: GamesRoute)
}
