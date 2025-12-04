//
//  MainMenuView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack(spacing: 24) {
                Text("FokusQuest")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.schrift)
                
                Text("Hauptmenü")
                    .foregroundColor(.schrift2)
                    .multilineTextAlignment(.center)
                
                NavigationLink {
                    AktuelleChallengeView()
                } label: {
                    menuButtonLabel(text: "Aktuelle Challenge", systemImage: "flame.fill")
                }
                
                NavigationLink {
                    ErledigteChallengesView()
                } label: {
                    menuButtonLabel(text: "Bereits erledigte Challenges", systemImage: "checkmark.circle.fill")
                }
                
                NavigationLink {
                    SettingsView()
                } label: {
                    menuButtonLabel(text: "Einstellungen", systemImage: "gearshape.fill")
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    private func menuButtonLabel(text: String, systemImage: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.schrift)
            Text(text)
                .font(.headline)
                .foregroundColor(.schrift)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.orange))
        .cornerRadius(14)
    }
}
