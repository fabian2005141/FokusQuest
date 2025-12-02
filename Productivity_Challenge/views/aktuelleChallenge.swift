import SwiftData
import SwiftUI


@Model
class Challenge {
    var id: UUID
    var aufgabe: String
    var erledigt: Bool
    
    init(aufgabe: String) {
        self.id = UUID()
        self.aufgabe = aufgabe
        self.erledigt = false
    }
}





struct AktuelleChallenge: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \Challenge.aufgabe) private var challenges: [Challenge]
    
    // aktuelle Challenge als Objekt, nicht nur als String
    @State private var currentChallenge: Challenge?
    
    // für den Hintergrund (grün/schwarz)
    @State private var erledigt: Bool = false
    
    // Sheet zum Hinzufügen
    @State private var showAddSheet: Bool = false
    @State private var newChallengeText: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Hintergrundfarbe
                if erledigt {
                    Color(.green)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Color(.black)
                        .edgesIgnoringSafeArea(.all)
                }
                
                VStack {
                    Text("Das liegt gerade an:")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                        .offset(y: -150)
                    
                    Text(currentChallenge?.aufgabe ?? "Keine Challenges vorhanden.\nFüge über das + oben rechts eine neue hinzu.")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Button("Erledigt") {
                        erledigtButtonTapped()
                    }
                    .padding(.top, 40)
                }
            }
            .navigationTitle("Challenge")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NavigationStack {
                    Form {
                        Section(header: Text("Neue Challenge")) {
                            TextField("z.B. 10 Minuten lesen", text: $newChallengeText)
                        }
                    }
                    .navigationTitle("Challenge hinzufügen")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Abbrechen") {
                                newChallengeText = ""
                                showAddSheet = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Speichern") {
                                addChallenge()
                            }
                            .disabled(newChallengeText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        }
                    }
                }
            }
            .onAppear {
                // Standard-Challenges hinzufügen, wenn noch keine vorhanden sind
                // MARK: - Chaqllange hinuzufügen
                
                
                
                if challenges.isEmpty {
                    let defaults: [Challenge] = [
                        Challenge(aufgabe: "Tisch aufräumen"),
                        Challenge(aufgabe: "5 Minuten meditieren"),
                        Challenge(aufgabe: "10 Minuten meditieren"),
                        Challenge(aufgabe: "20 Minuten meditieren")
                        
                        
                        
                        
                        
                        
                        
                    ]
                    for challenge in defaults {
                        context.insert(challenge)
                    }
                    try? context.save()
                }

                // Beim ersten Öffnen eine zufällige Challenge laden
                if currentChallenge == nil {
                    loadRandomChallenge()
                }
            }
        }
    }
    
    // MARK: - Aktionen
    
    private func erledigtButtonTapped() {
        // Hintergrund toggeln (für deinen grünen/schwarzen Effekt)
        erledigt.toggle()
        
        // aktuelle Challenge als erledigt markieren und speichern
        if let challenge = currentChallenge {
            challenge.erledigt = true
            do {
                try context.save()
            } catch {
                print("Fehler beim Speichern (erledigt setzen): \(error)")
            }
        }
        
        // neue zufällige Challenge laden (nur nicht erledigte)
        loadRandomChallenge()
    }
    
    private func loadRandomChallenge() {
        // Nur Challenges, die noch nicht erledigt sind
        let offeneChallenges = challenges
        
        if let random = offeneChallenges.randomElement() {
            currentChallenge = random
        } else {
            // Keine offenen Challenges mehr
            currentChallenge = nil
        }
    }
    
    private func addChallenge() {
        let trimmed = newChallengeText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        let new = Challenge(aufgabe: trimmed)
        context.insert(new)
        
        do {
            try context.save()
            // neu hinzugefügte Challenge direkt mit in die Auswahl nehmen
            currentChallenge = new
            erledigt = false
        } catch {
            print("Fehler beim Speichern der neuen Challenge: \(error)")
        }
        
        newChallengeText = ""
        showAddSheet = false
    }
}

#Preview {
    // Vorschau mit In-Memory SwiftData Container
    AktuelleChallenge()
        .modelContainer(for: Challenge.self, inMemory: true)
}
