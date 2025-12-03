//
//  SettingsView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//
import SwiftUI

struct SettingsView: View {
    @AppStorage("completedChallengeIDs") private var completedChallengeIDsRaw: String = ""
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = true
    @State private var showResetAlert = false

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: - Fortschritt
                    Text("Fortschritt")
                        .font(.headline)

                    Button(action: { showResetAlert = true }) {
                        SettingsButtonLabel(
                            text: "Fortschritt zurücksetzen",
                            color: Color.orange,
                            textColor: .black
                        )
                    }

                    // MARK: - Onboarding
                    Text("Onboarding")
                        .font(.headline)

                    Button(action: {
                        hasSeenOnboarding = false
                    }) {
                        SettingsButtonLabel(
                            text: "...beim nächsten Start wieder anzeigen",
                            color: Color.orange,
                            textColor: .black
                        )
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Einstellungen")
        .alert("Fortschritt wirklich zurücksetzen?",
               isPresented: $showResetAlert
        ) {
            Button("Abbrechen", role: .cancel) { }
            Button("Zurücksetzen", role: .destructive) {
                completedChallengeIDsRaw = ""
            }
        } message: {
            Text("Alle Challenges werden wieder als „offen“ markiert.")
        }
    }
}

struct SettingsButtonLabel: View {
    let text: String
    let color: Color
    let textColor: Color

    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.body)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(color)
            .cornerRadius(12)
            .shadow(radius: 0)
    }
}
