//
//  VoluntaryWorkView.swift
//  CV
//
//  Created by Vincent Friedrich on 05.11.25.
//

import SwiftUI

struct VoluntaryWorkView: View {
    let viewModel: VoluntaryWorkViewModel

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.items) { item in
                Item(viewModel: item)
            }
        }
    }

    private struct Item: View {
        let viewModel: VoluntaryWorkViewModel.Item

        var body: some View {
            VStack(alignment: .leading, spacing: .cvSemiSmallSpacing) {
                HStack {
                    Text(viewModel.organization)
                        .font(.cvLarge)
                        .foregroundStyle(Color.cvPrimary)
                    Spacer()
                    DateView(date: viewModel.date)
                        .fixedSize()
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

struct VoluntaryWorkViewView_Previews: PreviewProvider {
    static var previews: some View {
        VoluntaryWorkView(viewModel: VoluntaryWorkViewModel(voluntaryWorkItems: Person.me.voluntaryWork))
            .previewLayout(.sizeThatFits)
    }
}
