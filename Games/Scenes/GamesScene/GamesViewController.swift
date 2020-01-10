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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

    }
}

extension GamesViewController: GamesViewProtocol {

    func handleOutput(_ output: GamesPresenterOutput) {

    }
}
