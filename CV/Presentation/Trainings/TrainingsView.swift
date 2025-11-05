//
//  TrainingsView.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

struct TrainingsView: View {
    let viewModel: TrainingsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: .cvMediumSpacing) {
            ForEach(viewModel.items) { item in
                Item(viewModel: item)
            }
        }
    }

    private struct Item: View {
        let viewModel: TrainingsViewModel.Item

        var body: some View {
            VStack(alignment: .leading, spacing: .cvSemiSmallSpacing) {
                HStack {
                    Text(viewModel.name)
                        .font(.cvLarge)
                        .foregroundStyle(Color.cvPrimary)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    DateView(date: viewModel.year)
                }
                .accessibilityElement(children: .combine)

                ForEach(viewModel.info, id: \.self.content) { info in
                    Text(info.formattedContent)
                        .font(.cvSemiLarge)
                        .foregroundStyle(Color.cvSecondary)
                        .accessibilityLabel(info.content)
                }
            }
            .accessibilityElement(children: .contain)
        }
    }
}

struct TrainingsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsView(viewModel: TrainingsViewModel(trainings: Person.me.trainings))
            .previewLayout(.sizeThatFits)
    }
}
