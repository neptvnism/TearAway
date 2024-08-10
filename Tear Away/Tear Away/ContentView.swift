//
//  ContentView.swift
//  Tear Away
//
//  Created by Nadeen Ihab  on 09/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplashScreen = true

    var body: some View {
        if showSplashScreen {
            GIFPlayerView(gifName: "splashscreen", speed: 1.0) // Adjust speed here
                .edgesIgnoringSafeArea(.all)
                .background(Color.black)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.2) {
                        withAnimation {
                            showSplashScreen = false
                        }
                    }
                }
        } else {
            MainView()
        }
    }
}

struct MainView: View {
    var body: some View {
        Text("Welcome to the app!")
    }
}

#Preview {
    ContentView()
}
