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
        VStack(alignment: .leading, spacing: .cvSemiLargeSpacing) {
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
            .foregroundStyle(Color.cvPrimary)
            .overlay(
                RoundedRectangle(cornerRadius: .cvSmallCornerRadius)
                    .stroke(Color.cvTertiary.opacity(0.3))
            )
        }

        private struct SkillsPercentItemView: View {
            let viewModel: SkillsViewModel.Percentage.Item

            var body: some View {
                VStack(alignment: .leading, spacing: .cvSmallSpacing) {
                    Text(viewModel.name)
                        .font(.cvSemiLargeProminent)
                        .foregroundStyle(Color.cvPrimary)
                    CVProgressView(
                        value: viewModel.percentCompleted,
                        tintColor: .cvAccent,
                        backgroundColor: .cvQuaternary
                    )
                }
                .accessibilityElement(children: .combine)
            }
        }
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView(viewModel: SkillsViewModel(skills: Person.me.skills))
            .padding()
            .previewLayout(.fixed(width: 300, height: 500))
    }
}
