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

                ForEach(viewModel.timelines) { timeline in
                    Section(title: timeline.title) {
                        TimelineView(viewModel: timeline)
                    }
                }
            }
            .padding(.cvExtraLargeSpacing)
        }
    }

    private struct Section<Content: View>: View {
        let title: String
        let content: () -> Content

        var body: some View {
            VStack(spacing: .cvLargeSpacing) {
                Text(title)
                    .font(.cvLarge)
                    .foregroundColor(.cvTertiary)
                content()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(person: .example))
    }
}