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

    override func prepareForReuse() {
        super.prepareForReuse()
        // Also, need to cancel image download request as well
        gameImageView.image = nil
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
        guard let url = URL(string: viewModel.imageUrl) else { return }
        // For now I am just downloading the image
        // Reusing tableviewcell's need to be considered
        // so that we won't have weird behavior of imageview
        // need cahcing as well
        gameImageView.load(url: url)
    }
}
