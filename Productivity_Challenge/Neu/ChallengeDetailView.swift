//
//  ChallengeDetailView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI

struct ChallengeDetailView: View {
    let challenge: ChallengeModel   // <-- diese Zeile ist wichtig!

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(challenge.title)
                        .font(.title2.bold())

                    Text(challenge.area)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Divider()

                    Text(challenge.description)
                        .font(.body)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Schritte")
                            .font(.headline)
                        ForEach(Array(challenge.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 8) {
                                Text("\(index + 1).")
                                    .font(.subheadline.bold())
                                Text(step)
                                    .font(.body)
                            }
                        }
                    }

                    if !challenge.tips.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tipps")
                                .font(.headline)
                            ForEach(challenge.tips, id: \.self) { tip in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "lightbulb")
                                    Text(tip)
                                }
                                .font(.body)
                            }
                        }
                    }

                    Spacer(minLength: 16)
                }
                .padding()
            }
        }
        .navigationTitle(challenge.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
