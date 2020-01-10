//
//  Networking.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

import Foundation

protocol Networking {
    func run<T: Codable>(route: Routing, completion: @escaping (Result<T, Error>) -> ())
    func cancel()
}
