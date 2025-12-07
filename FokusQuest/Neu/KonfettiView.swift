//
//  KonfettiView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse & Fabian Lackner am 05.12.25.
//

import SwiftUI
import UIKit

struct KonfettiView: UIViewRepresentable {

    enum Style {
        case normal   // für Button-Klick
        case final    // für finale Celebration
    }

    let style: Style

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        let emitter = CAEmitterLayer()
        emitter.emitterMode = .outline

        // Position & Form: Punkt in der Bildschirmmitte, von dem die Partikel wegwabern
        DispatchQueue.main.async {
            let width  = view.bounds.width
            let height = view.bounds.height

            emitter.emitterShape = .rectangle
            emitter.emitterPosition = CGPoint(x: width / 2, y: height / 2)
            emitter.emitterSize = CGSize(width: width, height: height)
        }

        // Basiszelle konfigurieren
        let baseCell = CAEmitterCell()

        switch style {
        case .normal:
            // 🔹 Kräftiger Button-Konfetti – kurzer Burst, etwas schneller
            baseCell.birthRate      = 40
            baseCell.lifetime       = 6.0
            baseCell.alphaSpeed     = -0.09
            baseCell.velocity       = 120
            baseCell.velocityRange  = 160
        case .final:
            // 🔹 Epische Final-Celebration – mehr Partikel, etwas länger, sanfteres Verblassen
            baseCell.birthRate      = 50
            baseCell.lifetime       = 1
            baseCell.alphaSpeed     = -0.02
            baseCell.velocity       = 180
            baseCell.velocityRange  = 180
        }

        baseCell.scale          = (style == .final ? 0.09 : 0.06)
        baseCell.scaleRange     = 0.03
        baseCell.emissionRange  = .pi * 2        // in alle Richtungen
        baseCell.spin           = 2
        baseCell.spinRange      = 3
        baseCell.yAcceleration  = 0              // keine Schwerkraft → Wabern
        baseCell.xAcceleration  = 0

        // Weißes Kreisbild als Basis (wird dann mit Farbe multipliziert)
        let size = CGSize(width: 20, height: 20)
        let renderer = UIGraphicsImageRenderer(size: size)
        let baseImage = renderer.image { ctx in
            UIColor.white.setFill()
            ctx.cgContext.fillEllipse(in: CGRect(origin: .zero, size: size))
        }

        // Bunte Farben, die im Darkmode gut sichtbar sind
        let colors: [UIColor] = [
            .systemYellow,
            .systemGreen,
            .systemOrange,
            .systemRed,
            .systemBlue
        ]

        var cells: [CAEmitterCell] = []

        for color in colors {
            let cell = baseCell.copy() as! CAEmitterCell
            cell.contents = baseImage.cgImage
            cell.color = color.cgColor
            cells.append(cell)
        }

        emitter.emitterCells = cells
        view.layer.addSublayer(emitter)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // nichts zu tun
    }
}


#Preview {
    AktuelleChallengeView()
}

