//
//  GameDetailsHeaderViewViewModel.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct GameDetailsHeaderViewModel: ReusableCellViewModel, Equatable {
    var cellType: ReusableCell.Type { return GameDetailsHeaderView.self }

    let url: String?
    let title: String
}
