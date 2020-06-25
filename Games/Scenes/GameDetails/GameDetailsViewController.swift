//
//  GameDetailsViewController.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GameDetailsViewController: UIViewController {

  @IBOutlet private  weak var tableView: UITableView!

  private let headerView = GameDetailsHeaderView.loadFromNib()

  var presenter: GameDetailsPresenterProtocol!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableHeaderView = headerView
    presenter.onViewDidLoad()
    setupTableView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.largeTitleDisplayMode = .never
    presenter.onViewWillAppear()
  }

  override func viewWillDisappear(_ animated: Bool) {
    presenter.onViewWillDisappear()
    super.viewWillDisappear(animated)
  }

  func setRightBarButton(title: String, target: Any?, selector: Selector) {
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: title,
      style: .plain,
      target: target,
      action: selector
    )
  }

  func removeRightBarButtonItem() {
    navigationItem.rightBarButtonItem = nil
  }

  private func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(cellType: DetailsTableViewCell.self)
    tableView.register(cellType: URLTableViewCell.self)
  }
}

extension GameDetailsViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.viewModels.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard presenter.viewModels.count > indexPath.row else { return UITableViewCell() }
    let viewModel = presenter.viewModels[indexPath.row]
    let cell = tableView.dequeueReusableCellOf(type: viewModel.cellType, for: indexPath)
    cell.update(viewModel)
    return cell as? UITableViewCell ?? UITableViewCell()
  }
}

extension GameDetailsViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.onDidSelectRow(indexPath)
  }
}

extension GameDetailsViewController: GameDetailsViewProtocol {

  func handleOutput(_ output: GameDetailsPresenterOutput) {
    switch output {
    case .reload:
      tableView.reloadData()
    case .setHeader(let viewModel):
      headerView.update(viewModel)
    default:
      print("")
    }
  }
}
