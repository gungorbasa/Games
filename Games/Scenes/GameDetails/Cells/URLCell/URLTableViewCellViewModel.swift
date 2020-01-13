//
//  URLTableViewCellViewModel.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct URLTableViewCellViewModel: ReusableCellViewModel, Equatable {
    var cellType: ReusableCell.Type { return URLTableViewCell.self }

    let title: String
    let url: String
}
