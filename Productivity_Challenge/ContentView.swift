//
//  ContentView.swift
//  Productivity_Challenge
//
//  Created by Fabian Lackner on 01.12.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            NavigationStack {
                Color(.white)
                VStack(spacing: 16) {
                    NavigationLink("Aktuelle Challenge") {
                        AktuelleChallenge()
                    }
                    NavigationLink("Bereits erledigt") {
                        BereitsErledigt()
                    }
                }
                .navigationTitle("Productivity Challenge")
                .padding()
                }
    
            }
        }
    }

#Preview {
    ContentView()
}
