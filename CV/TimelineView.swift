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
                if let title = viewModel.title {
                    Text(title)
                        .font(.cvExtraLarge)
                        .foregroundColor(.cvPrimary)
                }
                
                HStack {
                    Text(viewModel.subtitle)
                        .font(.cvLarge)
                        .foregroundColor(.cvPrimary)
                    Text("•")
                        .font(.cvLarge)
                        .foregroundColor(.cvAccent)
                    if let additionalSubtitle = viewModel.additionalSubtitle {
                        Text(additionalSubtitle)
                            .font(.cvLarge)
                            .foregroundColor(.cvSecondary)
                    }
                    Spacer()
                    DateView(date: viewModel.timeframe)
                }

                VStack(spacing: .cvExtraSmallSpacing) {
                    ForEach(viewModel.info, id: \.self) { info in
                        Text(info)
                            .font(.cvSemiLarge)
                            .foregroundColor(.cvSecondary)
                    }
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
