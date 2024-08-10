//
//  GIFPlayerView.swift
//  Tear Away
//
//  Created by Nadeen Ihab  on 10/08/2024.
import SwiftUI
import UIKit

struct GIFPlayerView: UIViewRepresentable {
    let gifName: String
    let speed: Double

    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .black

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true

        if let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") {
            if let gifData = try? Data(contentsOf: gifURL) {
                if let gifImage = UIImage.gif(data: gifData, speed: speed) {
                    imageView.image = gifImage
                } else {
                    print("Error: Unable to create GIF image.")
                }
            } else {
                print("Error: Unable to load GIF data.")
            }
        } else {
            print("Error: GIF file \(gifName).gif not found in the bundle.")
        }

        containerView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])

        return containerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
