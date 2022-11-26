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
                if !viewModel.hideExportButton {
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

                ForEach(viewModel.timelines) { timeline in
                    Section(title: timeline.title) {
                        TimelineView(viewModel: timeline)
                    }
                }

                HStack(alignment: .top, spacing: .cvExtraLargeSpacing) {
                    Section(title: viewModel.skills.title) {
                        SkillsView(viewModel: viewModel.skills)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Section(title: viewModel.trainings.title) {
                            TrainingsView(viewModel: viewModel.trainings)
                        }

                        Section(title: viewModel.interests.title) {
                            InterestsView(viewModel: viewModel.interests)
                        }
                    }
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
        MainView(viewModel: MainViewModel(person: .me))
    }
}
