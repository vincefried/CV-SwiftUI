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
        VStack(alignment: .leading) {
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
                        .foregroundColor(.cvPrimary)
                    Spacer()
                    DateView(date: viewModel.year)
                }
                ForEach(viewModel.info, id: \.self) { info in
                    Text(info)
                        .font(.cvSemiLarge)
                        .foregroundColor(.cvSecondary)
                }
            }
        }
    }
}

struct TrainingsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsView(viewModel: TrainingsViewModel(trainings: Person.me.trainings))
            .previewLayout(.sizeThatFits)
    }
}
