//
//  OnboardingView.swift
//  FokusQuest
//
//  Created by Richard Brüse & Fabian Lackner am 03.12.25.
//

import SwiftUI

struct OnboardingView: View {
    var onContinue: () -> Void
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                Spacer()
                
                Text("Willkommen bei FokusQuest")
                    .font(.title.bold())
                    .foregroundColor(.schrift)
                
                Text("""
Diese App ist dafür gedacht, dein innerliches Chaos zu ordnen, indem du dein äußerliches Chaos ordnest.

Wenn du alle Challenges abgeschlossen hast, wirst du dich (hoffentlich) etwas leichter und klarer fühlen.

Es ist dir überlassen, wie viel du heute machst. Denk daran: Morgen ist auch noch ein Tag – überfordere dich nicht.

Small steps -> big results.
""")
                .font(.body)
                .foregroundColor(.schrift2)
                
                Spacer()
                
                Button(action: onContinue) {
                    Text("Verstanden – lass uns starten!")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.buttonBackground)
                        .foregroundColor(.black)
                        .cornerRadius(14)
                }
            }
            .padding()
        }
    }
}

