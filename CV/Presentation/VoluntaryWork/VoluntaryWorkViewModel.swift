//
//  VoluntaryWorkViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 05.11.25.
//

import Foundation

struct VoluntaryWorkViewModel {
    let title: String
    let items: [Item]

    init(voluntaryWorkItems: [VoluntaryWork]) {
        self.title = "Voluntary Work"
        self.items = voluntaryWorkItems
            .sorted { lhs, rhs in
                lhs.startDate > rhs.startDate
            }
            .map { voluntaryWorkItem in
                Item(
                    id: UUID().uuidString,
                    organization: voluntaryWorkItem.organization,
                    date: voluntaryWorkItem.formattedTimeframe,
                    info: voluntaryWorkItem.info.map { InfoViewModel(info: $0) }
                )
            }
    }
}

extension VoluntaryWorkViewModel {
    struct Item: Identifiable {
        let id: String
        let organization: String
        let date: String
        let info: [InfoViewModel]
    }
}
