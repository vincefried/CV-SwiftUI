//
//  View+AutoShadow.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

struct ColorSchemeBasedShadowModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    let cornerRadius: CGFloat
    let isActive: Bool

    func body(content: Content) -> some View {
        if colorScheme == .dark && isActive {
            content
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.cvTertiary.opacity(0.3))
                )
        } else {
            content
                .shadow(color: color, radius: radius, x: x, y: y)
        }
    }
}

extension View {
    func shadow(
        color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33),
        radius: CGFloat,
        x: CGFloat = 0,
        y: CGFloat = 0,
        cornerRadius: CGFloat = 0,
        autoSelectBasedOnColorScheme: Bool = false
    ) -> some View {
        self.modifier(
            ColorSchemeBasedShadowModifier(
                color: color,
                radius: radius,
                x: x,
                y: y,
                cornerRadius: cornerRadius,
                isActive: autoSelectBasedOnColorScheme
            )
        )
    }
}
