//
//  ErledigteChallegeView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI

struct ErledigteChallengesView: View {
    @AppStorage("completedChallengeIDs") private var completedChallengeIDsRaw: String = ""

    private var completedIDs: Set<Int> {
        decodeCompletedIDs(from: completedChallengeIDsRaw)
    }

    private var erledigteChallenges: [ChallengeModel] {
        allChallenges.filter { completedIDs.contains($0.id) }
    }

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            
            Group {
                if erledigteChallenges.isEmpty {
                    VStack(spacing: 16) {
                        Text("Noch keine Challenges erledigt")
                            .font(.title3.bold())
                            .foregroundColor(.schrift)
                        Text("Sobald du deine erste Challenge abschließt, erscheint sie hier.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.schrift2)
                           
                    }
                    .padding()
                } else {
                    List(erledigteChallenges) { challenge in
                        NavigationLink(destination: ChallengeDetailView(challenge: challenge)){
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.schrift)
                                Text(challenge.title)
                                    .foregroundColor(.schrift)
                            }
                        }
                        .listRowBackground(Color("ButtonBackground"))
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color("AppBackground"))
                }
            }
            .navigationTitle("Erledigte Challenges")
            .foregroundColor(.schrift)
        }
    }
}
