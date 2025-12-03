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
                    
                    // MARK: - Über Uns
                    Text("Über uns")
                        .font(.headline)

                    Button(action: { appinfo = true }) {
                        SettingsButtonLabel(
                            text: "App Infos",
                            color: Color.orange,
                            textColor: .black
                        ).sheet(isPresented: $appinfo){
                            UeberUnsSheet(isPresented: $appinfo)
                        }
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


#Preview{
    SettingsView()
}


//MARK: Über uns sheet

private struct UeberUnsSheet: View {
    @Binding var isPresented: Bool
    
    var body: some View {
            
        ZStack{
            VStack{
                
                HStack{
                    
                    Button("Exit"){
                        self.isPresented.toggle()
                    }.padding(20)
                    Spacer()
                }
                Spacer()
            }
            Text("Über uns Text ... / Über app")
        }
        
        
        
    }
}
