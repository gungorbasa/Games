//
//  UIImageView.swift
//  Games
//
//  Created by Gungor Basa on 1/11/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

extension UIImageView {

    func load(url: URL) {
        let size = bounds.size
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageIfAbsent: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height)
        ]
        DispatchQueue.global(qos: .userInitiated).async {
            guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
                let cgImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary) else {
                    return
            }

            DispatchQueue.main.async {
                self.image = UIImage(cgImage: cgImage)
            }
        }
    }
}
