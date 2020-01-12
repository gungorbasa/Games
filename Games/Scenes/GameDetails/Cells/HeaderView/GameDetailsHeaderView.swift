//
//  GameDetailsHeaderView.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class GameDetailsHeaderView: UIView, NibLoadable, ReusableCell {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerTitleLabel: UILabel!

    func update(_ viewModel: Any?) {
        guard let viewModel = viewModel as? GameDetailsHeaderViewModel else { return }
        setImage(url: viewModel.url ?? "")
        headerTitleLabel.text = viewModel.title
    }

    private func setImage(url: String) {
        let size = bounds.size
        DispatchQueue.global(qos: .userInitiated).async {
            let image = ImageDownloader.shared.download(from: url, size: size)
            DispatchQueue.main.async {
                self.headerImageView.image = image
            }
        }
    }
}
