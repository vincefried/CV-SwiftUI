//
//  TalksViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 03.10.23.
//

import Foundation

struct TalksViewModel {
    let title: String
    let items: [Item]

    init(talks: [Talk]) {
        self.title = "Talks"
        let yearFormatter = DateFormatter.monthNameAndYear
        self.items = talks.map { talk in
            Item(
                id: UUID().uuidString,
                name: talk.title,
                year: yearFormatter.string(from: talk.date),
                info: talk.info.map { InfoViewModel(info: $0) }
            )
        }
    }
}

extension TalksViewModel {
    struct Item: Identifiable {
        let id: String
        let name: String
        let year: String
        let info: [InfoViewModel]
    }
}
