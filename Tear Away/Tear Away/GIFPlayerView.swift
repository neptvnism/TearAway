//
//  GIFPlayerView.swift
//  Tear Away
//
//  Created by Nadeen Ihab  on 10/08/2024.

import SwiftUI
import UIKit

struct GIFPlayerView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // Fit the GIF within the available space
        imageView.clipsToBounds = true // Clip any overflow

        if let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") {
            let gifData = try? Data(contentsOf: gifURL)
            let gifImage = UIImage.gif(data: gifData)
            imageView.image = gifImage
        } else {
            print("Error: GIF file \(gifName).gif not found in the bundle.")
        }

        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        // No additional updates needed
    }
}
