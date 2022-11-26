//
//  TagView.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

struct TagView: View {
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    let items: [String]

    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: .cvSemiSmallSpacing) {
            ForEach(items, id: \.self) { item in
                Item(title: item)
            }
        }
    }

    private struct Item: View {
        let title: String

        var body: some View {
            Text(title)
                .padding([.leading, .trailing], .cvMediumSpacing)
                .padding([.top, .bottom], .cvSmallSpacing)
                .font(.cvSemiLargeProminent)
                .foregroundColor(.cvPrimary)
                .background(
                    Capsule(style: .continuous)
                        .fill(Color.cvBackground)
                )
                .shadow(color: .cvShadow, radius: 2)
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(items: ["Test1", "Test2", "Test3"])
    }
}
