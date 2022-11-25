//
//  MainViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

final class MainViewModel {
    let header: HeaderViewModel
    let timeline: TimelineViewModel
    
    init(person: Person) {
        self.header = HeaderViewModel(person: person)
        self.timeline = TimelineViewModel(jobs: person.jobs)
    }
}
