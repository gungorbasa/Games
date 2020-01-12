//
//  URLTableViewCellViewModel.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct URLTableViewCellViewModel: ReusableCellViewModel {
    let cellType: ReusableCell.Type = URLTableViewCell.self

    let title: String
}
