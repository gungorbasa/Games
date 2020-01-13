//
//  GameDetailsFactory.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol GameDetailsFactoring {

    func headerView(from details: GameDetails) -> GameDetailsHeaderViewModel
    func cell(from details: GameDetails) -> [ReusableCellViewModel]
}

struct GameDetailsFactory: GameDetailsFactoring {
    func headerView(from details: GameDetails) -> GameDetailsHeaderViewModel {
        return GameDetailsHeaderViewModel(url: details.background_image, title: details.name)
    }

    func cell(from details: GameDetails) -> [ReusableCellViewModel] {
        var viewModels: [ReusableCellViewModel] = [
            detailsCell(details.name, description: details.description_raw ?? "")
        ]

        if let reddit = details.reddit_url {
            viewModels.append(urlCell(Localization.GameDetails.visitReddit.translation, url: reddit))
        }
        if let website = details.website {
            viewModels.append(urlCell(Localization.GameDetails.visitWebsite.translation, url: website))
        }

        return viewModels
    }
}

private extension GameDetailsFactory {
    func detailsCell(_ title: String, description: String) -> ReusableCellViewModel {
        return DetailsTableViewCellViewModel(title: title, description: description)
    }

    func urlCell(_ title: String, url: String) -> ReusableCellViewModel {
        return URLTableViewCellViewModel(title: title, url: url)
    }
}
