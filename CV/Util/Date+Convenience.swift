//
//  Date+Convenience.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

extension DateComponents {
    static let all: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute, .second, .nanosecond]
}

extension Date {
    static func from(
        day: Int? = 1,
        month: Int? = 1,
        year: Int? = 1970
    ) -> Date? {
        var components = DateComponents()

        components.day = day
        components.month = month
        components.year = year

        return Calendar.current.date(from: components)
    }
}
