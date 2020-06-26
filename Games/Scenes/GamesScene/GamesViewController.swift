//
//  GamesViewController.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GamesViewController: UIViewController {
  
  var presenter: GamesPresenterProtocol!
  
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var emptyLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
    setup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.onViewWillAppear()
    addSearchControllerIfNeeded()
  }
}

private extension GamesViewController {
  
  func setup() {
    setupTableView()
  }
  
  func setupTableView() {
    tableView.dataSource = self
    tableView.prefetchDataSource = self
    tableView.delegate = self
    tableView.register(cellType: GamesTableViewCell.self)
  }
  
  func addSearchControllerIfNeeded() {
    if tabBarController?.navigationItem.searchController == nil {
      let searchController = UISearchController(searchResultsController: nil)
      searchController.searchBar.delegate = self
      tabBarController?.navigationItem.searchController = searchController
    }
  }
  
  func setNavigationBar(_ title: String) {
    tabBarController?.navigationItem.title = title
  }
}

extension GamesViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    presenter.onSearchBar(textDidChange: searchText)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    presenter.onSearchBarCancelButtonClicked()
  }
}

extension GamesViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let viewModel = presenter.viewModelForRow(at: indexPath.item) else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCellOf(type: viewModel.cellType, for: indexPath)
    cell.update(viewModel)
    return cell as? UITableViewCell ?? UITableViewCell()
  }
}

extension GamesViewController: UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    presenter.onPrefetchRows(at: indexPaths)
  }
}

extension GamesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.onDidSelectRow(at: indexPath)
  }
}

extension GamesViewController: GamesViewProtocol {
  
  func handleOutput(_ output: GamesPresenterOutput) {
    switch output {
    case .navigationBar(let title):
      setNavigationBar(title)
    case .reloadData:
      tableView.reloadData()
    }
  }
}
