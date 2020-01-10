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
        setup()
    }
}

private extension GamesViewController {
    func setup() {
        registerCell()
    }

    func registerCell() {
        tableView.register(cellType: GamesTableViewCell.self)
    }
}

extension GamesViewController: GamesViewProtocol {

    func handleOutput(_ output: GamesPresenterOutput) {

    }
}
