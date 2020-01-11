//
//  Cache.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import UIKit

protocol ImageCaching {
    func add(_ key: String, value: UIImage?)
    func image(for key: String) -> UIImage?
    func remove(_ key: String)
    func empty()
}

final class ImageCache {
    static let shared: ImageCache = ImageCache()

    private var cache: [String: UIImage?] = [:]

    func add(_ key: String, value: UIImage?) {
        cache[key] = value
    }

    func image(for key: String) -> UIImage? {
        return cache[key] ?? nil
    }

    func remove(_ key: String) {
        cache[key] = nil
    }

    func empty() {
        cache = [:]
    }
}
