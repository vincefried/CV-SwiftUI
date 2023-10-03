//
//  TalksView.swift
//  CV
//
//  Created by Vincent Friedrich on 03.10.23.
//

import SwiftUI

struct TalksView: View {
    let viewModel: TalksViewModel

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.items) { item in
                Item(viewModel: item)
            }
        }
    }

    private struct Item: View {
        let viewModel: TalksViewModel.Item

        var body: some View {
            VStack(alignment: .leading, spacing: .cvSemiSmallSpacing) {
                HStack {
                    Text(viewModel.name)
                        .font(.cvLarge)
                        .foregroundColor(.cvPrimary)
                    Spacer()
                    DateView(date: viewModel.year)
                }
                .accessibilityElement(children: .combine)

                ForEach(viewModel.info, id: \.self.content) { info in
                    Text(info.formattedContent)
                        .font(.cvSemiLarge)
                        .foregroundColor(.cvSecondary)
                        .accessibilityLabel(info.content)
                }
            }
            .accessibilityElement(children: .contain)
        }
    }
}

struct TalksView_Previews: PreviewProvider {
    static var previews: some View {
        TalksView(viewModel: TalksViewModel(talks: Person.me.talks))
            .previewLayout(.sizeThatFits)
    }
}
