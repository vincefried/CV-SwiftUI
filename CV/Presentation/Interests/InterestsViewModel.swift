//
//  InterestsViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

final class InterestsViewModel {
    let title: String
    let items: [Item]

    init(interests: [Interest]) {
        self.title = "Interests"
        self.items = interests.map { Item(name: $0) }
    }
}

extension InterestsViewModel {
    struct Item {
        let name: String
    }
}
