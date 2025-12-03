//
//  OnboardingView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
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
                
                Text("Willkommen zur Productivity Challenge")
                    .font(.title.bold())
                
                Text("""
Diese App ist dafür gedacht, dein innerliches Chaos zu ordnen, indem du dein äußerliches Chaos ordnest.

Wenn du alle Challenges abgeschlossen hast, wirst du dich (hoffentlich) etwas leichter und klarer fühlen.

Es ist dir überlassen, wie viel du heute machst. Denk daran: Morgen ist auch noch ein Tag – überfordere dich nicht.

Small steps -> big results.
""")
                .font(.body)
                .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: onContinue) {
                    Text("Verstanden – lass uns starten!")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.black)
                        .cornerRadius(14)
                }
            }
            .padding()
        }
    }
}
