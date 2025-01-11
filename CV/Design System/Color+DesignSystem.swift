//
//  Color+DesignSystem.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

extension Color {
    // Conerting to UIColor is necessary due to a bug in iOS 18, otherwise colors aren't found in ImageRenderer.
    static let cvBackground: Color = Color(uiColor: UIColor(named: "cvBackground")!)
    static let cvAccent: Color = Color(uiColor: UIColor(named: "AccentColor")!)
    static let cvPrimary: Color = Color(uiColor: UIColor(named: "cvPrimary")!)
    static let cvSecondary: Color = Color(uiColor: UIColor(named: "cvSecondary")!)
    static let cvTertiary: Color = Color(uiColor: UIColor(named: "cvTertiary")!)
    static let cvQuaternary: Color = Color(uiColor: UIColor(named: "cvQuaternary")!)
    static let cvShadow: Color = Color(uiColor: UIColor(named: "cvShadow")!)
}
