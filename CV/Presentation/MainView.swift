//
//  MainView.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    @State private var scrollPosition: MainViewModel.PageIDs?
    
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

                VStack(spacing: .cvExtraLargeSpacing) {
                    header
                    jobsTimeline
                }
                .id(MainViewModel.PageIDs.one)

                VStack(spacing: .cvExtraLargeSpacing) {
                    educationTimeline
                    
                    HStack(alignment: .top, spacing: .cvExtraLargeSpacing) {
                        skills
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: .cvExtraLargeSpacing) {
                            trainings
                            talks
                            interests
                        }
                    }
                }
                .id(MainViewModel.PageIDs.two)
                .safeAreaPadding()
                .containerRelativeFrame(.vertical, alignment: .top)

                if viewModel.isSnapshotting {
                    FooterView()
                        .padding(.top, .cvExtraLargeSpacing)
                }
            }
            .padding(.cvExtraLargeSpacing)
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition, anchor: .top)
        .onTapGesture {
            scrollPosition = .two
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
    
    private var header: some View {
        HeaderView(viewModel: viewModel.header)
            .accessibilityElement(children: .contain)
    }
    
    private var jobsTimeline: some View {
        Section(title: viewModel.jobsTimeline.title) {
            TimelineView(viewModel: viewModel.jobsTimeline)
        }
        .accessibilityElement(children: .contain)
    }
    
    private var educationTimeline: some View {
        Section(title: viewModel.educationTimeline.title) {
            TimelineView(viewModel: viewModel.educationTimeline)
        }
        .accessibilityElement(children: .contain)
    }
    
    private var skills: some View {
        Section(title: viewModel.skills.title) {
            SkillsView(viewModel: viewModel.skills)
        }
        .accessibilityElement(children: .contain)
    }
    
    private var trainings: some View {
        Section(title: viewModel.trainings.title) {
            TrainingsView(viewModel: viewModel.trainings)
        }
        .accessibilityElement(children: .contain)
    }
    
    private var talks: some View {
        Section(title: viewModel.talks.title) {
            TalksView(viewModel: viewModel.talks)
        }
        .accessibilityElement(children: .contain)
    }
    
    private var interests: some View {
        Section(title: viewModel.interests.title) {
            InterestsView(viewModel: viewModel.interests)
        }
        .accessibilityElement(children: .contain)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(person: .me))
    }
}
