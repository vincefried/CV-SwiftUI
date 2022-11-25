//
//  Color+DesignSystem.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

extension Color {
    static let cvBackground: Color = .white
    static let cvAccent: Color = .fromAbsoluteRGBA(red: 255, green: 104, blue: 93)
    static let cvPrimary: Color = .black
    static let cvSecondary: Color = .fromAbsoluteRGBA(red: 85, green: 85, blue: 85)
    static let cvTertiary: Color = .fromAbsoluteRGBA(red: 192, green: 192, blue: 192)
    static let cvShadow: Color = .fromAbsoluteRGBA(red: 0, green: 0, blue: 0, alpha: 8)
}

extension Color {
    static func fromAbsoluteRGBA(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 100) -> Color {
        Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: alpha / 100)
    }
}
