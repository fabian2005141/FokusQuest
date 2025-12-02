//
//  Productivity_ChallengeApp.swift
//  Productivity_Challenge
//
//  Created by Fabian Lackner on 01.12.25.
//

import SwiftUI
import SwiftData

@main
struct Productivity_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Challenge.self)
        }
        
    }
}
