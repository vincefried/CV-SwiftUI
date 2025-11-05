//
//  PeriodOfLife+FormattedTimeframe.swift
//  CV
//
//  Created by Vincent Friedrich on 05.11.25.
//

import Foundation

extension PeriodOfLife {
    var formattedTimeframe: String {
        let timeframeDateFormatter = DateFormatter.monthNameAndYear
        let formattedStartDate = timeframeDateFormatter.string(from: self.startDate)
        let formattedEndDate = self.endDate.map { timeframeDateFormatter.string(from: $0) } ?? "Today"
        let formattedDatesAreSame = formattedStartDate == formattedEndDate
        return formattedDatesAreSame ? formattedStartDate : "\(formattedStartDate) - \(formattedEndDate)"
    }
}
