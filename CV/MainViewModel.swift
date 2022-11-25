//
//  MainViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

final class MainViewModel {
    let header: HeaderViewModel
    
    init(person: Person) {
        self.header = HeaderViewModel(person: person)
    }
}
