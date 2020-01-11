//
//  GamesTableViewCell.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GamesTableViewCell: UITableViewCell, ReusableCell, NibLoadable {
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameTitleLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!

    private var workItem: DispatchWorkItem?

    override func prepareForReuse() {
        super.prepareForReuse()
        gameImageView.image = nil
        workItem?.cancel()
        workItem = nil
    }

    func update(_ viewModel: Any?) {
        guard let viewModel = viewModel as? GamesTableViewCellViewModel else { return }
        gameTitleLabel.text = viewModel.gameTitle
        genreLabel.text = viewModel.gameGenres
        if let score = viewModel.gameScore {
            metacriticLabel.text = "\(Localization.GamesScreen.critic.translation):"
            scoreLabel.text = "\(score)"
            metacriticLabel.isHidden = false
            scoreLabel.isHidden = false
        } else {
            metacriticLabel.isHidden = true
            scoreLabel.isHidden = true
        }
        setImage(url: viewModel.imageUrl)
    }

    private func setImage(url: String) {
        let size = bounds.size
        let workItem = DispatchWorkItem(qos: .userInitiated, block: {
            let image = ImageDownloader.shared.download(from: url, size: size)
            DispatchQueue.main.async {
                self.gameImageView.image = image
            }
        })
        self.workItem = workItem
        DispatchQueue.global(qos: .userInitiated).async(execute: workItem)
    }
}
