//
//  CVApp.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

@main
struct CVApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(person: .example))
        }
    }
}
