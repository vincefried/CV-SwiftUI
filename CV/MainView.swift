//
//  MainView.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct MainView: View {
    let viewModel: MainViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: .cvExtraLargeSpacing) {
                HeaderView(viewModel: viewModel.header)
                    .frame(height: 236)
                TimelineView(viewModel: viewModel.timeline)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(person: .example))
    }
}
