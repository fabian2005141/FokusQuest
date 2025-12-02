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
                        aktuelleChallenge()
                    }
                    .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity)

                    .background(Color.blue)
                    .border(Color.blue, width: 3)
                    .foregroundColor(.white)
                    .font(.title)
                    Spacer()
                    
                    NavigationLink("Bereits erledigt") {
                        bereitsErledigt()
                    } .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .border(Color.blue, width: 3)
                    .foregroundColor(.white)
                    .font(.title)
                }
                Spacer()
                .navigationTitle("Productivity Challenge")
                .padding()
                
                }
    
            }
        }
    }

#Preview {
    ContentView()
}
