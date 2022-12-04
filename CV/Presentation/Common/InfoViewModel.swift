//
//  InfoViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 04.12.22.
//

import Foundation

struct InfoViewModel: Equatable {
    let bulletPoint: String
    let content: String

    var formattedContent: String {
        "\(bulletPoint) \(content)"
    }
}
