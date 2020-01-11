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
}

private extension GamesViewController {
    
    func setup() {
        addSearchController()
        setupTableView()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(cellType: GamesTableViewCell.self)
    }

    func addSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        tabBarController?.navigationItem.searchController = searchController
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

extension GamesViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let threshold = presenter.viewModels.count - 2
        if indexPaths.last?.row ?? 0 > threshold || indexPaths.first?.row ?? 0 > threshold {
            presenter.onPrefetchRows()
        }
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
