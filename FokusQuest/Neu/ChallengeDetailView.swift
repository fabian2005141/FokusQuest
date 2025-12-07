//
//  ChallengeDetailView.swift
//  FokusQuest
//
//  Created by Richard Brüse & Fabian Lackner am 03.12.25.
//

import SwiftUI

struct ChallengeDetailView: View {
    let challenge: ChallengeModel   
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
                
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(challenge.title)
                        .font(.title2.bold())
                        .foregroundColor(.schrift)

                    Text(challenge.area)
                        .font(.subheadline)
                        .foregroundColor(.schrift2)

                    Divider()

                    Text(challenge.description)
                        .font(.body)
                        .foregroundColor(.schrift2)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Schritte")
                            .font(.headline)
                        ForEach(Array(challenge.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 8) {
                                Text("\(index + 1).")
                                    .font(.subheadline.bold())
                                    .foregroundColor(.schrift2)
                                Text(step)
                                    .font(.body)
                                    .foregroundColor(.schrift2)
                            }
                        }
                    }

                    if !challenge.tips.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tipps")
                                .font(.headline)
                                .foregroundColor(.schrift)
                            ForEach(challenge.tips, id: \.self) { tip in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "lightbulb")
                                    Text(tip)
                                }
                                .font(.body)
                                .foregroundColor(.schrift2)
                            }
                        }
                    }
                    if !challenge.reason.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Warum das hilft")
                                .font(.headline)
                                .foregroundColor(.schrift)

                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "brain.head.profile")
                                Text(challenge.reason)
                            }
                            .font(.body)
                            .foregroundColor(.schrift2)
                        }
                        .padding(.top)
                    }
                    Spacer(minLength: 16)
                }
                .padding()
            }
        }
        .navigationTitle(challenge.title)
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.schrift)
    }
}
