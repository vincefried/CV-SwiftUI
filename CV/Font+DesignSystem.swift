//
//  Font+DesignSystem.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

extension Font {
    static let cvExtraLarge = Font.system(size: 24, weight: .semibold, design: .monospaced)
    static let cvLarge = Font.system(size: 18, weight: .semibold, design: .monospaced)
    static let cvSemiLargeProminent = Font.system(size: 13, weight: .semibold, design: .monospaced)
    static let cvSemiLarge = Font.system(size: 13, weight: .medium, design: .monospaced)
    static let cvMedium = Font.system(size: 12, weight: .medium, design: .monospaced)
    static let cvIcon = Font.system(size: 24, weight: .medium)
}
