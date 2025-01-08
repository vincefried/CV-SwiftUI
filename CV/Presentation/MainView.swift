//
//  MainView.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct MainView: View {
    let viewModel: MainViewModel
    
    var body: some View {
        PDFRenderView {
            VStack(spacing: .cvExtraLargeSpacing) {
                header
                jobsTimeline
            }
            .padding(.cvExtraLargeSpacing)
            
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
            .padding(.cvExtraLargeSpacing)
        }
    }
    
    private struct Section<Content: View>: View {
        let title: String
        let content: () -> Content
        
        var body: some View {
            VStack(spacing: .cvSemiLargeSpacing) {
                Text(title)
                    .font(.cvLarge)
                    .foregroundStyle(Color.cvTertiary)
                    .accessibilityAddTraits(.isHeader)
                content()
            }
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
