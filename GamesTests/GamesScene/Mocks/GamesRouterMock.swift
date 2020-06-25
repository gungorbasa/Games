//
//  GamesRouterMock.swift
//  GamesTests
//
//  Created by Gungor Basa on 6/25/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Games

final class GamesRouterMock: GamesRouterProtocol {
  var navigatedTo: GamesRoute!

  func navigate(to route: GamesRoute) {
    navigatedTo = route
  }
}
