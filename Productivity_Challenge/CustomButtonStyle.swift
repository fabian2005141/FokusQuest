//
//  CustomButtonStyle.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .foregroundColor(.secondary)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
