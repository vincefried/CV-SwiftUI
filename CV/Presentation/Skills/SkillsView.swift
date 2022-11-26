//
//  SkillsView.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

struct SkillsView: View {
    let viewModel: SkillsViewModel

    var body: some View {
        VStack(spacing: .cvSemiLargeSpacing) {
            ForEach(viewModel.percentageSkills) { percentageSkills in
                SkillsPercentView(viewModel: percentageSkills)
            }

            TagView(items: viewModel.basicSkills.items.map(\.name))
        }
    }

    private struct SkillsPercentView: View {
        let viewModel: SkillsViewModel.Percentage

        var body: some View {
            VStack {
                ForEach(viewModel.items) { item in
                    SkillsPercentItemView(viewModel: item)
                }
            }
            .padding(.cvMediumSpacing)
            .font(.cvSemiLargeProminent)
            .foregroundColor(.cvPrimary)
            .background(
                RoundedRectangle(cornerRadius: .cvSmallCornerRadius, style: .continuous)
                    .fill(Color.cvBackground)
            )
            .shadow(color: .cvShadow, radius: 5)
        }

        private struct SkillsPercentItemView: View {
            let viewModel: SkillsViewModel.Percentage.Item

            var body: some View {
                VStack(alignment: .leading, spacing: .cvSmallSpacing) {
                    Text(viewModel.name)
                        .font(.cvSemiLargeProminent)
                        .foregroundColor(.cvPrimary)
                    ProgressView(value: viewModel.percentCompleted)
                        .tint(.cvAccent)
                        .background(Color.cvAccent.opacity(0.3))
                }
            }
        }
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView(viewModel: SkillsViewModel(skills: Person.example.skills))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
