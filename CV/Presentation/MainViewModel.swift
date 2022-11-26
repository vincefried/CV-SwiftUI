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
    
    init(person: Person) {
        self.header = HeaderViewModel(person: person)
        self.timelines = [
            TimelineViewModel(jobs: person.jobs),
            TimelineViewModel(educationalBackground: person.educationalBackground),
        ]
    }
}
