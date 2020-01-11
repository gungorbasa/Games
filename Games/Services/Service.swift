//
//  Service.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol Service {
    associatedtype T: Codable

    func fetch(_ completion: @escaping (Result<T, Error>) -> Void)
}

protocol PaginatableService: Service {
    func fetchMore(_ completion: @escaping (Result<T, Error>) -> Void)
}
