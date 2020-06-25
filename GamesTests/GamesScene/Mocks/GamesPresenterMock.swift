//
//  GamesPresenterMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

final class GamesPresenterMock: GamesInteractorDelegate {

  var result: GamesInteractorOutput?

  func handleOutput(_ output: GamesInteractorOutput) {
    result = output
  }
}
