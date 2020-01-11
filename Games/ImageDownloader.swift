//
//  ImageDownloader.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class ImageDownloader {
    static let shared: ImageDownloader = ImageDownloader(cache: ImageCache.shared)

    private let cache: ImageCache

    init(cache: ImageCache) {
        self.cache = cache
    }

    func download(from urlString: String, size: CGSize) -> UIImage? {
        if let image = cache.image(for: urlString) {
            return image
        }
        guard let url = URL(string: urlString) else { return nil }
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageIfAbsent: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height)
        ]
        guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let cgImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary) else {
                return nil
        }
        let image = UIImage(cgImage: cgImage)
        cache.add(urlString, value: image)
        return image
    }
}
