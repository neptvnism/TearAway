//
//  ContentView.swift
//  Tear Away
//
//  Created by Nadeen Ihab  on 09/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                VideoPlayerView(videoName: "splash")
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjust the duration as needed
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                MainView() // Replace this with your main content view
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

