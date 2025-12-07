//
//  Chalenges.swift
//  FokusQuest
//
//  Created by Richard Brüse & Fabian Lackner am 03.12.25.
//

import SwiftUI
import SwiftData
import Foundation

import SwiftUI

struct ChallengeModel: Identifiable, Codable {
    let id: Int
    let title: String
    let area: String
    let description: String
    let steps: [String]
    let tips: [String]
    let reason: String
}

let allChallenges: [ChallengeModel] = [
    // MARK: - Bestehende Challenges

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
            "Wähle einen Platz für Büro-Essentials aus. Vielleicht eine Schublade, in der du Locher, Tacker, Schere, Klebeband und ähnliches immer griffbereit hast.",
            "Alles vom Stapel ‚weg‘ kommt direkt in Müll, Papier oder Spendenbox.",
            "Für ‚unsicher‘: Lege eine kleine Kiste an einen festen Ort, den du später nochmal prüfst."
        ],
        tips: [
            "Mach dir Musik an, die dir ein gutes Gefühl gibt.",
            "Mach vorher ein Foto vom Chaos und danach eins vom Ergebnis – das motiviert in Zukunft Ordnung zu halten."
        ],
        reason: "Ein überladener Schreibtisch sendet ständig das Signal „hier ist etwas zu tun“. Wenn deine Arbeitsfläche frei ist, kann dein Kopf leichter fokussieren und du fühlst dich sofort produktiver."
    ),

    ChallengeModel(
        id: 2,
        title: "Kalender-Check",
        area: "Zeit & Planung",
        description: "Verschaffe dir einen klaren Überblick über deine Zeit.",
        steps: [
            "Öffne deinen digitalen Kalender (oder nimm einen Papierkalender zur Hand).",
            "Verknüpfe ggf. verschiedene Kalender in einer App bzw. übertrage alle Termine in deinen Papierkalender.",
            "Sieh dir an, wie viel freie Zeit du hast – vielleicht möchtest du etwas mehr planen?",
            "Versuche in deinen Tagesablauf zu integrieren, jeden Tag einmal in den Kalender zu schauen, um zu wissen, was abgeht."
        ],
        tips: [
            "Frag dich bei jedem Termin: Muss das wirklich sein? Falls nicht: löschen oder verschieben.",
            "Plane Puffer ein. Nicht jede Stunde verplanen – dein Gehirn braucht Luft."
        ],
        reason: "Wenn Termine nur im Kopf oder über viele Orte verteilt sind, entsteht schnell das Gefühl von Kontrollverlust. Ein klarer Kalender nimmt dir das Grübeln, ob du etwas vergessen hast, und reduziert Alltagsstress."
    ),

    ChallengeModel(
        id: 3,
        title: "Desktop & Downloads bereinigen",
        area: "Digitale Ordnung",
        description: "Reduziere visuelles Chaos auf deinem Computer und sortiere wichtige Dateien.",
        steps: [
            "Öffne deinen Desktop und deinen Downloads-Ordner.",
            "Erstelle 2–3 sinnvolle Hauptordner, z. B. „Dokumente“, „Bilder“, „Projekte“.",
            "Markiere alle Dateien auf dem Desktop und verschiebe sie in einen Ordner „Desktop-Archiv“.",
            "Sortiere im Downloads-Ordner: wichtige Dateien in die neuen Hauptordner, Rest löschen.",
            "Lösche mindestens 10 Dateien, die du sicher nicht mehr brauchst."
        ],
        tips: [
            "Perfekte Ordnung ist nicht nötig – schon 20–30 % weniger Chaos helfen enorm.",
            "Wenn du unsicher bist: lieber in einen „Archiv“-Ordner legen statt ewig zu überlegen."
        ],
        reason: "Ein voller Desktop und ein chaotischer Downloads-Ordner erzeugen jedes Mal beim Öffnen ein Gefühl von Überforderung. Weniger visuelles Durcheinander schafft Ruhe und lässt dich schneller finden, was du brauchst."
    ),

    ChallengeModel(
        id: 4,
        title: "Entrümple dein E-Mail-Postfach",
        area: "Digital & Kommunikation",
        description: "Du musst heute nicht auf Inbox Zero kommen – aber du reduzierst die größten Ablenkungen und gewinnst sofort mehr Klarheit.",
        steps: [
            "Öffne dein Haupt-E-Mail-Postfach.",
            "Sortiere nach Absender oder Betreff, um ähnliche Nachrichten zu gruppieren.",
            "Lösche Newsletter, Werbung und offensichtlichen Ballast der letzten Tage/Wochen.",
            "Erstelle einen Ordner namens „Später“ und verschiebe alle E-Mails dorthin, die du nicht sofort bearbeiten musst.",
            "Bearbeite 5–10 wichtige E-Mails (beantworten, weiterleiten oder archivieren)."
        ],
        tips: [
            "Stelle einen Timer auf 30 Minuten – wenn er klingelt, hörst du auf, egal wie weit du gekommen bist.",
            "Heute geht es um Fortschritt, nicht um Perfektion. Jede gelöschte E-Mail ist ein Gewinn."
        ],
        reason: "Ein überfülltes Postfach fühlt sich wie eine endlose To-do-Liste an. Wenn du Unnötiges entfernst, bleiben nur die wirklich wichtigen Nachrichten übrig – und dein Kopf kann endlich durchatmen."
    ),


    ChallengeModel(
        id: 5,
        title: "Einnahmen & Ausgaben grob erfassen",
        area: "Finanzen",
        description: "Verschaffe dir einen groben Überblick über deine finanzielle Situation.",
        steps: [
            "Nimm Zettel & Stift oder eine Notizen-App.",
            "Schreibe deine festen monatlichen Einnahmen auf (z. B. Gehalt, Nebenjob).",
            "Schreibe deine festen Ausgaben auf (Miete, Strom, Internet, Versicherungen, Abos).",
            "Notiere auch Schulden – sowohl deine als auch von anderen bei dir.",
            "Schätze deine variablen Ausgaben (Einkauf, Tanken, Freizeit, Essen gehen).",
            "Ziehe die Ausgaben von den Einnahmen ab – grobe Richtung reicht.",
            "Überlege, ob es Ausgaben gibt, die du reduzieren oder kündigen möchtest."
        ],
        tips: [
            "Mach dir klar: Das ist nur ein erster Überblick, keine Steuererklärung.",
            "Wenn du willst, mach ein Foto der Liste, damit du sie später leicht wiederfindest."
        ],
        reason: "Unklarheit über Geld sorgt im Hintergrund für ständigen Stress. Ein grober Überblick reicht schon, damit dein Gehirn nicht mehr dauernd „Finanzen!“ schreit."
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
            "Lege eine kleine „Fokus“-Seite an mit maximal 6–8 Apps, die du wirklich täglich brauchst.",
            "Deaktiviere Benachrichtigungen von mindestens 3 Apps, die dich oft stören."
        ],
        tips: [
            "Du kannst Apps später jederzeit neu installieren – du verlierst nichts Wichtiges.",
            "Ein ruhiger Homescreen senkt dein Stresslevel mehr, als man denkt."
        ],
        reason: "Jede unnötige App und jede Benachrichtigung zieht deine Aufmerksamkeit weg. Ein aufgeräumtes Handy bedeutet schnellere und einfachere Bedienung und macht es leichter, bei dir und bei deinen eigentlichen Zielen zu bleiben."
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
        ],
        reason: "Ohne klare Prioritäten fühlt sich jede Aufgabe gleich dringend an. Eine einfache Wochenstruktur gibt deinem Kopf Orientierung und nimmt dir das ständige Neu-Entscheiden ab."
    ),

    ChallengeModel(
        id: 8,
        title: "Hotspot entrümpeln",
        area: "Ordnung & Zuhause",
        description: "Befreie deinen größten Chaos-Hotspot (z. B. Küchentisch, Kommode, Schreibtisch) und sorge für ein Gefühl von Klarheit.",
        steps: [
            "Wähle einen Ort, an dem sich immer Dinge ansammeln.",
            "Räume alles vollständig ab und lege die Gegenstände auf eine freie Fläche.",
            "Sortiere grob in Kategorien: Müll, gehört woanders hin, bleibt hier.",
            "Bringe Müll sofort weg und räume alle Dinge an ihren richtigen Platz.",
            "Wische die freie Fläche sauber.",
            "Lege nur die wirklich wichtigen Dinge strukturiert wieder hin.",
            "Optional: Lege eine kleine Box an, damit sich der Hotspot später nicht wieder überfüllt."
        ],
        tips: [
            "Je kleiner der Hotspot, desto schneller kommt das Erfolgserlebnis.",
            "Nutze eine Stoppuhr (5–10 Minuten), um nicht ins Perfektionieren abzurutschen."
        ],
        reason: "Hotspots wirken wie kleine Chaos-Magnete. Wenn sie sauber sind, entsteht sofort mentale Ruhe und dein Zuhause fühlt sich geordneter an."
    ),

    // MARK: - Neue Challenges

    ChallengeModel(
        id: 9,
        title: "5-Minuten-Kleidungssortierung",
        area: "Ordnung & Zuhause",
        description: "Sorge für Ordnung in deiner Kleidung – schnell, leicht und ohne Überforderung.",
        steps: [
            "Sammle alle herumliegenden Kleidungsstücke ein.",
            "Lege sie auf das Bett, sodass du alles im Blick hast.",
            "Sortiere in: Wäsche, sauber & behalten, sauber & wegräumen, wegwerfen/spenden.",
            "Bringe die Wäsche direkt zum Korb.",
            "Räume die sauberen Sachen an ihren Platz.",
            "Entsorge oder spende beschädigte oder ungewollte Kleidung."
        ],
        tips: [
            "Wenn du keine Zeit hast: nimm dir nur 5 Kleidungsstücke vor.",
            "Lege eine kleine tägliche Routine fest – 1 Minute am Abend reicht oft."
        ],
        reason: "Herumliegende Kleidung signalisiert unbewusst Chaos. Ein kurzer Reset bringt sofort Überblick und entlastet deinen Kopf."
    ),

    ChallengeModel(
        id: 10,
        title: "Papierkram-Stapel ordnen",
        area: "Ordnung & Büro",
        description: "Befreie deinen Papierstapel vom Chaos und gewinne sofort Überblick.",
        steps: [
            "Lege den kompletten Stapel auf eine freie Fläche.",
            "Sortiere grob in drei Kategorien: Müll, abheften, erfordert eine Aktion.",
            "Wirf alles Überflüssige sofort weg.",
            "Lege die Dokumente zum Abheften beiseite (für einen späteren Mini-Quest).",
            "Wähle eine einzige Sache aus der „Aktion“-Kategorie und erledige sie sofort.",
            "Staple die übrigen Dokumente sauber und sichtbar getrennt."
        ],
        tips: [
            "Bearbeite nur diesen einen kleinen Stapel – nicht dein gesamtes Papierarchiv.",
            "Nutze farbige Umschläge oder Mappen für die Kategorien, falls dir das hilft."
        ],
        reason: "Papierkram erzeugt latent Stress, weil du „irgendwas Wichtiges“ vermutest. Ein schneller Überblick senkt dieses Gefühl sofort."
    ),

    ChallengeModel(
        id: 11,
        title: "Dein persönliches Müllsystem",
        area: "Ordnung & Zuhause",
        description: "Mache Entsorgen einfacher und schaffe feste Plätze für alles, was weg muss.",
        steps: [
            "Überlege, welche Müllarten in deinem Haushalt regelmäßig anfallen: Restmüll, Bio, Papier, Plastik, Pfand, Glas.",
            "Wähle für jede Kategorie einen festen Platz aus.",
            "Stelle passende Behälter auf (Korb, Box, Tüte, Eimer).",
            "Beschrifte sie optional, damit du oder andere schneller wissen, wohin etwas gehört.",
            "Räume herumliegenden Müll direkt in das neue System ein.",
            "Überlege kurz, ob du eine wöchentliche Routine brauchst (z. B. „Freitags Müll rausbringen“)."
        ],
        tips: [
            "Wenn du wenig Platz hast: nutze stapelbare oder schmale Behälter.",
            "Ein klarer Platz für Pfandflaschen verhindert Chaos in Küche oder Abstellraum."
        ],
        reason: "Unklarheit über „wohin mit etwas“ erzeugt langfristig sichtbares Chaos. Ein System verhindert neue Sammelstellen und spart täglich Energie."
    ),

    ChallengeModel(
        id: 12,
        title: "Eine Schublade ordnen",
        area: "Ordnung & Zuhause",
        description: "Bringe eine einzige Schublade in klare Ordnung – schnell, übersichtlich und befreiend.",
        steps: [
            "Wähle eine Schublade, egal welche.",
            "Leere den gesamten Inhalt auf eine Fläche.",
            "Wische die Schublade aus.",
            "Sortiere die Gegenstände in: behalten, woanders hin, entsorgen.",
            "Entsorge direkt alles, was kaputt oder nutzlos ist.",
            "Lege die wichtigen Dinge strukturiert zurück, idealerweise in Kategorien."
        ],
        tips: [
            "Nimm lieber eine kleine Schublade, um nicht überladen zu werden.",
            "Nutze kleine Boxen oder Trennfächer, falls vorhanden."
        ],
        reason: "Ordnung in kleinen Bereichen erzeugt schnell sichtbare Erfolge und motiviert für mehr Struktur im Alltag."
    ),

    ChallengeModel(
        id: 13,
        title: "Bad-Ablage minimalisieren",
        area: "Ordnung & Zuhause",
        description: "Schaffe Klarheit im Bad – einer der stärksten Orte für tägliches Wohlbefinden.",
        steps: [
            "Nimm alle Produkte von der Ablage oder Dusche herunter.",
            "Wische die Fläche sauber.",
            "Sortiere in: täglich gebraucht, selten gebraucht, kann weg.",
            "Entsorge leere oder alte Produkte sofort.",
            "Stelle nur die wichtigsten Dinge wieder ordnungsgemäß hin.",
            "Lagere selten genutzte Produkte in einer Schublade oder Box."
        ],
        tips: [
            "Weniger sichtbare Dinge = ruhigeres Gefühl im Bad.",
            "Überprüfe Verfallsdaten bei Kosmetik."
        ],
        reason: "Visuelle Überladung im Bad erzeugt langfristig Stress. Eine klare, reduzierte Ablage wirkt sofort beruhigend. Außerdem macht es das sauber machen deutlich einfacher."
    ),

    ChallengeModel(
        id: 14,
        title: "Taschen-Reset",
        area: "Ordnung & Alltag",
        description: "Bringe deine Tasche oder deinen Rucksack auf Vordermann und fühle dich sofort geordneter.",
        steps: [
            "Leere die komplette Tasche auf eine Fläche.",
            "Trenne in: Müll, wichtige Dinge, unwichtige Dinge.",
            "Wirf Müll und alte Zettel sofort weg.",
            "Lege wichtige Dinge geordnet zurück.",
            "Überlege kurz, welche 3 Dinge du wirklich täglich brauchst.",
            "Optional: Füge eine kleine Etui-Box für Kleinkram hinzu."
        ],
        tips: [
            "Mach diesen Reset einmal pro Woche – dauert nur 2 Minuten.",
            "Rucksack-Chaos wirkt unbewusst wie mentaler Ballast."
        ],
        reason: "Eine klare Tasche verhindert Suchstress und das Gefühl, unvorbereitet zu sein."
    ),

    ChallengeModel(
        id: 15,
        title: "Kabelkiste ordnen",
        area: "Ordnung & Technik",
        description: "Bringe Ordnung in deine Kabel, Ladegeräte und Adapter – ein Bereich, der oft jahrelang ignoriert wird.",
        steps: [
            "Leere die komplette Kabelkiste aus.",
            "Teste im Zweifel kurz, ob Kabel noch funktionieren.",
            "Sortiere defekte, doppelte oder veraltete Kabel aus.",
            "Binde die behaltenen Kabel sauber zusammen.",
            "Sortiere sie nach Kategorien (USB-C, Lightning, HDMI usw.).",
            "Lege sie geordnet in die Kiste zurück oder nutze kleine Beutel."
        ],
        tips: [
            "Die meisten Menschen besitzen viel mehr Kabel, als sie wirklich brauchen.",
            "Ein geordnetes Kabelsystem spart bei jedem Technikproblem Zeit."
        ],
        reason: "Kabelchaos verursacht unterschwelligen Stress und erschwert spontanes Arbeiten. Ordnung bringt sofort Übersicht und Ruhe."
    ),

    ChallengeModel(
        id: 16,
        title: "Eine Nachricht beantworten",
        area: "Soziales & Mental Load",
        description: "Beantworte eine Nachricht, die dir seit Tagen oder Wochen im Kopf herumspukt.",
        steps: [
            "Wähle eine einzige Nachricht aus, die dich belastet.",
            "Lies sie in Ruhe und ohne Bewertung.",
            "Formuliere eine kurze, ehrliche Antwort.",
            "Sende die Nachricht direkt ab.",
            "Atme kurz durch und spüre die Erleichterung."
        ],
        tips: [
            "Perfektion ist nicht nötig – eine kurze Antwort reicht.",
            "Setze dir ein 5-Minuten-Limit, um nicht zu viel nachzudenken."
        ],
        reason: "Unerledigte Nachrichten können wie kleine mentale Gewichte wirken. Eine einzige Antwort kann unmittelbare Erleichterung bringen."
    ),

    ChallengeModel(
        id: 17,
        title: "Einen wichtigen Termin vereinbaren",
        area: "Alltag & Planung",
        description: "Vereinbare einen Termin, den du schon länger vor dir herschiebst.",
        steps: [
            "Wähle einen Termin aus (Arzt, Behörde, Versicherung, Gespräch).",
            "Öffne die App oder Website oder nimm dein Telefon in die Hand.",
            "Stelle die Anfrage oder rufe direkt an.",
            "Trage den Termin sofort in deinen Kalender ein.",
            "Atme bewusst durch: dieser Punkt ist jetzt erledigt."
        ],
        tips: [
            "Wenn du Angst vor dem Telefonieren hast: schreibe eine kurze Anfrage per Mail.",
            "Bereite dir einen einfachen Satz vor, z. B.: „Ich würde gerne einen Termin vereinbaren.“"
        ],
        reason: "Wichtige, aber unangenehme Termine blockieren lange die Gedanken. Eine einzige Aktion löst einen große inneren Spannung."
    ),

    ChallengeModel(
        id: 18,
        title: "Etwas zurückgeben oder versenden",
        area: "Alltag & Organisation",
        description: "Erledige eine Rückgabe, die du schon lange verschiebst – Paket, geliehenes Buch, Kleidung oder Bestellung.",
        steps: [
            "Wähle eine einzige Sache aus, die du zurückgeben oder verschicken willst.",
            "Packe sie vollständig ein (falls nötig).",
            "Bereite Etikett oder Adresse vor.",
            "Bringe das Paket zur Post oder gib die Sache an der richtigen Stelle ab.",
            "Notiere dir, dass diese Aufgabe erledigt ist."
        ],
        tips: [
            "Wenn du gerade nicht raus kannst: packe das Paket zumindest transportbereit.",
            "Leg dir eine kleine Rückgabe-Ecke in der Nähe deiner Wohnungstür an."
        ],
        reason: "Rückgaben hängen oft wie eine Wolke über dem Alltag. Eine erledigte Rückgabe schafft sofortige Erleichterung."
    ),

    ChallengeModel(
        id: 19,
        title: "Einen Vertrag prüfen",
        area: "Finanzen & Planung",
        description: "Verschaffe dir Klarheit über einen Vertrag – Handy, Strom, Abo oder Versicherung.",
        steps: [
            "Wähle einen einzigen Vertrag aus.",
            "Suche die aktuelle Rechnung oder Vertragsdaten heraus.",
            "Notiere die wichtigsten Infos: Preis, Laufzeit, Kündigungsfrist.",
            "Überprüfe, ob es Einsparpotenzial gibt.",
            "Entscheide, ob du in den nächsten Tagen handeln willst."
        ],
        tips: [
            "Mach ein Foto der Vertragsdaten, damit du sie immer parat hast.",
            "Keine Panik – heute geht es nur um Überblick, nicht um sofortiges Kündigen."
        ],
        reason: "Unklares über Verträge und Abos erzeugt unterschwellige Anspannung. Ein klarer Überblick wirkt sofort befreiend."
    ),

    ChallengeModel(
        id: 20,
        title: "Geldbeutel-Reset",
        area: "Alltag & Klarheit",
        description: "Bringe deinen Geldbeutel in Ordnung – eine kleine Aufgabe mit großer Wirkung.",
        steps: [
            "Leere deinen Geldbeutel vollständig aus.",
            "Wirf alte Kassenbons, Zettel und Müll weg.",
            "Sortiere Karten: wichtig, selten benutzt, kann weg.",
            "Ordne Geldscheine und Münzen neu.",
            "Räume nur das Nötigste wieder ein."
        ],
        tips: [
            "Lege selten genutzte Karten separat zuhause ab.",
            "Ein leichter Geldbeutel fühlt sich überraschend befreiend an."
        ],
        reason: "Der Geldbeutel begleitet dich täglich. Ordnung darin vermittelt sofort Kontrolle und Ruhe."
    ),

    ChallengeModel(
        id: 21,
        title: "Der große 10-Minuten-Reset",
        area: "Ordnung & Alltag",
        description: "Bringe deine Wohnung in 10 Minuten sichtbar in Ordnung – schnelle Wirkung, großer mentaler Effekt.",
        steps: [
            "Befreie zuerst den Fußboden von herumliegenden Dingen.",
            "Räume Müll weg: Papier, Verpackungen, leere Flaschen.",
            "Bringe Geschirr zur Spüle oder in die Spülmaschine.",
            "Räume Oberflächen frei: Tisch, Couchtisch oder Küche.",
            "Stelle nur die wichtigsten Dinge wieder ordentlich hin.",
            "Mach kurz das Licht aus und wieder an – und genieße den Unterschied."
        ],
        tips: [
            "Stell dir einen Timer – 10 Minuten reichen meist wirklich.",
            "Wähle nur sichtbare Bereiche, um sofortige Wirkung zu spüren.",
        ],
        reason: "Sichtbare Ordnung beruhigt sofort das Nervensystem. Schon wenige Minuten schaffen Klarheit und reduzieren mentalen Druck."
    )
]

struct Challenges: View {
    var body: some View {
        Text("Challenges View")
    }
}

