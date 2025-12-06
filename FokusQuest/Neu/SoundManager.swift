//
//  SoundManager.swift
//  FokusQuest
//
//  Created by Richard brüse on 06.12.25.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()

    private var successPlayer: AVAudioPlayer?
    private var finalPlayer: AVAudioPlayer?

    private init() {
        // Optional: Audio-Session setzen, damit alles sauber läuft
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("⚠️ AudioSession Fehler: \(error)")
        }

        successPlayer = loadSound(name: "quest_success", ext: "wav")
        finalPlayer   = loadSound(name: "final_fanfare", ext: "wav")
    }

    private func loadSound(name: String, ext: String) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            print("⚠️ Sound nicht gefunden: \(name).\(ext)")
            return nil
        }

        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            return player
        } catch {
            print("⚠️ Fehler beim Laden von \(name).\(ext): \(error)")
            return nil
        }
    }

    /// Kurzer „Quest erledigt“-Sound
    func playSuccess() {
        // Falls der finale Sound gerade läuft, leise beenden:
        finalPlayer?.stop()

        successPlayer?.currentTime = 0
        successPlayer?.play()
    }

    /// Finale Fanfare wenn alle Quests durch sind
    func playFinal() {
        // Normale Sounds stoppen, damit sie sich nicht überlappen:
        successPlayer?.stop()

        finalPlayer?.currentTime = 0
        finalPlayer?.play()
    }
}
