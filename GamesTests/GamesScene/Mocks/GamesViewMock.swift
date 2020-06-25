//
//  GamesViewMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

final class GamesViewMock: GamesViewProtocol {
  var result: GamesPresenterOutput?

  func handleOutput(_ output: GamesPresenterOutput) {
    result = output
  }
}
