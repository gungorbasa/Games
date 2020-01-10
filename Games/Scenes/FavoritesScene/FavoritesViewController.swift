//
//  FavoritesViewController.swift
//  Games
//
//  Created Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {

    var presenter: FavoritesPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

    }
}

extension FavoritesViewController: FavoritesViewProtocol {

    func handleOutput(_ output: FavoritesPresenterOutput) {

    }
}
