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
    public class func gif(data: Data?) -> UIImage? {
        guard let data = data else { return nil }

        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("Error: Could not create image source.")
            return nil
        }

        var images = [UIImage]()
        let count = CGImageSourceGetCount(source)
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))
            }
        }

        return UIImage.animatedImage(with: images, duration: Double(count) / 10.0) // Adjust duration for slower playback
    }
}
