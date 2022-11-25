//
//  TimelineView.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct TimelineView: View {
    let viewModel: TimelineViewModel
    
    var body: some View {
        LazyVStack(spacing: .cvExtraLargeSpacing) {
            ForEach(viewModel.items) { item in
                TimelineItemView(viewModel: item)
            }
        }
    }
    
    private struct TimelineItemView: View {
        let viewModel: TimelineViewModel.Item
        
        var body: some View {
            VStack(alignment: .leading, spacing: .cvMediumSpacing) {
                Text(viewModel.title)
                    .font(.cvExtraLarge)
                    .foregroundColor(.cvPrimary)
                
                HStack {
                    Text(viewModel.subtitle)
                        .font(.cvLarge)
                        .foregroundColor(.cvPrimary)
                    Text("•")
                        .foregroundColor(.cvAccent)
                    if let additionalSubtitle = viewModel.additionalSubtitle {
                        Text(additionalSubtitle)
                            .font(.cvLarge)
                            .foregroundColor(.cvSecondary)
                    }
                    Spacer()
                    DateView(date: viewModel.timeframe)
                }
            }
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(viewModel: TimelineViewModel(jobs: Person.example.jobs))
    }
}
