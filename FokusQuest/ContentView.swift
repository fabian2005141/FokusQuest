//
//  ContentView.swift
//  Productivity_Challenge
//
//  Created by Fabian Lackner on 01.12.25.
//
import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false

    var body: some View {
        NavigationStack {
            if !hasSeenOnboarding {
                OnboardingView {
                    hasSeenOnboarding = true
                }
            } else {
                MainMenuView()
            }
        }
    }
}

#Preview {
    ContentView()
}
