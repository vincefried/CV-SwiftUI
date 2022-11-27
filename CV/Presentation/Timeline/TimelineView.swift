//
//  TimelineView.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct TimelineView: View {
    private enum Constant {
        static let timelineStrokeWidth: CGFloat = 4
        static let timelineDotSize = CGSize(width: 22, height: 22)
    }

    let viewModel: TimelineViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: .cvSemiLargeSpacing) {
                ForEach(viewModel.items) { item in
                    if item == viewModel.items.last {
                        TimelineItemView(viewModel: item)
                            .anchorPreference(
                                key: TimelineDotPreferenceKey.self,
                                value: .bounds
                            ) { $0 }
                    } else {
                        TimelineItemView(viewModel: item)
                    }
                }
            }
        }
        .overlayPreferenceValue(TimelineDotPreferenceKey.self) { preferences in
            GeometryReader { geometry in
                preferences.map { anchor in
                    timelineStroke
                        .frame(height: geometry.size.height - geometry[anchor].height)
                        .offset(
                            x: Constant.timelineDotSize.width / 2 - Constant.timelineStrokeWidth / 2,
                            y: Constant.timelineDotSize.height / 2
                        )
                }
            }
        }
    }

    private var timelineStroke: some View {
        Rectangle()
            .fill(Color.cvAccent)
            .frame(width: Constant.timelineStrokeWidth)
    }

    private struct TimelineItemView: View {
        let viewModel: TimelineViewModel.Item
        
        var body: some View {
            HStack(alignment: .titleAndTimelineRectangle, spacing: .cvExtraLargeSpacing) {
                timelineDot
                    .opacity(viewModel.showsTitle ? 1.0 : 0.0)
                content
            }
        }

        private var timelineDot: some View {
            RoundedRectangle(cornerRadius: .cvSmallCornerRadius, style: .continuous)
                .fill(Color.cvAccent)
                .frame(width: Constant.timelineDotSize.width, height: Constant.timelineDotSize.height)
                .alignmentGuide(.titleAndTimelineRectangle) { d in
                    d[VerticalAlignment.center]
                }
        }

        private var content: some View {
            VStack(alignment: .leading, spacing: .cvSmallSpacing) {
                if let title = viewModel.title {
                    Text(title)
                        .font(.cvExtraLarge)
                        .foregroundColor(.cvPrimary)
                        .alignmentGuide(.titleAndTimelineRectangle) { d in
                            d[VerticalAlignment.center]
                        }
                }

                HStack {
                    Text(viewModel.subtitle)
                        .font(.cvLarge)
                        .foregroundColor(.cvPrimary)
                    if let additionalSubtitle = viewModel.additionalSubtitle {
                        Text("•")
                            .font(.cvLarge)
                            .foregroundColor(.cvAccent)
                        Text(additionalSubtitle)
                            .font(.cvLarge)
                            .foregroundColor(.cvSecondary)
                    }
                    Spacer()
                    DateView(date: viewModel.timeframe)
                }

                if !viewModel.info.isEmpty {
                    VStack(alignment: .leading, spacing: .cvExtraSmallSpacing) {
                        ForEach(viewModel.info, id: \.self) { info in
                            Text(info)
                                .font(.cvSemiLarge)
                                .foregroundColor(.cvSecondary)
                        }
                    }
                }
            }
        }
    }
}

struct TimelineDotPreferenceKey: PreferenceKey {
    typealias Value = Anchor<CGRect>?

    static var defaultValue: Value = nil

    static func reduce(
        value: inout Value,
        nextValue: () -> Value
    ) {
        value = nextValue()
    }
}

extension VerticalAlignment {
    fileprivate struct TitleAndTimelineRectangle: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }

    fileprivate static let titleAndTimelineRectangle = VerticalAlignment(TitleAndTimelineRectangle.self)
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(viewModel: TimelineViewModel(jobs: Person.me.jobs))
    }
}
