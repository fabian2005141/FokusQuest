//
//  ChallengeListView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI

struct ChallengeListView: View {
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            List(allChallenges) { (challenge: ChallengeModel) in
                NavigationLink(destination: ChallengeDetailView(challenge: challenge)) {
                    Text(challenge.title)
                        .font(.body)
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Alle Challenges")
        }
    }
}

