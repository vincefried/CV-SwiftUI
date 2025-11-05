//
//  MainViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct MainViewModel {
    let header: HeaderViewModel
    let jobsTimeline: TimelineViewModel
    let educationTimeline: TimelineViewModel
    let skills: SkillsViewModel
    let trainings: TrainingsViewModel
    let interests: InterestsViewModel
    let talks: TalksViewModel
    let voluntaryWork: VoluntaryWorkViewModel

    init(person: Person) {
        self.header = HeaderViewModel(person: person)
        self.jobsTimeline = TimelineViewModel(jobs: person.jobs)
        self.educationTimeline = TimelineViewModel(educationalBackground: person.educationalBackground)
        self.skills = SkillsViewModel(skills: person.skills)
        self.trainings = TrainingsViewModel(trainings: person.trainings)
        self.interests = InterestsViewModel(interests: person.interests)
        self.talks = TalksViewModel(talks: person.talks)
        self.voluntaryWork = VoluntaryWorkViewModel(voluntaryWorkItems: person.voluntaryWork)
    }
}
