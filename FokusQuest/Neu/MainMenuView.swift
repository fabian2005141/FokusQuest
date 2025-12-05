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
                    .padding(40)
                
                /*Text("Hauptmenü")
                    .foregroundColor(.schrift2)
                    .multilineTextAlignment(.center)
                */
                //Spacer()
                NavigationLink {
                    AktuelleChallengeView()
                } label: {
                    menuButtonLabel(text: "Aktuelle Quest", systemImage: "flame.fill")
                }.padding(.top, 100)
                
                NavigationLink {
                    ErledigteChallengesView()
                } label: {
                    menuButtonLabel(text: "Bereits erledigte Quests", systemImage: "checkmark.circle.fill")
                }
                
                NavigationLink {
                    SettingsView()
                } label: {
                    menuButtonLabel(text: "Einstellungen", systemImage: "gearshape.fill")
                }
                
                Spacer()
            }
            .padding()
            .foregroundColor(.black)
        }
    }
    
    private func menuButtonLabel(text: String, systemImage: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.black)
            Text(text)
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.buttonBackground)
        .cornerRadius(14)
    }
}

#Preview {
    MainMenuView()
}
