//
//  GameDetailsHeaderView.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit
import Nuke

final class GameDetailsHeaderView: UIView, NibLoadable, ReusableCell {
  
  @IBOutlet weak var headerImageView: UIImageView!
  @IBOutlet weak var headerTitleLabel: UILabel!
  
  func update(_ viewModel: Any?) {
    guard let viewModel = viewModel as? GameDetailsHeaderViewModel else { return }
    headerTitleLabel.text = viewModel.title
    guard let url = URL(string: viewModel.url ?? "") else { return }
    Nuke.loadImage(with: url, into: headerImageView)
  }
}
