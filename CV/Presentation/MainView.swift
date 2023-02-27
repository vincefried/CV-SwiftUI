//
//  MainView.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: .cvExtraLargeSpacing) {
                if !viewModel.isSnapshotting {
                    if let shareURL = viewModel.shareURL {
                        ShareLink(item: shareURL)
                            .font(.cvSemiLarge)
                            .foregroundColor(.cvAccent)
                    } else {
                        Text("Snapshotting...")
                            .font(.cvSemiLarge)
                            .foregroundColor(.cvTertiary)
                    }
                }

                HeaderView(viewModel: viewModel.header)
                    .padding(.top, viewModel.isSnapshotting ? .cvSmallSpacing : .zero)
                    .accessibilityElement(children: .contain)

                ForEach(viewModel.timelines) { timeline in
                    Section(title: timeline.title) {
                        TimelineView(viewModel: timeline)
                    }
                    .accessibilityElement(children: .contain)
                }
                .padding(.bottom, .cvExtraLargeSpacing)

                HStack(alignment: .top, spacing: .cvExtraLargeSpacing) {
                    Section(title: viewModel.skills.title) {
                        SkillsView(viewModel: viewModel.skills)
                    }
                    .accessibilityElement(children: .contain)

                    Spacer()

                    VStack(alignment: .leading) {
                        Section(title: viewModel.trainings.title) {
                            TrainingsView(viewModel: viewModel.trainings)
                        }
                        .accessibilityElement(children: .contain)

                        Section(title: viewModel.interests.title) {
                            InterestsView(viewModel: viewModel.interests)
                        }
                        .accessibilityElement(children: .contain)
                    }
                }

                if viewModel.isSnapshotting {
                    FooterView()
                        .padding(.top, .cvExtraLargeSpacing)
                }
            }
            .padding(.cvExtraLargeSpacing)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                viewModel.handleOnAppear(view: self)
            }
        }
    }

    private struct Section<Content: View>: View {
        let title: String
        let content: () -> Content

        var body: some View {
            VStack(spacing: .cvSemiLargeSpacing) {
                Text(title)
                    .font(.cvLarge)
                    .foregroundColor(.cvTertiary)
                    .accessibilityAddTraits(.isHeader)
                content()
            }
        }
    }

    private struct FooterView: View {
        var body: some View {
            Text("This CV was generated in SwiftUI ✨")
                .font(.cvMedium)
                .foregroundColor(.cvTertiary)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(person: .me))
    }
}
