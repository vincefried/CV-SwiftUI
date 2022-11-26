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
        let groupedJobs: [(job: Job, showsTitle: Bool)] = Dictionary(grouping: jobs, by: \.companyName)
            .flatMap { _, jobs in
                jobs
                    .enumerated()
                    .map { (job: $0.element, showsTitle: $0.offset == 0) }
            }
        let sortedJobs = groupedJobs.sorted { $0.job.startDate > $1.job.startDate }
        self.items = sortedJobs.map { TimelineViewModel.Item(job: $0.job, showsTitle: $0.showsTitle) }
    }
}

extension TimelineViewModel {
    struct Item: Identifiable, Equatable {
        let id: String
        let title: String?
        let subtitle: String
        let additionalSubtitle: String?
        let timeframe: String
        let info: [String]

        var showsTitle: Bool {
            title != nil
        }
        
        init(job: Job, showsTitle: Bool) {
            self.id = UUID().uuidString
            self.title = showsTitle ? job.companyName : nil
            self.subtitle = job.role
            self.additionalSubtitle = job.programmingLanguages.map(\.localized).joined(separator: ",")
            
            let timeframeDateFormatter = DateFormatter()
            timeframeDateFormatter.dateFormat = "MMMM yyyy"
            let formattedStartDate = timeframeDateFormatter.string(from: job.startDate)
            let formattedEndDate = job.endDate.map { timeframeDateFormatter.string(from: $0) } ?? "Today"
            let formattedDatesAreSame = formattedStartDate == formattedEndDate
            self.timeframe = formattedDatesAreSame ? formattedStartDate : "\(formattedStartDate) - \(formattedEndDate)"

            self.info = job.info.map { "> \($0)" }
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
