//
//  AktuelleChallengeView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI

struct AktuelleChallengeView: View {
    @AppStorage("completedChallengeIDs") private var completedChallengeIDsRaw: String = ""
    
    private var completedIDs: Set<Int> {
        decodeCompletedIDs(from: completedChallengeIDsRaw)
    }
    
    private func markCompleted(_ challenge: ChallengeModel) {
        var ids = completedIDs
        ids.insert(challenge.id)
        completedChallengeIDsRaw = encodeCompletedIDs(ids)
    }
    
    private var nextChallenge: ChallengeModel? {
        allChallenges.first { !completedIDs.contains($0.id) }
    }
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                
                .ignoresSafeArea()
            Group {
                if let challenge = nextChallenge {
                    VStack(spacing: 16) {
                        ChallengeDetailView(challenge: challenge)
                           
                        
                        Button(action: { markCompleted(challenge) }) {
                            Text("Challenge erledigt")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.schrift)
                                .cornerRadius(14)
                        }
                        .padding(.horizontal)
                    }
                } else {
                    VStack(spacing: 16) {
                        Text("Alle Challenges erledigt 🎉")
                            .font(.title2.bold())
                            .foregroundColor(.schrift)
                        Text("Du hast das komplette Programm abgeschlossen. Wenn du möchtest, kannst du in den Einstellungen alles zurücksetzen und von vorne beginnen.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.schrift2)
                    }
                    .padding()
                }
            }
            .navigationTitle("Aktuelle Challenge")
            
        }
    }
}
