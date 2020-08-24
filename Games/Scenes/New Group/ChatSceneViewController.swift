//
//  ChatSceneViewController.swift
//  Games
//
//  Created Gungor Basa on 6/29/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class ChatSceneViewController: UIViewController {

    var presenter: ChatScenePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

    }
}

extension ChatSceneViewController: ChatSceneViewProtocol {

    func handleOutput(_ output: ChatScenePresenterOutput) {

    }
}
