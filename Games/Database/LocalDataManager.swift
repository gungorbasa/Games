//
//  LocalDataManager.swift
//  Games
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol Database {
  
  func add<T: Codable>(_ key: String, value: T)
  func remove(_ key: String)
  func update<T: Codable>(_ key: String, value: T)
  func get<T: Codable>(_ key: String) -> T?
}

final class UserDefaultsDatabase: Database {
  
  private let defaults: UserDefaults
  private let encoder: JSONEncoder
  private let decoder: JSONDecoder
  
  init(
    defaults: UserDefaults = UserDefaults.standard,
    encoder: JSONEncoder = JSONEncoder(),
    decoder: JSONDecoder = JSONDecoder()
  ) {
    self.defaults = defaults
    self.encoder = encoder
    self.decoder = decoder
  }
  
  func add<T: Codable>(_ key: String, value: T) {
    if let encoded = try? encoder.encode(value) {
      defaults.set(encoded, forKey: key)
    }
  }
  
  func remove(_ key: String) {
    defaults.removeObject(forKey: key)
  }
  
  func update<T: Codable>(_ key: String, value: T) {
    remove(key)
    add(key, value: value)
  }
  
  func get<T: Codable>(_ key: String) -> T? {
    if let data = defaults.object(forKey: key) as? Data {
      if let object = try? decoder.decode(T.self, from: data) {
        return object
      }
    }
    return nil
  }
}
