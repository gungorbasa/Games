//
//  ReusableTableViewCell.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

protocol ReusableCell: Reusable {
  func update(_ viewModel: Any?)
}
