//
//  Color+DesignSystem.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

extension Color {
    static let cvBackground: Color = Color("cvBackground")
    static let cvAccent: Color = .accentColor
    static let cvPrimary: Color = Color("cvPrimary")
    static let cvSecondary: Color = Color("cvSecondary")
    static let cvTertiary: Color = Color("cvTertiary")
    static let cvShadow: Color = Color("cvShadow")
}

extension Color {
    static func fromAbsoluteRGBA(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 100) -> Color {
        Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: alpha / 100)
    }
}
