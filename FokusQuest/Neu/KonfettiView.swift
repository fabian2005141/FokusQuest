//
//  KonfettiView.swift
//  FokusQuest
//
//  Created by Richard Brüse & Fabian Lackner am 05.12.25.
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

        DispatchQueue.main.async {
            let width  = view.bounds.width
            let height = view.bounds.height

            emitter.emitterShape = .rectangle
            emitter.emitterPosition = CGPoint(x: width / 2, y: height / 2)
            emitter.emitterSize = CGSize(width: width, height: height)
        }


        let baseCell = CAEmitterCell()

        switch style {
        case .normal:

            baseCell.birthRate      = 40
            baseCell.lifetime       = 6.0
            baseCell.alphaSpeed     = -0.09
            baseCell.velocity       = 120
            baseCell.velocityRange  = 160
        case .final:

            baseCell.birthRate      = 80
            baseCell.lifetime       = 1
            baseCell.alphaSpeed     = -0.04
            baseCell.velocity       = 180
            baseCell.velocityRange  = 180
        }

        baseCell.scale          = (style == .final ? 0.09 : 0.06)
        baseCell.scaleRange     = 0.03
        baseCell.emissionRange  = .pi * 2
        baseCell.spin           = 2
        baseCell.spinRange      = 3
        baseCell.yAcceleration  = 0
        baseCell.xAcceleration  = 0

       
        let size = CGSize(width: 20, height: 20)
        let renderer = UIGraphicsImageRenderer(size: size)
        let baseImage = renderer.image { ctx in
            UIColor.white.setFill()
            ctx.cgContext.fillEllipse(in: CGRect(origin: .zero, size: size))
        }

      
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

    }
}


#Preview {
    AktuelleChallengeView()
}

