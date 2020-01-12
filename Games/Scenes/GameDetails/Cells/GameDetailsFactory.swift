//
//  GameDetailsFactory.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol GameDetailsFactoring {

}

struct GameDetailsFactory: GameDetailsFactoring {
    func cell(from details: GameDetails) -> [ReusableCellViewModel] {
        var viewModels: [ReusableCellViewModel] = [
            detailsCell(details.name, description: details.description_raw ?? "")
        ]

        if details.reddit_url != nil {
            viewModels.append(urlCell(Localization.GameDetails.visitReddit.translation))
        }
        if details.website != nil {
            viewModels.append(urlCell(Localization.GameDetails.visitWebsite.translation))
        }

        return viewModels
    }
}

private extension GameDetailsFactory {
    func detailsCell(_ title: String, description: String) -> ReusableCellViewModel {
        return DetailsTableViewCellViewModel(title: title, description: description)
    }

    func urlCell(_ title: String) -> ReusableCellViewModel {
        return URLTableViewCellViewModel(title: title)
    }
}
