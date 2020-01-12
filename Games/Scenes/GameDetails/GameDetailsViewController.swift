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
        presenter.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            target: self,
            action: selector
        )
    }

    func removeRightBarButtonItem() {
        navigationItem.rightBarButtonItem = nil
    }
}

extension GameDetailsViewController: GameDetailsViewProtocol {

    func handleOutput(_ output: GameDetailsPresenterOutput) {

    }
}
