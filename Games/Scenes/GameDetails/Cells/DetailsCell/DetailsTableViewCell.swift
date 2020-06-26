//
//  DetailsTableViewCell.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class DetailsTableViewCell: UITableViewCell, ReusableCell, NibLoadable {
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var detailsLabel: UILabel!

  func update(_ viewModel: Any?) {
    guard let viewModel = viewModel as? DetailsTableViewCellViewModel else { return }
    titleLabel.text = viewModel.title
    detailsLabel.text = viewModel.description
  }
}
