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

    init(bulletPoint: String, content: String) {
        self.bulletPoint = bulletPoint
        self.content = content
    }
    
    init(info: String) {
        self.bulletPoint = ">"
        self.content = info
    }
    
    var formattedContent: String {
        "\(bulletPoint) \(content)"
    }
}
