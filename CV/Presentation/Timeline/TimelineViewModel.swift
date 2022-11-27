//
//  TimelineViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

struct TimelineViewModel: Identifiable {
    let id: String
    let title: String
    let items: [Item]
    
    init(jobs: [Job]) {
        self.id = UUID().uuidString
        self.title = "Employment History"

        let groupedJobs: [(job: Job, showsTitle: Bool)] = Dictionary(grouping: jobs, by: \.companyName)
            .flatMap { _, jobs in
                jobs
                    .enumerated()
                    .map { (job: $0.element, showsTitle: $0.offset == 0) }
            }
        let sortedJobs = groupedJobs.sorted { $0.job.startDate > $1.job.startDate }
        self.items = sortedJobs.map { job, showsTitle in
            TimelineViewModel.Item(
                id: UUID().uuidString,
                title: showsTitle ? job.companyName : nil,
                subtitle: job.role,
                additionalSubtitle: job.programmingLanguages.isEmpty ? nil : job.programmingLanguages.map(\.localized).joined(separator: ", "),
                timeframe: Self.formattedTimeframe(periodOfLife: job),
                info: job.info.map(\.bulletPointFormatted)
            )
        }
    }

    init(educationalBackground: [Education]) {
        self.id = UUID().uuidString
        self.title = "Education"

        let groupedEducationalBackground: [(education: Education, showsTitle: Bool)] = Dictionary(grouping: educationalBackground, by: \.institutionName)
            .flatMap { _, educationalBackground in
                educationalBackground
                    .enumerated()
                    .map { (education: $0.element, showsTitle: $0.offset == 0) }
            }
        let sortedEducationalBackground = groupedEducationalBackground.sorted { $0.education.startDate > $1.education.startDate }
        self.items = sortedEducationalBackground.map { education, showsTitle in
            var info = [String]()
            switch education.seekedDegree {
            case .abitur(let graduation):
                info.append(graduation.localizedFinalGrade)
            case .bachelor(let graduation):
                guard let graduation else { break }
                info.append(graduation.localizedFinalGrade)
                info.append(graduation.localizedTopicOfFinalThesis)
            }

            return TimelineViewModel.Item(
                id: UUID().uuidString,
                title: showsTitle ? education.institutionName : nil,
                subtitle: education.seekedDegree.localized,
                additionalSubtitle: education.programOfStudy?.isEmpty == true ? nil : education.programOfStudy,
                timeframe: Self.formattedTimeframe(periodOfLife: education),
                info: info.map(\.bulletPointFormatted)
            )
        }
    }

    private static func formattedTimeframe(periodOfLife: PeriodOfLife) -> String {
        let timeframeDateFormatter = DateFormatter.monthNameAndYear
        let formattedStartDate = timeframeDateFormatter.string(from: periodOfLife.startDate)
        let formattedEndDate = periodOfLife.endDate.map { timeframeDateFormatter.string(from: $0) } ?? "Today"
        let formattedDatesAreSame = formattedStartDate == formattedEndDate
        return formattedDatesAreSame ? formattedStartDate : "\(formattedStartDate) - \(formattedEndDate)"
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

extension Education.Degree {
    fileprivate var localized: String {
        switch self {
        case .abitur:
            return "Abitur"
        case .bachelor:
            return "Bachelor of Science"
        }
    }
}

extension Graduation {
    fileprivate var localizedFinalGrade: String {
        "Final grade: \(finalGrade)"
    }
}

extension Education.Degree.UniversityGraduation {
    fileprivate var localizedTopicOfFinalThesis: String {
        "Topic of bachelor thesis: \"\(topicOfFinalThesis)\". Grade: \(gradeOfFinalThesis)."
    }
}
