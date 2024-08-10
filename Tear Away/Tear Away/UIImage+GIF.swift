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

    static func gif(data: Data, speed: Double = 1.0) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

        var images = [UIImage]()
        var duration: TimeInterval = 0

        let count = CGImageSourceGetCount(source)

        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let frameDuration = UIImage.frameDuration(from: source, at: i)
                duration += frameDuration * speed // Adjust speed here
                let image = UIImage(cgImage: cgImage)
                images.append(image)
            }
        }

        return UIImage.animatedImage(with: images, duration: duration)
    }

    private static func frameDuration(from source: CGImageSource, at index: Int) -> TimeInterval {
        var frameDuration = 0.1

        let frameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any]
        let gifProperties = frameProperties?[kCGImagePropertyGIFDictionary as String] as? [String: Any]

        if let delayTimeUnclampedProp = gifProperties?[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double {
            frameDuration = delayTimeUnclampedProp
        } else if let delayTimeProp = gifProperties?[kCGImagePropertyGIFDelayTime as String] as? Double {
            frameDuration = delayTimeProp
        }

        // Some frame durations are too short, capping them
        if frameDuration < 0.1 {
            frameDuration = 0.1
        }

        return frameDuration
    }
}
