//
//  MainViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    let header: HeaderViewModel
    let timelines: [TimelineViewModel]
    let skills: SkillsViewModel
    let trainings: TrainingsViewModel
    let interests: InterestsViewModel

    @Published var hideExportButton = false
    @Published var shareURL: URL?

    init(person: Person) {
        self.header = HeaderViewModel(person: person)
        self.timelines = [
            TimelineViewModel(jobs: person.jobs),
            TimelineViewModel(educationalBackground: person.educationalBackground),
        ]
        self.skills = SkillsViewModel(skills: person.skills)
        self.trainings = TrainingsViewModel(trainings: person.trainings)
        self.interests = InterestsViewModel(interests: person.interests)
    }

    func handleOnAppear(view: MainView) {
        guard shareURL == nil else { return }
        renderPDF(view: view)
    }

    private func renderPDF(view: MainView) {
        hideExportButton = true

        let pdfRenderer = PDFRenderer(view: view)
        shareURL = pdfRenderer.renderPDF()

        hideExportButton = false
    }
}
