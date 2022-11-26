//
//  DateFormatter+DesignSystem.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

extension DateFormatter {
    static let monthNameAndYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()

    static let year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
}
