//
//  MainViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

final class MainViewModel {
    let header: HeaderViewModel
    let timelines: [TimelineViewModel]
    let skills: SkillsViewModel
    let trainings: TrainingsViewModel
    let interests: InterestsViewModel
    
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
}
