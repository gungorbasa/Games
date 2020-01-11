//
//  GameDetailsViewController.swift
//  Games
//
//  Created Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GameDetailsViewController: UIViewController {

    var presenter: GameDetailsPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

    }
}

extension GameDetailsViewController: GameDetailsViewProtocol {

    func handleOutput(_ output: GameDetailsPresenterOutput) {

    }
}
