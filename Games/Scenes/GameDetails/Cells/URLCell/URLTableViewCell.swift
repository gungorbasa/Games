//
//  URLTableViewCell.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class URLTableViewCell: UITableViewCell, ReusableCell, NibLoadable {
  
  @IBOutlet weak var urlLabel: UILabel!
  
  func update(_ viewModel: Any?) {
    guard let viewModel = viewModel as? URLTableViewCellViewModel else { return }
    urlLabel.text = viewModel.title
  }
}
