//
//  ersteChallenge.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI
import SwiftData
import Foundation

struct ChallengeModel: Identifiable, Codable {
    let id: Int
    let title: String
    let area: String
    let description: String
    let steps: [String]
    let tips: [String]
    

    }
let allChallenges: [ChallengeModel] = [
    ChallengeModel(
            id: 1,
            title: "Schreibtisch-Reset",
            area: "Physische Ordnung",
            description: "Schaffe eine aufgeräumte, ruhige Arbeitsfläche, auf der nur noch das liegt, was du wirklich brauchst.",
            steps: [
                "Räume alles vom Schreibtisch auf eine andere Fläche (z. B. Bett oder Boden).",
                "Sortiere in drei Stapel: bleibt, weg, unsicher.",
                "Wische die Schreibtischoberfläche einmal gründlich ab.",
                "Lege nur das zurück, was du täglich brauchst (Laptop, Notizbuch, Stift, Maus usw.).",
                "Wähle einen Platz für Büro-Essentials aus. Vielleicht eine Schublade, in der du Locher, Tacker, Schere Klebeband und ähnliches immer griffbereit hast",
                "Alles vom Stapel ‚weg‘ kommt direkt in Müll, Papier oder Spendenbox.",
                "Für ‚unsicher‘: Lege eine kleine Kiste an einen festen Ort, den du später nochmal prüfst."
            ],
            tips: [
                "Mach dir Musik an, die dir ein gutes Gefühl gibt.",
                "Mach vorher ein Foto vom Chaos und danach eins vom Ergebnis – das motiviert."
            ]
        ),
        ChallengeModel(
            id: 2,
            title: "Kalender-Check",
            area: "Zeit & Planung",
            description: "Verschaffe dir einen klaren Überblick über deine Zeit",
            steps: [
                "Öffne deinen digitalen Kalender (oder nimm einen Papierkalender zur Hand).",
                "Verknüpfe ggf. verschiedene Kalender in einer App, bzw, übertrage alle Termine in deinen Papierkalender",
                "Sieh dir an wie viel freie Zeit du hast, vielleicht möchtest du etwas mehr planen?",
                "Versuche in deinen Tagesablauf zu integrieren, jeden Tag einmal in den Kalender zu schauen, um zu wissen was abgeht"
            ],
            tips: [
                "Frag dich bei jedem Termin: Muss das wirklich sein? Falls nicht: löschen oder verschieben.",
                "Plane Puffer ein. Nicht jede Stunde verplanen – dein Gehirn braucht Luft."
            ]
        ),
        ChallengeModel(
            id: 3,
            title: "Desktop & Downloads bereinigen",
            area: "Digitale Ordnung",
            description: "Reduziere visuelles Chaos auf deinem Computer und sortiere wichtige Dateien.",
            steps: [
                "Öffne deinen Desktop und deinen Downloads-Ordner.",
                "Erstelle 2–3 sinnvolle Hauptordner, z. B. ‚Dokumente‘, ‚Bilder‘, ‚Projekte‘.",
                "Markiere alle Dateien auf dem Desktop und verschiebe sie in einen Ordner ‚Desktop-Archiv‘.",
                "Sortiere im Downloads-Ordner: Wichtige Dateien in die neuen Hauptordner, Rest löschen.",
                "Lösche mindestens 10 Dateien, die du sicher nicht mehr brauchst."
            ],
            tips: [
                "Perfekte Ordnung ist nicht nötig – schon 20–30 % weniger Chaos helfen enorm.",
                "Wenn du unsicher bist: lieber in einen ‚Archiv‘-Ordner legen statt ewig zu überlegen."
            ]
        ),
        ChallengeModel(
            id: 4,
            title: "E-Mail-Inbox light",
            area: "Digital & Kommunikation",
            description: "Du musst nicht auf Inbox Zero kommen, aber du reduzierst heute die größten Störfaktoren.",
            steps: [
                "Öffne dein Haupt-E-Mail-Postfach.",
                "Sortiere nach Absender oder Betreff, um ähnliche Mails zu bündeln.",
                "Lösche Newsletter, Werbung und offensichtlichen Müll der letzten Tage/Wochen.",
                "Lege einen Ordner ‚Später‘ an und verschiebe Mails hinein, die du nicht sofort bearbeiten musst.",
                "Bearbeite gezielt 5–10 wichtige Mails (Antworten, weiterleiten oder archivieren)."
            ],
            tips: [
                "Stell dir einen Timer auf 30 Minuten. Danach hörst du auf, egal wie weit du bist.",
                "Du musst heute nicht perfekt werden – Hauptsache, es wird leichter als gestern."
            ]
        ),
        ChallengeModel(
            id: 5,
            title: "Einnahmen & Ausgaben grob erfassen",
            area: "Finanzen",
            description: "Verschaffe dir einen groben Überblick, über deine finanzielle Situation.",
            steps: [
                "Nimm Zettel & Stift oder eine Notizen-App.",
                "Schreibe deine festen monatlichen Einnahmen auf (z. B. Gehalt, Nebenjob).",
                "Schreibe deine festen Ausgaben auf (Miete, Strom, Internet, Versicherungen, Abos).",
                "Auch deine Schulden, bzw. die Schulden anderer bei dir sollten erfasst sein",
                "Schätze deine Ausgaben (Einkauf, Tanken, Freizeit, Essen gehen).",
                "Ziehe die Ausgaben von den Einnahmen ab – grobe Richtung reicht.",
                "Vielleicht kommt dir schon etwas überflüssig vor und du kannst Geld sparen, indem du unbenutze Abonements kündigst."
            ],
            tips: [
                "Mach dir klar: Das ist nur ein erster Überblick, keine Steuererklärung.",
                "Wenn du willst, mach ein Foto der Liste, damit du sie später leicht wiederfindest."
            ]
        ),
        ChallengeModel(
            id: 6,
            title: "Smartphone-Apps aufräumen",
            area: "Digital & Fokus",
            description: "Reduziere Ablenkung auf deinem Handy und mach wichtige Apps schnell erreichbar.",
            steps: [
                "Entsperre dein Handy und schau dir die erste Homescreen-Seite an.",
                "Verschiebe alle unwichtigen Apps von Seite 1 auf andere Seiten oder in Ordner.",
                "Lösche Apps, die du seit Monaten nicht benutzt hast.",
                "Lege eine kleine ‚Fokus‘-Seite an mit maximal 6–8 Apps, die du wirklich täglich brauchst.",
                "Deaktiviere Benachrichtigungen von mindestens 3 Apps, die dich oft stören."
            ],
            tips: [
                "Du kannst Apps später jederzeit neu installieren – du verlierst nichts Wichtiges.",
                "Ein ruhiger Homescreen senkt dein Stresslevel mehr, als man denkt."
            ]
        ),
        ChallengeModel(
            id: 7,
            title: "Wochenstruktur & Prioritäten",
            area: "Ziele & Planung",
            description: "Lege für die nächsten 7 Tage klare Prioritäten fest und schaffe dir Struktur.",
            steps: [
                "Nimm Kalender oder Notiz-App zur Hand.",
                "Schreibe die nächsten 7 Tage untereinander auf.",
                "Definiere pro Tag 1–3 wirklich wichtige Aufgaben oder Ziele.",
                "Plane für jede wichtige Aufgabe ein realistisches Zeitfenster.",
                "Nimm dir einen Tag, der bewusst leichter bleibt (weniger Aufgaben).",
                "Überlege dir eine kleine Belohnung, wenn du die Woche grob einhältst."
            ],
            tips: [
                "Sei eher zu vorsichtig als zu optimistisch – lieber weniger vornehmen und wirklich schaffen.",
                "Plane auch Zeit für dich ein: Erholung ist Teil von Produktivität."
            ]
        ),
    ChallengeModel(
      id: 8,
      title: "Regal saubermachen",
      area: "Ordnung & Zuhause",
      description: "Bringe ein Regal deiner Wahl in Ordnung – sauber, sortiert und übersichtlich.",
      steps: [
        "Wähle ein Regal (z. B. im Zimmer, Bad oder Küche).",
        "Nimm alles heraus und lege die Sachen geordnet zur Seite.",
        "Wische die Regalböden feucht oder mit Staubtuch sauber.",
        "Entscheide: Was kommt zurück? Was kann weg oder an einen besseren Platz?",
        "Sortiere die Dinge in Kategorien (z. B. Bücher, Deko, Elektronik).",
        "Stelle sie ordentlich und mit System wieder ein.",
        "Mache ein Vorher–Nachher-Foto für extra Motivation!"
      ],
      tips: [
        "Falls es zu viel ist: nur ein einzelnes Fach des Regals erledigen.",
        "Nutze die Gelegenheit, direkt ein paar unnötige Dinge auszusortieren.",
        "Schöne Anordnung hilft: schwere Sachen unten, leichte oben."
      ]
    ),

    
    ]

struct Challenges: View {
    var body: some View {
        Text("Challenges View")
            
    }
    }

#Preview {
    Challenges()
}
