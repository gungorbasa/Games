//
//  GamesTableViewCellViewModel.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct GamesTableViewCellViewModel: ReusableCellViewModel, Equatable {
    var cellType: ReusableCell.Type { return GamesTableViewCell.self }
    
    let imageUrl: String
    let gameTitle: String
    let gameScore: Int?
    let gameGenres: String
}
