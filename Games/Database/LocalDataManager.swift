//
//  LocalDataManager.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol Database {

    func add(_ key: String, value: Codable)
    func remove(_ key: String)
    func update(_ key: String, value: Codable)
    func get<T: Codable>(_ key: String) -> T?
}

final class UserDefaultsDatabase {

    private let defaults = UserDefaults.standard

    func add(_ key: String, value: Codable) {
        defaults.set(value, forKey: key)
    }

    func remove(_ key: String) {
        defaults.removeObject(forKey: key)
    }

    func update(_ key: String, value: Codable) {
        remove(key)
        add(key, value: value)
    }

    func get<T: Codable>(_ key: String) -> T? {
        return defaults.object(forKey: key) as? T
    }
}
