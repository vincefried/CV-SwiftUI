//
//  TimelineViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

final class TimelineViewModel {
    let items: [Item]
    
    init(jobs: [Job]) {
        self.items = jobs.map(TimelineViewModel.Item.init)
    }
}

extension TimelineViewModel {
    final class Item: Identifiable {
        let id: String
        let title: String
        let subtitle: String
        let additionalSubtitle: String?
        let timeframe: String
        
        init(job: Job) {
            self.id = UUID().uuidString
            self.title = job.companyName
            self.subtitle = job.role
            self.additionalSubtitle = job.programmingLanguages.map(\.localized).joined(separator: ",")
            
            let timeframeDateFormatter = DateFormatter()
            timeframeDateFormatter.dateStyle = .short
            let formattedStartDate = timeframeDateFormatter.string(from: job.startDate)
            let formattedEndDate = job.endDate.map { timeframeDateFormatter.string(from: $0) } ?? "Today"
            self.timeframe = "\(formattedStartDate) - \(formattedEndDate)"
        }
    }
}

extension ProgrammingLanguage {
    fileprivate var localized: String {
        switch self {
        case .swift:
            return "Swift"
        case .objC:
            return "Obj-C"
        case .cSharp:
            return "C#"
        case .java:
            return "Java"
        case .c:
            return "C"
        }
    }
}
