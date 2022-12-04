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
    let sections: [Section]
    
    init(jobs: [Job]) {
        self.id = UUID().uuidString
        self.title = "Employment History"

        let jobSections: [TimelineViewModel.Section] = Dictionary(grouping: jobs, by: \.companyName)
            .sorted { lhs, rhs in
                guard let lhsFirstJob = lhs.value.first, let rhsFirstJob = rhs.value.first else {
                    return false
                }

                return lhsFirstJob.startDate > rhsFirstJob.startDate
            }
            .map { companyName, jobs in
                let items = jobs
                    .map { job in
                        var additionalTitle: TimelineViewModel.Item.AdditionalTitle? = nil
                        if !job.programmingLanguages.isEmpty {
                            additionalTitle = TimelineViewModel.Item.AdditionalTitle(
                                content: job.programmingLanguages.map(\.localized).joined(separator: ", "),
                                spokenContent: job.programmingLanguages.map(\.spoken).joined(separator: ", ")
                            )
                        }

                        return TimelineViewModel.Item(
                            id: UUID().uuidString,
                            title: job.role,
                            additionalTitle: additionalTitle,
                            timeframe: Self.formattedTimeframe(periodOfLife: job),
                            info: job.info.map { InfoViewModel(bulletPoint: ">", content: $0) }
                        )
                    }

                let section = TimelineViewModel.Section(
                    id: UUID().uuidString,
                    title: companyName,
                    items: items
                )

                return section
            }

        self.sections = jobSections
    }

    init(educationalBackground: [Education]) {
        self.id = UUID().uuidString
        self.title = "Education"

        let educationalBackgroundSections: [TimelineViewModel.Section] = Dictionary(grouping: educationalBackground, by: \.institutionName)
            .map { institutionName, educations in
                let items = educations
                    .map { education in
                        var info = [String]()
                        switch education.seekedDegree {
                        case .abitur(let graduation):
                            info.append(graduation.localizedFinalGrade)
                        case .bachelor(let graduation):
                            guard let graduation else { break }
                            info.append(graduation.localizedFinalGrade)
                            info.append(graduation.localizedTopicOfFinalThesis)
                        }

                        var additionalTitle: TimelineViewModel.Item.AdditionalTitle? = nil
                        if let programOfStudy = education.programOfStudy, !programOfStudy.isEmpty {
                            additionalTitle = TimelineViewModel.Item.AdditionalTitle(
                                content: programOfStudy,
                                spokenContent: programOfStudy
                            )
                        }

                        return TimelineViewModel.Item(
                            id: UUID().uuidString,
                            title: education.seekedDegree.localized,
                            additionalTitle: additionalTitle,
                            timeframe: Self.formattedTimeframe(periodOfLife: education),
                            info: info.map { InfoViewModel(bulletPoint: ">", content: $0) }
                        )
                    }

                let section = TimelineViewModel.Section(
                    id: UUID().uuidString,
                    title: institutionName,
                    items: items
                )

                return section
            }
        
        self.sections = educationalBackgroundSections
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
    struct Section: Identifiable, Equatable {
        let id: String
        let title: String
        let items: [Item]
    }
}

extension TimelineViewModel {
    struct Item: Identifiable, Equatable {
        let id: String
        let title: String
        let additionalTitle: AdditionalTitle?
        let timeframe: String
        let info: [InfoViewModel]

        struct AdditionalTitle: Equatable {
            let content: String
            let spokenContent: String
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

    fileprivate var spoken: String {
        switch self {
        case .swift:
            return "Swift"
        case .objC:
            return "Objective C"
        case .cSharp:
            return "C sharp"
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
