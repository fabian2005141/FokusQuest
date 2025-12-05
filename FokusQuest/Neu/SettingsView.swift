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
    @State private var appinfo: Bool = false

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: - App Einstelluingen
                    Text("App Einstellungen")
                        .font(.headline)
                        .foregroundColor(.schrift)

                    Button(action: {showResetAlert = true}) {
                            
                        SettingsButtonLabel(
                            text: "App zurücksetzen",
                            color: .buttonBackground,
                            textColor: .black
                        )
                    }

                    
                    
                    // MARK: - Über Uns
                    Text("Über uns")
                        .font(.headline)
                        .foregroundColor(.schrift)

                    Button(action: { appinfo = true }) {
                        SettingsButtonLabel(
                            text: "App Infos",
                            color: .buttonBackground,
                            textColor: .black
                        )
                    }
                    .sheet(isPresented: $appinfo) {
                        UeberUnsSheet(isPresented: $appinfo)
                            .presentationBackground(.white)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Einstellungen")
        
        .alert("Möchtest du die App wirklich zurücksetzen ?",
               isPresented: $showResetAlert
        ) {
            Button("Abbrechen", role: .cancel) { }
            Button("Zurücksetzen", role: .destructive) {
                completedChallengeIDsRaw = ""
                hasSeenOnboarding = false
            }
        } message: {
            Text("Alle Fortschritte gehen dabei verloren und die Quests werden zurückgesetzt")
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





//MARK: Über uns sheet

private struct UeberUnsSheet: View {
    @Binding var isPresented: Bool
    @Environment(\.openURL) private var openURL

    var body: some View {
        ZStack {
            Color(.sheetcolor).ignoresSafeArea()

            VStack {
                HStack {
                    Button(role: .cancel) {
                        self.isPresented.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.buttonBackground)
                            .padding(8)
                            .background(
                                Circle().fill(Color.white.opacity(0.001))
                            )
                            .bold()
                    }
                    .padding(20)

                    Spacer()
                }

                Spacer()
            }

            VStack(spacing: 16) {
                Text("Über diese App")
                    .font(.title2)
                    .foregroundStyle(.schrift)
                Spacer()
                Text("Wir sind Richard B. und Fabian L. und dies ist unser erstes iOS Projekt, das wir im Rahmen des Hackathon3.0 von Kevin Chromik innerhalb von sieben Tagen entwickelt haben. Wir würden uns über dein Feedback sehr freuen.")
                    .foregroundStyle(.schrift)
                Spacer()
                Button {
                    openFeedbackMail()
                } label: {
                    Text("Feedback senden")
                        .foregroundColor(.black)
                        .font(.body)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.buttonBackground)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }

    // MARK: - Helpers
    private func openFeedbackMail() {
        let to = "feedback.lacknerbruese@gmail.com"
        let subject = "Feedback zu FokusQuest"
        let body = """
        Hallo,

        ich habe Feedback zu eurer App:

        • Was mir gefällt:
        • Was verbessert werden könnte:

        Vielen Dank!
        """

        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        let urlString = "mailto:\(to)?subject=\(encodedSubject)&body=\(encodedBody)"

        if let url = URL(string: urlString) {
            openURL(url)
        }
    }
}
