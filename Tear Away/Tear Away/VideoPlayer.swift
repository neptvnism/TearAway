//
//  VideoPlayer.swift
//  Tear Away
//
//  Created by Nadeen Ihab  on 09/08/2024.
//

import Foundation
import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoName: String

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        let player = AVPlayer(url: Bundle.main.url(forResource: Splashscreen.mp4, withExtension: "mp4")!)
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
