//
//  AktuelleChallengeView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI

struct AktuelleChallengeView: View {
    @AppStorage("completedChallengeIDs") private var completedChallengeIDsRaw: String = ""

    @State private var showKonfetti = false
    @State private var feedbackToggle = false
    @State private var didShowFinalCelebration = false

    // MARK: - Fortschritt

    private var completedIDs: Set<Int> {
        let ids = completedChallengeIDsRaw
            .split(separator: ",")
            .compactMap { Int($0) }
        return Set(ids)
    }

    /// Nächste offene Challenge (oder nil, wenn alle erledigt)
    private var nextChallenge: ChallengeModel? {
        allChallenges.first { !completedIDs.contains($0.id) }
    }

    /// Alle Quests erledigt, wenn jede Challenge-ID in `completedIDs` steckt
    private var allCompleted: Bool {
        !allChallenges.isEmpty && allChallenges.allSatisfy { completedIDs.contains($0.id) }
    }

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()

            VStack {
                if allCompleted {
                    // MARK: – Alle Quests erledigt (glasiger Kasten mittig)
                    VStack {
                        Spacer()

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Alle Quests erledigt! 🎉")
                                .font(.title2.bold())
                                .multilineTextAlignment(.center)
                                .foregroundColor(.schrift)
                                .padding(.bottom, 20)

                            Text("""
                            Hey, super – du hast alle Quests abgeschlossen!

                            Wenn du magst, kannst du in den Einstellungen deinen Fortschritt zurücksetzen und von vorne beginnen.

                            Denk daran: Ordnung im Außen hilft deinem Inneren, ruhiger und klarer zu werden. Du darfst stolz auf dich sein.
                            """)
                            .onAppear {
                                if !didShowFinalCelebration {
                                    startFinalCelebration()
                                }
                            }
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.schrift2)
                            .font(.body)
                        }
                        .padding(24)
                        .frame(maxWidth: .infinity)
                        .background(
                            // Glas-Effekt
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .fill(.ultraThinMaterial) // Glasiger, durchscheinender Look
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .stroke(Color.white.opacity(0.40), lineWidth: 1)
                        )
                        .shadow(radius: 10)
                        .padding(.horizontal, 24)

                        Spacer()
                    }
                    .onAppear {
                        if !didShowFinalCelebration {
                            startFinalCelebration()
                        }
                    }

                } else if let challenge = nextChallenge {
                    // MARK: – Es gibt noch eine Quest
                    ScrollView {
                        ChallengeDetailView(challenge: challenge)
                            .padding(.bottom, 24)
                    }
                    Button {
                        feedbackToggle.toggle()
                        SoundManager.shared.playSuccess()
                        handleChallengeCompleted(challenge)
                    } label: {
                        Text("Quest erledigt")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("ButtonBackground"))
                            .foregroundColor(.black)
                            .cornerRadius(14)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    .sensoryFeedback(
                        .impact(flexibility: .rigid, intensity: 2.0),
                        trigger: feedbackToggle
                    )
                } else {
                    // Sicherheits-Fallback, falls etwas schiefgeht
                    Text("Keine Quests gefunden. Prüfe deine Challenges-Liste.")
                        .padding()
                        .foregroundColor(.schrift2)
                }
            }

            // Konfetti-Overlay für normale und finale Celebration
            if showKonfetti {
                KonfettiView(style: allCompleted ? .final : .normal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .allowsHitTesting(false)
            }
        }
        .navigationTitle("Aktuelle Quest")
    }



    private func markCompleted(_ challenge: ChallengeModel) {
        var ids = completedIDs
        ids.insert(challenge.id)
        completedChallengeIDsRaw = ids
            .sorted()
            .map(String.init)
            .joined(separator: ",")
    }

    private func handleChallengeCompleted(_ challenge: ChallengeModel) {
        markCompleted(challenge)

        // 🔥 Kräftiger, „snappiger“ Start
        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
            showKonfetti = true
        }

        // etwas längere Sichtbarkeit & smoother Fade
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut(duration: 1.0)) {
                showKonfetti = false
            }
        }
    }

    private func startFinalCelebration() {
        didShowFinalCelebration = true
        SoundManager.shared.playFinal()

        // 🎉 etwas „heroischer“ Start
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            showKonfetti = true
        }

        // 🔟 10 Sekunden Celebration
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            withAnimation(.easeOut(duration: 2.0)) {
                showKonfetti = false
            }
        }
    }
}

#Preview {
    AktuelleChallengeView()
}
