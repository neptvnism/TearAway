//
//  ContentView.swift
//  Tear Away
//
//  Created by Nadeen Ihab  on 09/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            GIFPlayerView(gifName: "splashscreen")
                .frame(width: geometry.size.width, height: geometry.size.height)
                .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen
        }
    }
}

#Preview {
    ContentView()
}
