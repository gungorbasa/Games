//
//  FavoritesViewController.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var presenter: FavoritesPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tabBarController?.navigationItem.searchController = nil
    presenter.onViewWillAppear()
  }
  
  private func setup() {
    tableView.register(cellType: GamesTableViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension FavoritesViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfRowsIn(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let viewModel = presenter.viewModelForRow(at: indexPath.item) else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCellOf(type: viewModel.cellType, for: indexPath)
    cell.update(viewModel)
    return cell as? UITableViewCell ?? UITableViewCell()
  }
}

extension FavoritesViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.onDidSelectRow(at: indexPath)
  }
  
  func tableView(
    _ tableView: UITableView,
    commit editingStyle: UITableViewCell.EditingStyle,
    forRowAt indexPath: IndexPath
  ) {
    presenter.commit(editingStyle: editingStyle, forRowAt: indexPath)
  }
}

extension FavoritesViewController: FavoritesViewProtocol {
  
  func handleOutput(_ output: FavoritesPresenterOutput) {
    switch output {
    case .reload:
      tableView.reloadData()
    case .set(let title):
      tabBarController?.navigationItem.title = title
    }
  }
}
