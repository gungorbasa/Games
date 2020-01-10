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
    @IBOutlet private weak var genreLabel: UILabel!

    func update(_ viewModel: Any?) {
        
    }
}
