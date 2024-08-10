//
//  UIImage+GIF.swift
//  Tear Away
//
//  Created by Nadeen Ihab  on 10/08/2024.
//

import Foundation
import UIKit
import ImageIO

extension UIImage {
    class func gif(data: Data, speed: Double) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }

        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        var duration: TimeInterval = 0

        for i in 0..<count {
            guard let imageRef = CGImageSourceCreateImageAtIndex(source, i, nil) else {
                continue
            }

            let frameDuration = UIImage.frameDuration(at: i, source: source)
            duration += frameDuration
            let image = UIImage(cgImage: imageRef)
            images.append(image)
        }

        let adjustedDuration = duration / speed
        return UIImage.animatedImage(with: images, duration: adjustedDuration)
    }

    private class func frameDuration(at index: Int, source: CGImageSource) -> TimeInterval {
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let properties = cfProperties as? [String: Any]
        let gifProperties = properties?[kCGImagePropertyGIFDictionary as String] as? [String: Any]
        let delayTime = gifProperties?[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double ?? 0.1
        return delayTime
    }
}
