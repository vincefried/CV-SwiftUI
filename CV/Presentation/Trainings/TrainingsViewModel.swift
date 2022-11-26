//
//  TrainingsViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

final class TrainingsViewModel {
    let title: String
    let items: [Item]

    init(trainings: [Training]) {
        self.title = "Trainings & Conferences"
        let yearFormatter = DateFormatter.year
        self.items = trainings.map { training in
            Item(
                id: UUID().uuidString,
                name: training.name,
                year: yearFormatter.string(from: training.date),
                info: training.info.map(\.bulletPointFormatted)
            )
        }
    }
}

extension TrainingsViewModel {
    struct Item: Identifiable {
        let id: String
        let name: String
        let year: String
        let info: [String]
    }
}
